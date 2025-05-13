import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class TaskActionScreen extends StatefulWidget {
  const TaskActionScreen({super.key});

  @override
  State<TaskActionScreen> createState() => _TaskActionScreenState();
}

class _TaskActionScreenState extends State<TaskActionScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            context.appLocalization.takingActionOnTask,
            style: TextStyle(
              color: context.colorPalette.primary,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              "تقارير المحاميين للعمل الميداني",
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          Row(
            children: [
              ActionButton(
                onTap: () {},
                icon: MyIcons.userEdit,
                title: context.appLocalization.addRemoveEmployee,
              ),
              const SizedBox(width: 10),
              ActionButton(
                onTap: () {},
                icon: MyIcons.messageEdit,
                title: context.appLocalization.modifyTask,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.appLocalization.responsibleDepartment,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          const ResponsibleDepartment(),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Text(
              context.appLocalization.responsibleEmployees,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 5,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            itemBuilder: (context, index) {
              return const ResponsibleEmoloyee();
            },
          ),
        ],
      ),
    );
  }
}
