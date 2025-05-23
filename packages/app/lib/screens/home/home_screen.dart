import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

import '../task/widgets/task_card.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late Query<TaskModel> _assignedTasksQuery;

  void _initialize() {
    _assignedTasksQuery = context.taskProvider.tasksQuery;
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: CustomScrollView(
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
              IconButton(
                onPressed: () {
                  context.push((context) => const NotificationScreen());
                },
                icon: const CustomSvg(MyIcons.notification),
              ),
            ],
          ),
          SliverPadding(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            sliver: SliverList.list(
              children: [
                const UserInformation(),
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
                        context.push((context) {
                          return const CalenderScreen();
                        });
                      },
                    ),
                  ],
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(vertical: 13),
                  child: EmtithalSummeryBuilder(),
                ),
                TextEditor(
                  onChanged: (value) {},
                  required: false,
                  hintText: context.appLocalization.searchTaskEmployee,
                  prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
                ),
              ],
            ),
          ),
          CustomFirestoreQueryBuilder(
            query: _assignedTasksQuery,
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
                          MoreButton(onTap: () {}),
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
      ),
    );
  }
}
