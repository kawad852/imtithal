import 'package:app/screens/user/widgets/user_header.dart';
import 'package:shared/shared.dart';

import '../calender/widgets/calendar_date_text.dart';
import '../calender/widgets/calendar_icon_button.dart';
import '../task/widgets/task_card.dart';

class UserScreen extends StatefulWidget {
  final UserModel user;

  const UserScreen({super.key, required this.user});

  @override
  State<UserScreen> createState() => _UserScreenState();
}

class _UserScreenState extends State<UserScreen> {
  late Stream<UserModel> _userStream;
  late Query<TaskModel> _assignedTasksQuery;
  late DateTime _selectedDate;
  late DateTime _startDate;
  late DateTime _endDate;

  void _initialize() {
    _userStream = kFirebaseInstant.users.doc(widget.user.id).snapshots().map((e) {
      return e.data()!;
    });
    _assignedTasksQuery =
        kFirebaseInstant.userAssignedTasks(widget.user.id!).orderByDeliveryDateDesc;
  }

  @override
  void initState() {
    super.initState();
    _selectedDate = kNowDate;
    _initialize();
    _startDate = kFirstDayOfMonthDate;
    _endDate = kTodayDate;
  }

  @override
  Widget build(BuildContext context) {
    return BigStreamBuilder(
      stream: _userStream,
      initialData: widget.user,
      onComplete: (context, snapshot) {
        final user = snapshot.data!;
        return Scaffold(
          body: CustomScrollView(
            slivers: [
              SliverAppBar(
                backgroundColor: context.colorPalette.black252,
                surfaceTintColor: context.colorPalette.black252,
                leading: CustomBack(color: context.colorPalette.white),
                expandedHeight: 320,
                pinned: true,
                actions: [
                  IconButton(
                    onPressed: () {},
                    icon: CustomSvg(MyIcons.calendarSearch, color: context.colorPalette.white),
                  ),
                ],
                flexibleSpace: FlexibleSpaceBar(
                  background: UserHeader(user: user, startDate: _startDate, endDate: _endDate),
                ),
              ),
              SliverPadding(
                padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(top: 20),
                sliver: SliverList.list(
                  children: [
                    Text(
                      context.appLocalization.tasks,
                      style: TextStyle(
                        color: context.colorPalette.primary,
                        fontSize: 16,
                        fontWeight: FontWeight.w700,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Row(
                      children: [
                        Expanded(child: CalendarDateText(date: _selectedDate)),
                        CalendarIconButton(
                          value: _selectedDate,
                          minDateTime: kNowDate,
                          onChanged: (value) {
                            setState(() {
                              _selectedDate = value;
                            });
                          },
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              SliverToBoxAdapter(
                child: MonthCalender(
                  date: _selectedDate,
                  onChanged: (value) {
                    setState(() {
                      _selectedDate = value;
                    });
                  },
                ),
              ),
              CustomFirestoreQueryBuilder(
                key: ValueKey(_selectedDate),
                query: context.taskProvider.getAssignedTasksFromDate(_selectedDate),
                isSliver: true,
                onComplete: (context, snapshot) {
                  return SliverPadding(
                    padding: const EdgeInsets.symmetric(horizontal: 15).copyWith(bottom: 20),
                    sliver: SliverList.separated(
                      separatorBuilder: (context, index) => const SizedBox(height: 10),
                      itemCount: snapshot.docs.length,
                      itemBuilder: (context, index) {
                        final task = snapshot.docs[index].data();
                        return TaskCard(task: task);
                      },
                    ),
                  );
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
