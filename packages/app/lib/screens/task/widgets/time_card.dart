import 'package:shared/shared.dart';

class TimeCard extends StatelessWidget {
  final String title, value;
  const TimeCard({super.key, required this.title, required this.value});

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 82,
        padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Column(
          children: [
            Container(
              width: double.infinity,
              height: 20,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorPalette.greyDAD,
                borderRadius: BorderRadius.circular(kRadiusPrimary),
              ),
              child: Text(
                title,
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.black252,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(height: 8),
            Text(
              value,
              style: TextStyle(
                color: context.colorPalette.black252,
                fontSize: 22,
                fontWeight: FontWeight.w700,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
