import 'package:app/screens_exports.dart';
import 'package:shared/models/violation/violation_model.dart';
import 'package:shared/shared.dart';

class ViolationsScreen extends StatefulWidget {
  final String? userId;

  const ViolationsScreen({super.key, required this.userId});

  @override
  State<ViolationsScreen> createState() => _ViolationsScreenState();
}

class _ViolationsScreenState extends State<ViolationsScreen> {
  late Query<ViolationModel> _query;

  void _initialize() {
    if (widget.userId != null) {
      _query = kFirebaseInstant.userViolations(widget.userId!);
    } else {
      _query = kFirebaseInstant.violations;
    }
  }

  @override
  void initState() {
    super.initState();
    _initialize();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            if (!kIsEmployee)
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: TextEditor(
                  onChanged: (value) {},
                  required: false,
                  hintText: context.appLocalization.searchViolationEmployee,
                  prefixIcon: const IconButton(onPressed: null, icon: CustomSvg(MyIcons.search)),
                ),
              ),
            Expanded(
              child: CustomFirestoreQueryBuilder(
                query: _query,
                onComplete: (context, snapshot) {
                  return ListView.separated(
                    separatorBuilder: (context, index) => const SizedBox(height: 10),
                    itemCount: snapshot.docs.length,
                    padding: EdgeInsets.zero,
                    itemBuilder: (context, index) {
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
