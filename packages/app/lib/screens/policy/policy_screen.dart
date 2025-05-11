import 'package:shared/shared.dart';

class PolicyScreen extends StatefulWidget {
  final PolicyEnum policyEnum;
  const PolicyScreen({super.key, required this.policyEnum});

  @override
  State<PolicyScreen> createState() => _PolicyScreenState();
}

class _PolicyScreenState extends State<PolicyScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: ListView(
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 8),
        children: [
          Text(
            widget.policyEnum == PolicyEnum.policy
                ? context.appLocalization.privacyPolicy
                : context.appLocalization.lawsAndRegulations,
            style: TextStyle(
              color: context.colorPalette.black252,
              fontSize: 16,
              fontWeight: FontWeight.w700,
            ),
          ),
          const SizedBox(height: 20),
          Text(
            "وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف وصف",
            style: TextStyle(
              color: context.colorPalette.black,
              fontSize: 14,
              fontWeight: FontWeight.w400,
            ),
          ),
        ],
      ),
    );
  }
}
