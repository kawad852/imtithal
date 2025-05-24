import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:shared/models/department/department_model.dart';

class DepartmentsSelector extends StatelessWidget {
  final Widget Function(BuildContext, List<DepartmentModel>) builder;

  const DepartmentsSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Selector<List<DepartmentModel>, List<DepartmentModel>>(
      selector: (context, provider) => provider,
      builder: (context, departments, _) {
        return builder(context, departments);
      },
    );
  }
}
