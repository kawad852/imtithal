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
      resizeToAvoidBottomInset: false,
      appBar: AppBar(
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
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
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
              MoreButton(onTap: () {}),
            ],
          ),
          Padding(
            padding: const EdgeInsets.symmetric(vertical: 13),
            child: UserSelector(
              builder: (context, user) {
                return EmtithalSummery(user: user);
              },
            ),
          ),
          TextEditor(
            onChanged: (value) {},
            required: false,
            hintText: context.appLocalization.searchTaskEmployee,
            prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
          ),
          CustomFirestoreQueryBuilder(
            query: _assignedTasksQuery,
            onComplete: (context, snapshot) {
              final tasks = snapshot.docs;
              if (tasks.isEmpty) {
                return const SizedBox.shrink();
              }
              return Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 13),
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
                  ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: tasks.length,
                    physics: const NeverScrollableScrollPhysics(),
                    padding: EdgeInsets.zero,
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      final task = tasks[index].data();
                      return TaskCard(task: task);
                    },
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
