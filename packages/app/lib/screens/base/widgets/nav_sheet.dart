import 'package:shared/shared.dart';

class NavSheet extends StatelessWidget {
  const NavSheet({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      width: double.infinity,
      height: 70,
      padding: const EdgeInsets.symmetric(horizontal: 15),
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(25),
          topRight: Radius.circular(25),
        ),
      ),

      child: Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.white,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Row(
                  children: [
                    CustomSvg(MyIcons.add, color: context.colorPalette.primary),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "اضافة مهمة جديدة",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black252,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: double.infinity,
                height: 48,
                padding: const EdgeInsets.symmetric(horizontal: 10),
                decoration: BoxDecoration(
                  color: context.colorPalette.white,
                  borderRadius: BorderRadius.circular(kRadiusSecondary),
                ),
                child: Row(
                  children: [
                    const CustomSvg(MyIcons.danger),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        "رصد مخالفة",
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: TextStyle(
                          color: context.colorPalette.black252,
                          fontSize: 14,
                          fontWeight: FontWeight.w400,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
