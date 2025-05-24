import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class DepartmentCard extends StatelessWidget {
  final DepartmentModel department;

  const DepartmentCard({super.key, required this.department});

  @override
  Widget build(BuildContext context) {
    return UsersSelector(
      builder: (context, values) {
        final users = values.where((e) => e.departmentId == department.id);
        final departmentManager = users.firstWhere(
          (e) => e.role == RoleEnum.departmentManager.value,
          orElse: () => UserModel(createdById: ''),
        );
        final hasManager = departmentManager.id != null;
        return GestureDetector(
          onTap: () {
            context.push((context) => const DepartmentScreen());
          },
          child: Container(
            width: double.infinity,
            height: 65,
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            decoration: BoxDecoration(
              color: context.colorPalette.greyF5F,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "${context.appLocalization.department} ${department.name}",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black252,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    UserPhotos(users: []),
                  ],
                ),
                const SizedBox(height: 4),
                Row(
                  children: [
                    Text(
                      "${users.length} ${context.appLocalization.employee}  ${hasManager ? "، ${context.appLocalization.responsibleManager} : " : ''}",
                      style: TextStyle(
                        color: context.colorPalette.grey8B8,
                        fontSize: 12,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                    if (hasManager)
                      Expanded(
                        child: Text(
                          departmentManager.displayName,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(
                            color: context.colorPalette.primary,
                            fontSize: 12,
                            fontWeight: FontWeight.w400,
                          ),
                        ),
                      ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }
}
