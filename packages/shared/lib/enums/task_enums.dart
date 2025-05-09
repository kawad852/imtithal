enum TaskStatusEnum {
  notStarted('NOT-STARTED'),
  inProgress('IN-PROGRESS'),
  completed('COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);
}

enum TaskTypeEnum {
  incomplete,
  complete,
  late,
  infringement,
}
