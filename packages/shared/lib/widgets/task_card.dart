import 'package:app/screens/task/task_details_screen.dart';
import 'package:shared/shared.dart';

class TaskCard extends StatelessWidget {
  final Color? colorTask;
  final bool isEmployee;
  final bool isPrivate;
  final TaskModel task;

  const TaskCard({
    super.key,
    this.isEmployee = false,
    this.isPrivate = false,
    this.colorTask,
    required this.task,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push((context) => TaskDetailsScreen(task: task));
      },
      child: Container(
        width: double.infinity,
        height: 89,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            VerticalLine(height: 67, color: colorTask ?? context.colorPalette.primary),
            const SizedBox(width: 10),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          RepeatType.getLabel(task.repeatType!, context),
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (isPrivate)
                        Container(
                          height: 20,
                          padding: const EdgeInsets.symmetric(horizontal: 4),
                          margin: const EdgeInsetsDirectional.only(end: 4),
                          decoration: BoxDecoration(
                            color: context.colorPalette.greyECE,
                            borderRadius: BorderRadius.circular(kRadiusPrimary),
                          ),
                          child: Row(
                            children: [
                              CustomSvg(
                                MyIcons.calendar,
                                width: 14,
                                color: context.colorPalette.grey8B8,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                "01.05.2025",
                                style: TextStyle(
                                  color: context.colorPalette.grey8B8,
                                  fontSize: 12,
                                  fontWeight: FontWeight.w400,
                                ),
                              ),
                            ],
                          ),
                        ),
                      Container(
                        height: 20,
                        padding: const EdgeInsets.symmetric(horizontal: 4),
                        decoration: BoxDecoration(
                          color: context.colorPalette.greyECE,
                          borderRadius: BorderRadius.circular(kRadiusPrimary),
                        ),
                        child: Row(
                          children: [
                            const CustomSvg(MyIcons.clock),
                            const SizedBox(width: 4),
                            Text(
                              "04:30 مساءً",
                              style: TextStyle(
                                color: context.colorPalette.grey8B8,
                                fontSize: 12,
                                fontWeight: FontWeight.w400,
                              ),
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 3),
                    child: Text(
                      task.title,
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Row(
                    children: [
                      Expanded(
                        child: Text(
                          task.description,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.grey8B8,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                      if (!isEmployee)
                        SizedBox(
                          height: 20,
                          child: ListView.builder(
                            itemCount: 7,
                            shrinkWrap: true,
                            scrollDirection: Axis.horizontal,
                            physics: const NeverScrollableScrollPhysics(),
                            padding: EdgeInsets.zero,
                            itemBuilder: (context, index) {
                              return const Align(
                                widthFactor: 0.5,
                                child: BaseNetworkImage(
                                  "",
                                  width: 20,
                                  height: 20,
                                  shape: BoxShape.circle,
                                ),
                              );
                            },
                          ),
                        ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
