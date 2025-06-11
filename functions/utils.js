/* eslint-disable max-len */
/* eslint-disable indent */
/* eslint-disable indent, object-curly-spacing */
/* eslint-disable require-jsdoc */
/* eslint-disable quotes */
/* eslint-disable eol-last */

const { Timestamp } = require("firebase-admin/firestore");
const dayjs = require("dayjs");

function isHoliday(date, holidays) {
  return holidays.some((h) => {
    const start = dayjs(h.startDate.toDate());
    const end = dayjs(h.endDate.toDate());
    return date.isAfter(start.subtract(1, "day")) && date.isBefore(end.add(1, "day"));
  });
}

async function createAssignedTasksForUser({ db, tx, userId, task, parentTaskId, companyRef, currentIdRef, dates }) {
  const assignedTasksRef = db.collection("users").doc(userId).collection("assignedTasks");

  for (const date of dates) {
    const timestamp = Timestamp.fromDate(date.toDate());

    const existing = await assignedTasksRef
      .where("parentTaskId", "==", parentTaskId)
      .where("deliveryDate", "==", timestamp)
      .limit(1)
      .get();

    if (!existing.empty) continue;

    const newRowId = currentIdRef.value++;
    const newTask = {
      ...task,
      rowId: newRowId,
      parentTaskId,
      deliveryDate: timestamp,
      createdAt: Timestamp.now(),
    };

    delete newTask.id;

    const docRef = assignedTasksRef.doc(); // Auto-generated ID
    tx.set(docRef, newTask);
  }
}

module.exports = {
  isHoliday,
  createAssignedTasksForUser,
};
