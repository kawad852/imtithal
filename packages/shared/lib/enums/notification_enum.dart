enum NotificationType {
  newTask('NEW-TASK'),
  completedTask('COMPLETED-TASK'),
  emtithal('EMTITHAL'),
  violation('VIOLATION'),
  lateTask('LATE-TASK');

  final String value;

  const NotificationType(this.value);
}
