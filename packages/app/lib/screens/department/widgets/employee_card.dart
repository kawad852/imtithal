import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class EmployeeCard extends StatelessWidget {
  const EmployeeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        context.push((context) => const EmployeeScreen());
      },
      child: Container(
        width: double.infinity,
        height: 80,
        padding: const EdgeInsets.symmetric(horizontal: 10),
        decoration: BoxDecoration(
          color: context.colorPalette.greyF5F,
          borderRadius: BorderRadius.circular(kRadiusSecondary),
        ),
        child: Row(
          children: [
            VerticalLine(height: 60, color: context.colorPalette.yellowE7B),
            const BaseNetworkImage(
              "",
              width: 60,
              height: 60,
              shape: BoxShape.circle,
              margin: EdgeInsets.symmetric(horizontal: 10),
            ),
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "المدير المسؤول",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.grey8B8,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 5),
                    child: Text(
                      "محمد احمد",
                      overflow: TextOverflow.ellipsis,
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ),
                  Text(
                    "85% امتثال جيد جداً",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.grey8B8,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ],
              ),
            ),
            Icon(
              Icons.arrow_forward_ios_rounded,
              color: context.colorPalette.grey8B8,
            ),
          ],
        ),
      ),
    );
  }
}
