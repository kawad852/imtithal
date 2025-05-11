import 'package:shared/shared.dart';

class TaskBubble extends StatelessWidget {
  final TaskTypeEnum taskType;
  final String value;
  const TaskBubble({super.key, required this.taskType, required this.value});

  (String, Color, Color) _getTaskInfo(BuildContext context) {
    switch (taskType) {
      case TaskTypeEnum.incomplete:
        return (
          context.appLocalization.incomplete,
          context.colorPalette.greyF5F,
          context.colorPalette.greyDAD,
        );
      case TaskTypeEnum.complete:
        return (
          context.appLocalization.complete,
          context.colorPalette.greenC5E,
          context.colorPalette.green04B,
        );
      case TaskTypeEnum.late:
        return (
          context.appLocalization.late,
          context.colorPalette.yellowF5E,
          context.colorPalette.yellowE7B,
        );
      case TaskTypeEnum.infringement:
        return (
          context.appLocalization.nonCompliant,
          context.colorPalette.redF7D,
          context.colorPalette.redD62,
        );
    }
  }

  @override
  Widget build(BuildContext context) {
    final task = _getTaskInfo(context);
    return Expanded(
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
                      taskType == TaskTypeEnum.infringement
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
    );
  }
}
