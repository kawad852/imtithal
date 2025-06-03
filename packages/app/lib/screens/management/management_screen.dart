import 'package:app/screens/search/search_screen.dart';
import 'package:app/screens/user/user_input_screen.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

import '../department/department_input_screen.dart';

class ManagementScreen extends StatefulWidget {
  const ManagementScreen({super.key});

  @override
  State<ManagementScreen> createState() => _ManagementScreenState();
}

class _ManagementScreenState extends State<ManagementScreen> {
  late Query<DepartmentModel> _query;

  void _initialize() {
    _query = kFirebaseInstant.departments.orderByCreatedAtDesc;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

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
      body: CustomScrollView(
        slivers: [
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 5),
            sliver: SliverList.list(
              children: [
                Row(
                  children: [
                    ManageButton(
                      onTap: () {
                        context.navigate((context) {
                          return const UserInputScreen();
                        });
                      },
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
                        onTap: () {
                          context.navigate((context) {
                            return const DepartmentInputScreen();
                          });
                        },
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
                        context.navigate((context) => const LeavesScreen());
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
                          context.navigate((context) => const ViolationsScreen(userId: null));
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
                SearchScreen(
                  hintText: context.appLocalization.searchDepartmentEmployee,
                  includeIndexes: (true, true, false),
                ),
                // TextEditor(
                //   onChanged: (value) {},
                //   required: false,
                //   hintText: context.appLocalization.searchDepartmentEmployee,
                //   prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
                // ),
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
              ],
            ),
          ),
          CustomFirestoreQueryBuilder(
            query: _query,
            isSliver: true,
            onComplete: (context, snapshot) {
              return SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15),
                sliver: SliverList.separated(
                  separatorBuilder: (context, index) => const SizedBox(height: 10),
                  itemCount: snapshot.docs.length,
                  itemBuilder: (context, index) {
                    if (snapshot.isLoadingMore(index)) {
                      return const FPLoading();
                    }
                    final department = snapshot.docs[index].data();
                    return DepartmentCard(department: department);
                  },
                ),
              );
            },
          ),
        ],
      ),
    );
  }
}
