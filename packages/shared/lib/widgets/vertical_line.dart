import 'package:shared/shared.dart';

class VerticalLine extends StatelessWidget {
  final double height;
  final Color color;
  const VerticalLine({super.key, required this.height, required this.color});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 4,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(2),
      ),
    );
  }
}
