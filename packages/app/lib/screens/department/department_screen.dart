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
            bottom: const PreferredSize(
              preferredSize: Size.fromHeight(365),
              child: DepartmentHeader(),
            ),
          ),
          body: ListView(
            padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
            children: [
              Row(
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
              ListView.separated(
                separatorBuilder: (context, index) => const SizedBox(height: 10),
                itemCount: 20,
                shrinkWrap: true,
                physics: const NeverScrollableScrollPhysics(),
                padding: const EdgeInsets.symmetric(vertical: 10),
                itemBuilder: (context, index) {
                  return const EmployeeCard();
                },
              ),
            ],
          ),
        );
      },
    );
  }
}
