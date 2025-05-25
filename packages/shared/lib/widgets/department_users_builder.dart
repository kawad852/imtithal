import 'package:shared/shared.dart';

class DepartmentUsersBuilder extends StatelessWidget {
  final String id;
  final Widget Function(BuildContext, List<UserModel>, UserModel? manager) builder;

  const DepartmentUsersBuilder({super.key, required this.builder, required this.id});

  @override
  Widget build(BuildContext context) {
    return UsersSelector(
      builder: (context, users) {
        final allDepartmentUsers = users.where((e) => e.departmentId == id).toList();
        final manager = allDepartmentUsers.firstWhere(
          (e) => e.role == RoleEnum.departmentManager.value,
          orElse: () => UserModel(createdById: ''),
        );
        final departmentUsers =
            allDepartmentUsers.where((e) => e.role != RoleEnum.departmentManager.value).toList();
        return builder(context, departmentUsers, manager.id != null ? manager : null);
      },
    );
  }
}
