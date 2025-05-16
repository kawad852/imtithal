enum TaskStatusEnum {
  pending('PENDING'),
  inReview('IN-REVIEW'),
  completed('COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);
}

enum TaskTypeEnum { incomplete, complete, late, infringement }

enum TaskRepation {
  daily('DAILY'),
  weekly('WEEKLY'),
  monthly('MONTHLY'),
  non('NON');

  final String value;

  const TaskRepation(this.value);
}
