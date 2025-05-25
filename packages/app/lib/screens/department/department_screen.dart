import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class DepartmentScreen extends StatefulWidget {
  final DepartmentModel department;

  const DepartmentScreen({super.key, required this.department});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  late Stream<DepartmentModel> _departmentStream;

  void _initialize() {
    _departmentStream = kFirebaseInstant.departments.doc(widget.department.id).snapshots().map((e) {
      return e.data()!;
    });
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _departmentStream,
      initialData: widget.department,
      onComplete: (context, snapshot) {
        final department = snapshot.data!;
        return DepartmentUsersBuilder(
          id: department.id,
          builder: (context, users, manager) {
            return Scaffold(
              body: CustomScrollView(
                slivers: [
                  SliverAppBar(
                    backgroundColor: context.colorPalette.black252,
                    surfaceTintColor: context.colorPalette.black252,
                    expandedHeight: 425,
                    pinned: true,
                    leading: CustomBack(color: context.colorScheme.surface),
                    flexibleSpace: FlexibleSpaceBar(
                      background: SafeArea(
                        child: Padding(
                          padding: const EdgeInsets.only(top: kToolbarHeight),
                          child: DepartmentHeader(
                            department: department,
                            manager: manager,
                            users: users,
                          ),
                        ),
                      ),
                    ),
                    actions: [
                      IconButton(
                        onPressed: () {},
                        icon: CustomSvg(MyIcons.calendarSearch, color: context.colorPalette.white),
                      ),
                    ],
                  ),
                  SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                    sliver: SliverMainAxisGroup(
                      slivers: [
                        PinnedHeaderSliver(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(vertical: 10),
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    context.appLocalization.departmentEmployees,
                                    style: TextStyle(
                                      color: context.colorPalette.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                const CustomSvg(MyIcons.filter),
                              ],
                            ),
                          ),
                        ),
                        SliverList.separated(
                          separatorBuilder: (context, index) => const SizedBox(height: 10),
                          itemCount: users.length,
                          itemBuilder: (context, index) {
                            final user = users[index];
                            return UserCard(user: user);
                          },
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }
}
