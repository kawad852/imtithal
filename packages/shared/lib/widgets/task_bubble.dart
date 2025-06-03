import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskBubble extends StatelessWidget {
  final TaskStatusEnum status;
  final String value;
  final bool late;
  final String? userId;
  final String? departmentId;
  final DateTime startDate;
  final DateTime endDate;

  const TaskBubble({
    super.key,
    required this.status,
    required this.value,
    this.late = false,
    required this.userId,
    required this.departmentId,
    required this.startDate,
    required this.endDate,
  });

  (String, Color, Color) _getTaskInfo(BuildContext context) {
    if (late) {
      return (
        context.appLocalization.late,
        context.colorPalette.yellowF5E,
        context.colorPalette.yellowE7B,
      );
    } else {
      switch (status) {
        case TaskStatusEnum.pending:
          return (
            context.appLocalization.incomplete,
            context.colorPalette.greyF5F,
            context.colorPalette.greyDAD,
          );
        case TaskStatusEnum.completed:
          return (
            context.appLocalization.complete,
            context.colorPalette.greenC5E,
            context.colorPalette.green04B,
          );
        case TaskStatusEnum.violated:
          return (
            context.appLocalization.violation,
            context.colorPalette.redF7D,
            context.colorPalette.redD62,
          );
        case TaskStatusEnum.inReview:
          throw UnimplementedError();
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = _getTaskInfo(context);
    return Expanded(
      child: GestureDetector(
        onTap: () {
          if (status == TaskStatusEnum.violated) {
            context.navigate((context) => ViolationsScreen(userId: userId));
          } else {
            context.navigate(
              (context) => TasksScreen(
                status: status,
                late: late,
                userId: userId,
                departmentId: departmentId,
                startDate: startDate,
                endDate: endDate,
              ),
            );
          }
        },
        child: Container(
          width: double.infinity,
          height: 82,
          padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
          decoration: BoxDecoration(
            color: task.$2,
            borderRadius: BorderRadius.circular(kRadiusSecondary),
          ),
          child: Column(
            children: [
              Container(
                width: double.infinity,
                height: 20,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: task.$3,
                  borderRadius: BorderRadius.circular(kRadiusPrimary),
                ),
                child: Text(
                  task.$1,
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color:
                        status == TaskStatusEnum.violated
                            ? context.colorPalette.white
                            : context.colorPalette.black252,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(height: 8),
              Text(
                value,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 22,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
