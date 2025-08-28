import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';
import 'package:shared/widgets/base_loader.dart';

import '../notifications/notifications_screen.dart';
import '../search/search_screen.dart';
import '../task/widgets/summery/status_summery_bubbles.dart';
import '../task/widgets/summery/summery_builder.dart';
import '../task/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Query<TaskModel>? _assignedTasksQuery;
  late DateTime _startDate;
  late DateTime _endDate;

  void _initialize() {
    _assignedTasksQuery = TasksService.fetchTasksList(context, mainTasks: true);
  }

  @override
  void initState() {
    super.initState();
    _initialize();
    _startDate = kFirstDayOfMonthDate;
    _endDate = kTodayDate;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SummeryBuilder(
        height: 60,
        startDate: _startDate,
        endDate: _endDate,
        onLoading: () => const BaseLoader(),
        userId: kIsEmployee ? kUserId : null,
        builder: (
          (int, double) inCompletedTasks,
          (int, double) completedTasks,
          (int, double) violationTasks,
          (int, double) lateTasks,
          users,
          percentageValues,
        ) {
          return CustomScrollView(
            slivers: [
              SliverAppBar(
                pinned: true,
                title: Text(
                  context.appLocalization.home,
                  style: TextStyle(
                    color: context.colorPalette.primary,
                    fontSize: 16,
                    fontWeight: FontWeight.w700,
                  ),
                ),
                actions: [
                  UserSelector(
                    builder: (context, user) {
                      final count = user.unReadNotificationsCount;
                      return IconButton(
                        onPressed: () {
                          context.navigate((context) => const NotificationsScreen());
                        },
                        icon: Badge(
                          isLabelVisible: count > 0,
                          label: Text("$count"),
                          child: const CustomSvg(MyIcons.notification),
                        ),
                      );
                    },
                  ),
                ],
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
                sliver: SliverList.list(
                  children: [
                    UserInformation(percentageValues: percentageValues),
                    const SizedBox(height: 17),
                    Row(
                      children: [
                        Expanded(
                          child: Text(
                            context.appLocalization.todayImtithalSummary,
                            overflow: TextOverflow.ellipsis,
                            style: TextStyle(
                              color: context.colorPalette.primary,
                              fontSize: 16,
                              fontWeight: FontWeight.w700,
                            ),
                          ),
                        ),
                        MoreButton(
                          onTap: () {
                            context.navigate((context) {
                              return const CalenderScreen();
                            });
                          },
                        ),
                      ],
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: StatusSummeryBubbles(
                        userId: kIsEmployee ? kUserId : null,
                        departmentId: kIsDepartmentManager ? kUser.departmentId : null,
                        inCompletedTasksCount: inCompletedTasks.$1,
                        completedTasksCount: completedTasks.$1,
                        lateTasksCount: lateTasks.$1,
                        violationTasksCount: violationTasks.$1,
                        startDate: _startDate,
                        endDate: _endDate,
                      ),
                    ),
                    SearchScreen(
                      hintText:
                          kIsEmployee
                              ? context.appLocalization.searchTask
                              : context.appLocalization.searchTaskEmployee,
                      includeIndexes:
                          kIsEmployee ? (false, false, true, false) : (true, false, true, false),
                    ),
                  ],
                ),
              ),
              if (_assignedTasksQuery != null)
                CustomFirestoreQueryBuilder(
                  query: _assignedTasksQuery!,
                  isSliver: true,
                  onComplete: (context, snapshot) {
                    final tasks = snapshot.docs;
                    if (tasks.isEmpty) {
                      return const SliverToBoxAdapter(child: SizedBox.shrink());
                    }
                    return SliverMainAxisGroup(
                      slivers: [
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(vertical: 13, horizontal: 15),
                          sliver: SliverToBoxAdapter(
                            child: Row(
                              children: [
                                Expanded(
                                  child: Text(
                                    context.appLocalization.topTasks,
                                    overflow: TextOverflow.ellipsis,
                                    style: TextStyle(
                                      color: context.colorPalette.primary,
                                      fontSize: 16,
                                      fontWeight: FontWeight.w700,
                                    ),
                                  ),
                                ),
                                // MoreButton(onTap: () {}),
                              ],
                            ),
                          ),
                        ),
                        SliverPadding(
                          padding: const EdgeInsets.symmetric(horizontal: 15),
                          sliver: SliverList.separated(
                            separatorBuilder: (context, index) => const SizedBox(height: 10),
                            itemCount: tasks.length,
                            itemBuilder: (context, index) {
                              if (snapshot.isLoadingMore(index)) {
                                return const FPLoading();
                              }
                              final task = tasks[index].data();
                              return TaskCard(task: task);
                            },
                          ),
                        ),
                      ],
                    );
                  },
                ),
            ],
          );
        },
      ),
    );
  }
}
