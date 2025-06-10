import 'package:app/screens/violation/widgets/violation_card.dart';
import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationsScreen extends StatefulWidget {
  final String? userId;
  final String? departmentId;

  const ViolationsScreen({super.key, required this.userId, this.departmentId});

  @override
  State<ViolationsScreen> createState() => _ViolationsScreenState();
}

class _ViolationsScreenState extends State<ViolationsScreen> {
  late Query<ViolationModel> _query;

  void _initialize() {
    _query = TasksService.getQuery(
      context,
      status: TaskStatusEnum.violated.value,
      rangeDates: null,
      date: null,
      userId: widget.userId,
      departmentId: widget.departmentId,
      late: false,
    );
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          try {
            final a = await _query.count().get();
            print("count:: ${a.count}");
          } catch (e) {
            print("e::: $e");
          }
        },
      ),
      appBar: AppBar(forceMaterialTransparency: true),
      body: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              context.appLocalization.monitoredViolations,
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 16,
                fontWeight: FontWeight.w700,
              ),
            ),
            // if (!kIsEmployee)
            //   Padding(
            //     padding: const EdgeInsets.symmetric(vertical: 10),
            //     child: TextEditor(
            //       onChanged: (value) {},
            //       required: false,
            //       hintText: context.appLocalization.searchViolationEmployee,
            //       prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
            //     ),
            //   ),
            Expanded(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: snapshot.docs.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
                      if (snapshot.isLoadingMore(index)) {
                        return const FPLoading();
                      }
                      final violation = snapshot.docs[index].data();
                      return ViolationCard(violation: violation, userId: widget.userId);
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
