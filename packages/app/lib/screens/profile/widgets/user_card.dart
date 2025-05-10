import 'package:shared/shared.dart';

class UserCard extends StatelessWidget {
  const UserCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        BaseNetworkImage(
          "",
          width: 70,
          height: 70,
          shape: BoxShape.circle,
          alignment: AlignmentDirectional.bottomStart,
          child: GestureDetector(
            onTap: () {},
            child: Container(
              width: 24,
              height: 24,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                color: context.colorPalette.primary,
                shape: BoxShape.circle,
              ),
              child: const CustomSvg(MyIcons.edit),
            ),
          ),
        ),
        const SizedBox(width: 7),
        Expanded(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "صهيب العجارمة",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 16,
                  fontWeight: FontWeight.w700,
                ),
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 5),
                child: Text(
                  "مدير الإمتثال - شركة نستطيع",
                  overflow: TextOverflow.ellipsis,
                  style: TextStyle(
                    color: context.colorPalette.black252,
                    fontSize: 14,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ),
              Text(
                "%94 ، إمتثال ممتاز",
                overflow: TextOverflow.ellipsis,
                style: TextStyle(
                  color: context.colorPalette.primary,
                  fontSize: 14,
                  fontWeight: FontWeight.w600,
                ),
              ),
            ],
          ),
        ),
      ],
    );
  }
}
