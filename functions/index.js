/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */
/* eslint-disable require-jsdoc */
/* eslint-disable quotes */
/* eslint-disable eol-last */

const ALGOLIA_APP_ID = 'A8ZSH6H4WN';
const ALGOLIA_ADMIN_KEY = 'deccda5b1c9c370107b978ec8e7f63db';
const ALGOLIA_DEPARTMENTS_INDEX = 'departments';

const admin = require("firebase-admin");
const { onCall } = require("firebase-functions/v2/https");
const { onDocumentCreated, onDocumentUpdated, onDocumentDeleted } = require("firebase-functions/v2/firestore");
const { algoliasearch } = require("algoliasearch");
const { onSchedule } = require("firebase-functions/v2/scheduler");
const { getFirestore, Timestamp, Filter } = require("firebase-admin/firestore");


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


exports.notifyTaskStart = functions.pubsub
  .schedule('every 1 minutes')
  .timeZone('Asia/Amman')
  .onRun(async () => {
    const now = DateTime.now().setZone('Asia/Amman');
    const today = now.startOf('day');
    const currentHour = now.hour;
    const currentMinute = now.minute;

    const tasksSnapshot = await db.collection('tasks').get();

    for (const taskDoc of tasksSnapshot.docs) {
      const task = taskDoc.data();
      const taskId = taskDoc.id;
      const {
        startTime,
        companyId,
        assignedUserIds = [],
        date,
        repeat = 'ONCE',
      } = task;

      if (!startTime || !companyId || assignedUserIds.length === 0 || !date) continue;

      const baseDate = DateTime.fromJSDate(date.toDate()).setZone('Asia/Amman');

      // 🛑 Skip if not today's task based on repeat
      let shouldTriggerToday = false;

      switch (repeat) {
        case 'ONCE':
          shouldTriggerToday = baseDate.hasSame(today, 'day');
          break;
        case 'DAILY':
          shouldTriggerToday = true;
          break;
        case 'WEEKLY':
          shouldTriggerToday = baseDate.weekday === today.weekday;
          break;
        case 'MONTHLY':
          shouldTriggerToday = baseDate.day === today.day;
          break;
        default:
          continue;
      }

      if (!shouldTriggerToday) continue;

      // 🛑 Check if today is a holiday
      const holidaysSnapshot = await db
        .collection('companies')
        .doc(companyId)
        .collection('holidays')
        .get();

      const isHoliday = holidaysSnapshot.docs.some(doc => {
        const h = doc.data();
        const start = DateTime.fromJSDate(h.startDate.toDate()).startOf('day');
        const end = DateTime.fromJSDate(h.endDate.toDate()).endOf('day');
        return today >= start && today <= end;
      });

      if (isHoliday) continue;

      // 🕐 Compare current time with task startTime
      const taskTime = DateTime.fromFormat(startTime, 'hh:mm a', { zone: 'Asia/Amman' });
      if (taskTime.hour !== currentHour || taskTime.minute !== currentMinute) continue;

      // 🔔 Notify assigned users
      for (const userId of assignedUserIds) {
        const userDoc = await db.collection('users').doc(userId).get();
        const deviceToken = userDoc.data()?.deviceToken;
        if (!deviceToken) continue;

        await admin.messaging().send({
          token: deviceToken,
          notification: {
            title: '📌 Task Reminder',
            body: task.title || 'A task has started now!',
          },
          data: {
            taskId,
            repeat,
          },
        });

        // Optional: mark as notified
        await db
          .collection('users')
          .doc(userId)
          .collection('assignedTasks')
          .doc(taskId)
          .update({ notified: true });
      }
    }

    return null;
  });
