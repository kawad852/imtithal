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

async function createAssignedTasksForUser({
  db,
  tx,
  user,
  task,
  parentTaskId,
  companyRef,
  currentIdRef,
  dates,
}) {
  const assignedTasksRef = db.collection("users").doc(user.id).collection("assignedTasks");

  for (const date of dates) {
    const timezone = "Asia/Amman";
    const fullDateTime = dayjs.tz(`${date.format("YYYY-MM-DD")} ${task.deliveryTime}`, "YYYY-MM-DD hh:mm A", timezone);
    const timestamp = Timestamp.fromDate(fullDateTime.toDate());

    const existing = await assignedTasksRef
      .where("parentTaskId", "==", parentTaskId)
      .where("deliveryDate", "==", timestamp)
      .limit(1)
      .get();

    if (!existing.empty) continue;

    const newId = currentIdRef.value.toString();
    currentIdRef.value++;

    const newTask = {
      ...task,
      id: newId,
      user: user,
      parentTaskId,
      deliveryDate: timestamp,
      createdAt: Timestamp.now(),
    };

    tx.set(assignedTasksRef.doc(newId), newTask);
  }
}

module.exports = {
  isHoliday,
  createAssignedTasksForUser,
};

