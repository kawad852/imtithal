import 'package:shared/shared.dart';

class MonthCalender extends StatefulWidget {
  const MonthCalender({super.key});

  @override
  State<MonthCalender> createState() => _MonthCalenderState();
}

class _MonthCalenderState extends State<MonthCalender> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 90,
      child: ListView.separated(
        separatorBuilder: (context, index) => const SizedBox(width: 6),
        itemCount: 20,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
        itemBuilder: (context, index) {
          return GestureDetector(
            onTap: () {
              setState(() {
                currentIndex = index;
              });
            },
            child: Container(
              width: 55,
              height: 70,
              decoration: BoxDecoration(
                color:
                    currentIndex == index
                        ? context.colorPalette.primary
                        : context.colorPalette.greyF5F,
                borderRadius: BorderRadius.circular(kRadiusPrimary),
              ),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    "الإثنين",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          currentIndex == index
                              ? context.colorPalette.white
                              : context.colorPalette.black252,
                      fontSize: 12,
                      fontWeight: FontWeight.w400,
                    ),
                  ),
                  const SizedBox(height: 6),
                  Text(
                    "06",
                    overflow: TextOverflow.ellipsis,
                    style: TextStyle(
                      color:
                          currentIndex == index
                              ? context.colorPalette.white
                              : context.colorPalette.black252,
                      fontSize: 22,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ],
              ),
            ),
          );
        },
      ),
    );
  }
}
