import 'package:shared/shared.dart';

class AssignedList extends StatelessWidget {
  final QuerySnapshot<TaskModel> assignedTasks;
  final double height;

  const AssignedList({super.key, required this.assignedTasks, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return UsersSelector(
      builder: (context, users) {
        return SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: assignedTasks.docs.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final assignedTask = assignedTasks.docs[index].data();
              assignedTask.userModel ??= users.firstWhere(
                (e) => e.id == assignedTask.userId,
                orElse: () => UserModel(),
              );
              final user = assignedTask.userModel;
              return Align(
                widthFactor: 0.5,
                child: UserPhoto(
                  url: user?.profilePhoto,
                  displayName: user?.displayName ?? "",
                  size: 20,
                ),
              );
            },
          ),
        );
      },
    );
  }
}
