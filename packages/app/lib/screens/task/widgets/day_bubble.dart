import 'package:shared/shared.dart';

class DayBubble extends StatelessWidget {
  final void Function() onTap;
  final String title;
  final bool isSelected;
  final Color backgroundColor;

  const DayBubble({
    super.key,
    required this.onTap,
    required this.title,
    required this.isSelected,
    required this.backgroundColor,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Container(
            height: 40,
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 20),
            margin: const EdgeInsets.symmetric(horizontal: 2, vertical: 3),
            decoration: BoxDecoration(
              color: backgroundColor,
              borderRadius: BorderRadius.circular(kRadiusSecondary),
            ),
            child: Text(
              title,
              style: TextStyle(
                color: isSelected ? context.colorPalette.white : context.colorPalette.black,
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            ),
          ),
        ],
      ),
    );
  }
}
