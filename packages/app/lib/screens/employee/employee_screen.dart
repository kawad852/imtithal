import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class EmployeeScreen extends StatefulWidget {
  const EmployeeScreen({super.key});

  @override
  State<EmployeeScreen> createState() => _EmployeeScreenState();
}

class _EmployeeScreenState extends State<EmployeeScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: context.colorPalette.black252,
        surfaceTintColor: context.colorPalette.black252,
        leading: CustomBack(color: context.colorPalette.white),
        actions: [
          IconButton(
            onPressed: () {},
            icon: CustomSvg(MyIcons.calendarSearch, color: context.colorPalette.white),
          ),
        ],
        bottom: const PreferredSize(preferredSize: Size.fromHeight(260), child: EmployeeHeader()),
      ),
      body: ListView(
        padding: const EdgeInsets.symmetric(vertical: 10),
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
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
                    Expanded(
                      child: Text(
                        "مايو / 2025",
                        style: TextStyle(
                          color: context.colorPalette.grey8B8,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    const CustomSvg(MyIcons.calendarSearch),
                  ],
                ),
              ],
            ),
          ),
          const MonthCalender(),
          ListView.separated(
            separatorBuilder: (context, index) => const SizedBox(height: 10),
            itemCount: 10,
            shrinkWrap: true,
            physics: const NeverScrollableScrollPhysics(),
            padding: const EdgeInsets.symmetric(horizontal: 15),
            itemBuilder: (context, index) {
              return TaskCard(
                isEmployee: true,
                task: TaskModel(repeatDays: [], attachments: [], companyId: ''),
              );
            },
          ),
        ],
      ),
    );
  }
}
