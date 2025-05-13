import 'package:shared/shared.dart';

class ResponsibleEmoloyee extends StatelessWidget {
  const ResponsibleEmoloyee({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 60,
      padding: const EdgeInsets.symmetric(horizontal: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          VerticalLine(height: 40, color: context.colorPalette.primary),
          const Padding(
            padding: EdgeInsets.symmetric(horizontal: 10),
            child: CustomSvg(MyIcons.check),
          ),
          const BaseNetworkImage(
            "",
            width: 40,
            height: 40,
            shape: BoxShape.circle,
          ),
          const SizedBox(width: 5),
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
                const SizedBox(height: 4),
                Text(
                  "محمد احمد",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
          Container(
            height: 30,
            padding: const EdgeInsets.symmetric(horizontal: 5),
            decoration: BoxDecoration(
              color: context.colorPalette.yellowE7B6,
              borderRadius: BorderRadius.circular(kRadiusPrimary),
            ),
            child: Row(
              children: [
                const CustomSvg(MyIcons.danger, width: 20),
                Text(
                  "عدم امتثال",
                  style: TextStyle(
                    color: context.colorPalette.black,
                    fontSize: 12,
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
