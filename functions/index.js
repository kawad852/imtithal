/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */
/* eslint-disable require-jsdoc */
/* eslint-disable quotes */
/* eslint-disable eol-last */


const ALGOLIA_APP_ID = 'A8ZSH6H4WN';
const ALGOLIA_ADMIN_KEY = 'deccda5b1c9c370107b978ec8e7f63db';
const ALGOLIA_DEPARTMENTS_INDEX = 'departments';
const ALGOLIA_VIOLATIONS_INDEX = 'violations';

const admin = require("firebase-admin");
const { onCall } = require("firebase-functions/v2/https");
const { onDocumentCreated, onDocumentUpdated, onDocumentDeleted } = require("firebase-functions/v2/firestore");
const { algoliasearch } = require("algoliasearch");
const { onSchedule } = require("firebase-functions/v2/scheduler");
const { getFirestore, Timestamp, Filter } = require("firebase-admin/firestore");
const dayjs = require("dayjs");
const utc = require("dayjs/plugin/utc");
const timezone = require("dayjs/plugin/timezone");

const { isHoliday, createAssignedTasksForUser } = require("./utils");

dayjs.extend(utc);
dayjs.extend(timezone);
dayjs.tz.setDefault("Asia/Amman");

admin.initializeApp();
const db = getFirestore();

const client = algoliasearch(ALGOLIA_APP_ID, ALGOLIA_ADMIN_KEY);

exports.createUser = onCall({region: "europe-west3"},
    async (request) => {
      try {
        const payload = request.data;
        const email = payload.email;
        const password = payload.password;
        const isAdmin = payload.admin || true;

        console.log("Payload:", payload);
        console.log("Received email:", email);
        console.log("Received password:", password);
        const user = await admin.auth().createUser({
          email: email,
          password: password,
        });
        await admin.auth().setCustomUserClaims(user.uid, {admin: isAdmin});
        return {uid: user.uid};
      } catch (error) {
        console.log("error deleting user", error);
      }
    });


// 📌 On Create
exports.onDepartmentCreated = onDocumentCreated({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
  }, async (event) => {
    const data = event.data.data();
    const objectID = data.id;
    const companyId = event.params.companyId;

    try {
    await client.saveObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      body: {
        objectID,
        ...data,
        companyId,
      },
    });
      console.log(`✅ Created: ${objectID} added to Algolia`);
    } catch (error) {
      console.error(`❌ Error adding ${objectID} to Algolia`, error);
    }
  },
);

// 📌 On Update
exports.onDepartmentUpdated = onDocumentUpdated({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
}, async (event) => {
  const newData = event.data.after.data();
  const objectID = newData.id;
  const companyId = event.params.companyId;

  try {
    await client.saveObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      body: {
        objectID,
        ...newData,
        companyId,
      },
    });
    console.log(`✅ Updated: ${objectID} updated in Algolia`);
  } catch (error) {
    console.error(`❌ Error updating ${objectID} in Algolia`, error);
  }
});

// 📌 On Delete
exports.onDepartmentDeleted = onDocumentDeleted({
  region: "europe-west3",
  document: 'companies/{companyId}/departments/{departmentId}',
}, async (event) => {
  // Assuming the objectID is stored in the deleted document data
  const oldData = event.data.data();
  const objectID = oldData.id;

  try {
    await client.deleteObject({
      indexName: ALGOLIA_DEPARTMENTS_INDEX,
      objectID,
    });
    console.log(`✅ Deleted: ${objectID} removed from Algolia`);
  } catch (error) {
    console.error(`❌ Error deleting ${objectID} from Algolia`, error);
  }
});


// 📌 On Create
exports.onViolationCreated = onDocumentCreated({
  region: "europe-west3",
  document: 'users/{userId}/violations/{violationId}',
  }, async (event) => {
    const data = event.data.data();
    const objectID = data.id;

    try {
    await client.saveObject({
      indexName: ALGOLIA_VIOLATIONS_INDEX,
      body: {
        objectID,
        ...data,
      },
    });
      console.log(`✅ Created: ${objectID} added to Algolia`);
    } catch (error) {
      console.error(`❌ Error adding ${objectID} to Algolia`, error);
    }
  },
);

// 📌 On Update
exports.onViolationUpdated = onDocumentUpdated({
  region: "europe-west3",
  document: 'users/{userId}/violations/{violationId}',
}, async (event) => {
  const newData = event.data.after.data();
  const objectID = newData.id;

  try {
    await client.saveObject({
      indexName: ALGOLIA_VIOLATIONS_INDEX,
      body: {
        objectID,
        ...newData,
      },
    });
    console.log(`✅ Updated: ${objectID} updated in Algolia`);
  } catch (error) {
    console.error(`❌ Error updating ${objectID} in Algolia`, error);
  }
});

// 📌 On Delete
exports.onViolationDeleted = onDocumentDeleted({
  region: "europe-west3",
  document: 'users/{userId}/violations/{violationId}',
}, async (event) => {
  // Assuming the objectID is stored in the deleted document data
  const oldData = event.data.data();
  const objectID = oldData.id;

  try {
    await client.deleteObject({
      indexName: ALGOLIA_VIOLATIONS_INDEX,
      objectID,
    });
    console.log(`✅ Deleted: ${objectID} removed from Algolia`);
  } catch (error) {
    console.error(`❌ Error deleting ${objectID} from Algolia`, error);
  }
});


exports.onTasksUpdate = onDocumentUpdated({
  region: "europe-west3",
  document: "tasks/{taskId}",
}, async (event) => {
  const beforeData = event.data.before.data();
  const newData = event.data.after.data();
  const taskId = event.params.taskId;

  const beforeAssigned = beforeData.assignedUserIds || [];
  const afterAssigned = newData.assignedUserIds || [];

  const removedUserIds = beforeAssigned.filter((id) => !afterAssigned.includes(id));
  const addedUserIds = afterAssigned.filter((id) => !beforeAssigned.includes(id));

  const db = admin.firestore();

  // Step 1: Delete removed users' assignedTasks & violations
  const deleteAssignedAndViolationsPromises = removedUserIds.map(async (userId) => {
    const userRef = db.collection("users").doc(userId);

    const assignedTasksSnap = await userRef
      .collection("assignedTasks")
      .where("parentTaskId", "==", taskId)
      .get();
    const assignedTasksDeletions = assignedTasksSnap.docs.map((doc) => doc.ref.delete());

    const violationsSnap = await userRef
      .collection("violations")
      .where("taskId", "==", taskId)
      .get();
    const violationsDeletions = violationsSnap.docs.map((doc) => doc.ref.delete());

    return Promise.all([...assignedTasksDeletions, ...violationsDeletions]);
  });

  await Promise.all(deleteAssignedAndViolationsPromises);

  // Step 2: Handle added users – generate assignedTasks
  if (addedUserIds.length === 0) return;

  const {
    repeatType,
    companyId,
    weeklyDays = [],
    monthlyDays = [],
  } = newData;

  const holidaysSnap = await db.collection(`companies/${companyId}/holidays`).get();
  const holidays = holidaysSnap.docs.map((doc) => doc.data());

  const companyRef = db.collection("companies").doc(companyId);

  await db.runTransaction(async (tx) => {
    const companySnap = await tx.get(companyRef);
    const companyData = companySnap.data() || {};
    const rowId = (companyData.rowId && companyData.rowId.assignedTaskId) || 1;
    const currentIdRef = { value: rowId };

    for (const userId of newData.assignedUserIds || []) {
      if (!addedUserIds.includes(userId)) continue;

      const dates = [];

      for (let i = 0; i < 7; i++) {
        const date = dayjs().add(i, "day");
        const weekday = date.format("dddd");

        if (isHoliday(date, holidays)) continue;

        if (repeatType === "ONCE" && i === 0) {
          dates.push(date);
        } else if (repeatType === "DAILY") {
          dates.push(date);
        } else if (repeatType === "WEEKLY" && weeklyDays.includes(weekday)) {
          dates.push(date);
        } else if (repeatType === "MONTHLY" && monthlyDays.includes(String(date.date()))) {
          dates.push(date);
        }
      }

      await createAssignedTasksForUser({
        db,
        tx,
        userId,
        task: newData,
        parentTaskId: taskId,
        companyRef,
        currentIdRef,
        dates,
      });
    }

    tx.update(companyRef, { "rowId.assignedTaskId": currentIdRef.value });
  });

  return;
});

/**
 * Scheduled function to mark assigned tasks as late.
 */
exports.markLateAssignedTasks = onSchedule(
  {
    schedule: "every 1 minutes",
    timeoutSeconds: 300,
    memory: "256MiB",
  },
  async () => {
    try {
      const now = Timestamp.now();

      const filter = Filter.and(
        Filter.where("markedAsLate", "==", false),
        Filter.where("status", "==", "PENDING"),
        Filter.where("deliveryDate", "<=", Timestamp.fromMillis(now.toMillis())),
      );

      const snapshot = await db
        .collectionGroup("assignedTasks")
        .where(filter)
        .get();

      if (snapshot.empty) {
        console.log("No late tasks found at:", now.toDate());
        return;
      }

      const batch = db.batch();
      const notifications = [];

      for (const doc of snapshot.docs) {
        const data = doc.data();

        const deliveryDate = data.deliveryDate;
        const allowedDurationInMinutes = data.allowedDurationInMinutes;
        const userId = data.user.id;

        if (!deliveryDate || !allowedDurationInMinutes || data.markedAsLate) continue;

        const deadlineMillis = deliveryDate.toDate().getTime() + allowedDurationInMinutes * 60 * 1000;

        if (Date.now() > deadlineMillis) {
          batch.update(doc.ref, { markedAsLate: true });

          const taskId = doc.id;
          const taskName = data.title || "Unnamed Task";
          const deadline = new Date(deadlineMillis);

          const formattedEn = new Intl.DateTimeFormat("en-US", {
            dateStyle: "medium",
            timeStyle: "short",
          }).format(deadline);

          const formattedAr = new Intl.DateTimeFormat("ar-EG", {
            dateStyle: "medium",
            timeStyle: "short",
          }).format(deadline);

          notifications.push(
            sendNotification({
              titleEn: "⚠️ Task Marked as Late",
              titleAr: "⚠️ تم التأخر في المهمة",
              bodyEn: `The task "${taskName}" exceeded the allowed time (${formattedEn}).`,
              bodyAr: `تم تجاوز الوقت المسموح للمهمة "${taskName}" (${formattedAr}).`,
              userId: userId,
              notificationData: {
                type: "LATE-TASK",
                id: taskId,
              },
            }),
          );
        }
      }

      await batch.commit();
      await Promise.all(notifications);
      console.log(`✅ Marked ${snapshot.size} assigned tasks as late and notifications sent.`);
    } catch (error) {
      console.error("❌ Error marking assigned tasks as late:", error);
      throw error;
    }
  },
);

async function sendNotification({
  titleEn,
  bodyEn,
  titleAr,
  bodyAr,
  userId,
  notificationData,
}) {
  const userDoc = await admin.firestore().collection("users").doc(userId).get();

  if (!userDoc.exists) return;

  const userRef = userDoc.ref;
  const user = userDoc.data();
  const token = user.deviceToken;
  const lang = user.languageCode || "ar";
  const title = lang === "ar" ? titleAr : titleEn;
  const body = lang === "ar" ? bodyAr : bodyEn;

  if (!token) return;

  const payload = {
    token,
    notification: {
      title,
      body,
    },
    data: notificationData,
    apns: {
      payload: {
        aps: {
          sound: "default",
        },
      },
    },
  };

  const notificationRef = userRef.collection("notifications").doc();

  await Promise.all([
    admin.messaging().send(payload),
    userRef.update({
      unReadNotificationsCount: admin.firestore.FieldValue.increment(1),
    }),
    notificationRef.set({
      id: notificationRef.id,
      notification: { title, body },
      data: notificationData,
      createdAt: admin.firestore.FieldValue.serverTimestamp(),
    }),
  ]);
}

exports.repeatTasksScheduler = onSchedule(
  {
    schedule: "0 9 * * 3", // Every Wednesday at 9:00 AM
    timeZone: "Asia/Amman",
    memory: "512MiB",
    timeoutSeconds: 300,
  },
  async () => {
    const tasksSnap = await db
      .collection("tasks")
      .where("repeatType", "!=", "ONCE")
      .get();

    for (const taskDoc of tasksSnap.docs) {
      const task = taskDoc.data();
      const {
        id: taskId,
        repeatType,
        companyId,
        weeklyDays = [],
        monthlyDays = [],
        assignedUserIds = [],
      } = task;

      if (!companyId || assignedUserIds.length === 0) continue;

      const holidaysSnap = await db
        .collection(`companies/${companyId}/holidays`)
        .get();
      const holidays = holidaysSnap.docs.map((doc) => doc.data());

      const companyRef = db.collection("companies").doc(companyId);

      await db.runTransaction(async (tx) => {
        const companySnap = await tx.get(companyRef);
        const companyData = companySnap.data() || {};
        const rowId = (companyData.rowId && companyData.rowId.assignedTaskId) || 1;
        const currentIdRef = { value: rowId };

        for (const userId of assignedUserIds) {
          const dates = [];

          for (let i = 0; i < 7; i++) {
            const date = dayjs().add(i, "day");
            const weekday = date.format("dddd");

            if (isHoliday(date, holidays)) continue;

            if (repeatType === "DAILY") {
              dates.push(date);
            } else if (repeatType === "WEEKLY" && weeklyDays.includes(weekday)) {
              dates.push(date);
            } else if (
              repeatType === "MONTHLY" &&
              monthlyDays.includes(date.date())
            ) {
              dates.push(date);
            }
          }

          await createAssignedTasksForUser({
            db,
            tx,
            userId,
            task,
            parentTaskId: taskId,
            companyRef,
            currentIdRef,
            dates,
          });
        }

        tx.update(companyRef, { "rowId.assignedTaskId": currentIdRef.value });
      });
    }
  },
);
