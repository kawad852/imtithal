import 'package:shared/shared.dart';

class CalenderScreen extends StatefulWidget {
  const CalenderScreen({super.key});

  @override
  State<CalenderScreen> createState() => _CalenderScreenState();
}

class _CalenderScreenState extends State<CalenderScreen> {
  int currentIndex = 0;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: Container(),
        leadingWidth: 0,
        title: Text(
          context.appLocalization.calendar,
          style: TextStyle(
            color: context.colorPalette.primary,
            fontSize: 16,
            fontWeight: FontWeight.w700,
          ),
        ),
        actions: [
          IconButton(onPressed: () {}, icon: const CustomSvg(MyIcons.search)),
          IconButton(
            onPressed: () {},
            icon: const CustomSvg(MyIcons.calendarSearch),
          ),
        ],
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(width: context.mediaQuery.width),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 15),
            child: Text(
              "مايو / 2025",
              style: TextStyle(
                color: context.colorPalette.grey8B8,
                fontSize: 14,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          SizedBox(
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
          ),
          Expanded(
            child: ListView.separated(
              separatorBuilder: (context, index) => const SizedBox(height: 10),
              itemCount: 10,
              shrinkWrap: true,
              padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
              itemBuilder: (context, index) {
                return const TaskCard();
              },
            ),
          ),
        ],
      ),
    );
  }
}
