import 'package:shared/shared.dart';

class ViolationType extends StatelessWidget {
  final String title;
  final Color backgroundColor;
  const ViolationType({super.key, required this.title, required this.backgroundColor});

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 30,
      padding: const EdgeInsets.symmetric(horizontal: 5),
      alignment: Alignment.center,
      decoration: BoxDecoration(
        color: backgroundColor,
        borderRadius: BorderRadius.circular(kRadiusPrimary),
      ),
      child: Text(
        title,
        style: TextStyle(
          color: context.colorPalette.white,
          fontSize: 12,
          fontWeight: FontWeight.w400,
        ),
      ),
    );
  }
}
