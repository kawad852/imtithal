import 'package:shared/shared.dart';

class AssignedList extends StatelessWidget {
  final QuerySnapshot<TaskModel> assignedTasks;
  final double height;

  const AssignedList({super.key, required this.assignedTasks, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: assignedTasks.docs.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final userQuerySnapshot = assignedTasks.docs[index];
          final user = userQuerySnapshot.data().user!;
          return Align(
            widthFactor: 0.5,
            child: UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 10),
          );
        },
      ),
    );
  }
}
