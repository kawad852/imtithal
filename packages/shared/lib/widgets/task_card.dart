import 'package:shared/shared.dart';

class TaskCard extends StatelessWidget {
  const TaskCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 89,
      padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Row(
        children: [
          VerticalLine(
            height: 67,
            color: context.colorPalette.primary, //TODO : yellowE7B , redD62 This color used,
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "مهمة يومية",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.grey8B8,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    Container(
                      height: 20,
                      padding: const EdgeInsets.symmetric(horizontal: 4),
                      decoration: BoxDecoration(
                        color: context.colorPalette.greyECE,
                        borderRadius: BorderRadius.circular(kRadiusPrimary),
                      ),
                      child: Row(
                        children: [
                          const CustomSvg(MyIcons.clock),
                          const SizedBox(width: 4),
                          Text(
                            "04:30 مساءً",
                            style: TextStyle(
                              color: context.colorPalette.grey8B8,
                              fontSize: 12,
                              fontWeight: FontWeight.w400,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
                Padding(
                  padding: const EdgeInsets.symmetric(vertical: 3),
                  child: Text(
                    "تقارير المحاميين للعمل الميداني",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color: context.colorPalette.black252,
                      fontSize: 14,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                ),
                Row(
                  children: [
                    Expanded(
                      child: Text(
                        "ادخال ملفات القضايا على برنامج زهو وابلاغ المسؤلين بها ...",
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.grey8B8,
                          fontSize: 12,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                    SizedBox(
                      height: 20,
                      child: ListView.builder(
                        itemCount: 7,
                        shrinkWrap: true,
                        scrollDirection: Axis.horizontal,
                        physics: const NeverScrollableScrollPhysics(),
                        padding: EdgeInsets.zero,
                        itemBuilder: (context, index) {
                          return const Align(
                            widthFactor: 0.5,
                            child: BaseNetworkImage(
                              "",
                              width: 20,
                              height: 20,
                              shape: BoxShape.circle,
                            ),
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
