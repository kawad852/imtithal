import 'package:shared/shared.dart';

class DepartmentUserBuilder extends StatelessWidget {
  final String id;
  final Widget Function(BuildContext, DepartmentModel? department) builder;

  const DepartmentUserBuilder({super.key, required this.builder, required this.id});

  @override
  Widget build(BuildContext context) {
    return DepartmentsSelector(
      builder: (context, department) {
        final d = department.firstWhere((e) => e.id == id, orElse: () => DepartmentModel());
        return builder(context, d.id.isNotEmpty ? d : null);
      },
    );
  }
}
