import 'package:shared/shared.dart';

class PolicyScreen extends StatefulWidget {
  final String id;

  const PolicyScreen({super.key, required this.id});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  late Future<DocumentSnapshot<PolicyModel>> _policyFuture;

  FirebaseFirestore get _firebaseFirestore => FirebaseFirestore.instance;
  String get _policyId => widget.id;

  void _initializeFuture() {
    _policyFuture = _firebaseFirestore.policies.doc(_policyId).get();
  }

  @override
  void initState() {
    super.initState();
    _initializeFuture();
  }

  @override
  Widget build(BuildContext context) {
    return BigFutureBuilder(
      future: _policyFuture,
      onComplete: (context, snapshot) {
        final policy = snapshot.data!.data()!;
        return Scaffold(
          appBar: AppBar(title: Text(policy.title)),
          body: SingleChildScrollView(
            padding: const EdgeInsets.all(20),
            child: Column(
              children: [
                const Center(child: CustomSvg(MyImages.logo)),
                const SizedBox(height: 20),
                Html(data: policy.content),
              ],
            ),
          ),
        );
      },
    );
  }
}
