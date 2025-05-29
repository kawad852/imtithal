import 'package:shared/shared.dart';

class EvaluationBox extends StatelessWidget {
  final String title, subTitle, value;
  final Color color;
  final bool isEmployee;
  final String? profilePhoto;

  const EvaluationBox({
    super.key,
    required this.title,
    required this.subTitle,
    required this.value,
    required this.color,
    this.isEmployee = false,
    this.profilePhoto,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Container(
        width: double.infinity,
        height: 56,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            Container(
              width: 36,
              height: 36,
              alignment: Alignment.center,
              decoration: BoxDecoration(color: color, shape: BoxShape.circle),
              child: Text(
                value,
                style: TextStyle(
                  color: context.colorPalette.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
            ),
            const SizedBox(width: 6),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    title,
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.grey8B8,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Row(
                    spacing: 5,
                    children: [
                      if (isEmployee && profilePhoto != null)
                        UserPhoto(url: profilePhoto, displayName: subTitle),
                      Expanded(
                        child: Text(
                          subTitle,
                          overflow: TextOverflow.ellipsis,
                          style: TextStyle(color: color, fontSize: 14, fontWeight: FontWeight.w400),
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
