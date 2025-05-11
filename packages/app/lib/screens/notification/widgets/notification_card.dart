import 'package:shared/shared.dart';

class NotificationCard extends StatelessWidget {
  const NotificationCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
      decoration: BoxDecoration(
        color: context.colorPalette.greyF5F,
        borderRadius: BorderRadius.circular(kRadiusSecondary),
      ),
      child: Column(
        children: [
          Row(
            children: [
              Container(
                width: 55,
                height: 55,
                alignment: Alignment.center,
                decoration: BoxDecoration(
                  color: context.colorPalette.primary,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: const CustomSvg(MyIcons.notificationLogo),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      "لديك مهمة متأخرة عن التنفيد",
                      style: TextStyle(
                        color: context.colorPalette.black252,
                        fontSize: 14,
                        fontWeight: FontWeight.w600,
                      ),
                    ),
                    Text(
                      "سارع بإتمام عمل المهمة تجنباً لإتخاذ اجراء بحقك",
                      style: TextStyle(
                        color: context.colorPalette.grey8B8,
                        fontSize: 14,
                        fontWeight: FontWeight.w400,
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
          Align(
            alignment: AlignmentDirectional.centerEnd,
              child: Text(
                "08:30 صباحاً- 01.05.2025",
                style: TextStyle(
                  color: context.colorPalette.grey8B8,
                  fontSize: 12,
                  fontWeight: FontWeight.w400,
                ),
              ),
          ),
        ],
      ),
    );
  }
}
