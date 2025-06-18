import 'package:shared/shared.dart';

class AssignedList extends StatelessWidget {
  final List<String> assignedUserIds;
  final double height;

  const AssignedList({super.key, required this.assignedUserIds, this.height = 20});

  @override
  Widget build(BuildContext context) {
    return UsersSelector(
      builder: (context, users) {
        return SizedBox(
          height: height,
          child: ListView.builder(
            itemCount: assignedUserIds.length,
            shrinkWrap: true,
            scrollDirection: Axis.horizontal,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              final id = assignedUserIds[index];
              final user = UiHelper.getUser(id);
              return Align(
                widthFactor: 0.5,
                child: UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 20),
              );
            },
          ),
        );
      },
    );
  }
}
