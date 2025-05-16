enum TaskStatusEnum {
  pending('PENDING'),
  inReview('IN-REVIEW'),
  completed('COMPLETED');

  final String value;

  const TaskStatusEnum(this.value);
}

enum TaskTypeEnum { incomplete, complete, late, infringement }

enum RepeatType {
  once('ONCE'),
  daily('DAILY'),
  weekly('WEEKLY'),
  monthly('MONTHLY');

  final String value;

  const RepeatType(this.value);
}
