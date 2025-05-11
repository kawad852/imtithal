import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text(
          context.appLocalization.facilityManagement,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
        children: [
          Row(
            children: [
              ManageButton(
                onTap: () {},
                icon: MyIcons.addStaff,
                title: context.appLocalization.addNewEmployee,
              ),
              const SizedBox(width: 10),
              ManageButton(
                onTap: () {},
                icon: MyIcons.add,
                title: context.appLocalization.addNewCompliance,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ManageButton(
                  onTap: () {},
                  icon: MyIcons.add,
                  title: context.appLocalization.addNewDepartment,
                ),
                const SizedBox(width: 10),
                ManageButton(
                  onTap: () {},
                  icon: MyIcons.notificationSolid,
                  title: context.appLocalization.sendNewNotification,
                ),
              ],
            ),
          ),
          Row(
            children: [
              ManageButton(
                onTap: () {
                  context.push((context) => const LeavesScreen());
                },
                icon: MyIcons.emoji,
                title: context.appLocalization.leavesAndHolidays,
              ),
              const SizedBox(width: 10),
              ManageButton(
                onTap: () {},
                icon: MyIcons.laws,
                title: context.appLocalization.lawsAndRegulations,
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 10),
            child: Row(
              children: [
                ManageButton(
                  onTap: () {
                    context.push((context) => const ViolationsScreen());
                  },
                  icon: MyIcons.danger,
                  backgroundColor: context.colorPalette.yellowE7B6,
                  title: context.appLocalization.violations,
                ),
                const SizedBox(width: 10),
                ManageButton(
                  onTap: () {},
                  icon: MyIcons.report,
                  title: context.appLocalization.reports,
                ),
              ],
            ),
          ),
          TextEditor(
            onChanged: (value) {},
            required: false,
            hintText: context.appLocalization.searchDepartmentEmployee,
            prefixIcon: const IconButton(
              onPressed: null,
              icon: CustomSvg(MyIcons.search),
            ),
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 15),
            child: Text(
              context.appLocalization.facilityDepartments,
              style: TextStyle(
                color: context.colorPalette.primary,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
          ),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: EdgeInsets.zero,
            itemBuilder: (context, index) {
              return const DepartmentCard();
            },
          ),
        ],
      ),
    );
  }
}
