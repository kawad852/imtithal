enum NotificationType {
  newTask('NEW-TASK'),
  emtithal('EMTITHAL'),
  violation('VIOLATION'),
  lateTask('LATE-TASK');

  final String value;

  const NotificationType(this.value);
}
