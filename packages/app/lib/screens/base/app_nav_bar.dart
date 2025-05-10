import 'package:app/screens_exports.dart';
import 'package:shared/shared.dart';

class AppNavBar extends StatefulWidget {
  const AppNavBar({super.key});

  @override
  State<AppNavBar> createState() => _AppNavBarState();
}

class _AppNavBarState extends State<AppNavBar> {
  int _currentIndex = 0;
  late PageController _pageController;
  final _scaffoldKey = GlobalKey<ScaffoldState>();
  PersistentBottomSheetController? controller;

  final items = [
    MyIcons.home,
    MyIcons.calendar,
    MyIcons.add,
    MyIcons.building,
    MyIcons.profile,
  ];

  final screens = [
    const HomeScreen(),
    const CalenderScreen(),
    Container(),
    const ManagementScreen(),
    const ProfileScreen(),
  ];

  void _onSelect(int index) {
    if (index != 2) {
      setState(() {
        _currentIndex = index;
      });
      _pageController.jumpToPage(_currentIndex);
    } else {
      if (controller != null) {
        controller?.close();
      } else {
        controller = _scaffoldKey.currentState!.showBottomSheet(
          backgroundColor: context.colorPalette.blueC5E,
          (context) {
            return Container(
              width: double.infinity,
              height: 70,
              decoration: const BoxDecoration(
                borderRadius: BorderRadius.only(
                  topLeft: Radius.circular(25),
                  topRight: Radius.circular(25),
                ),
              ),
            );
          },
        );
        controller?.closed.then((_) => controller = null);
      }
    }
  }

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    bool withNotch = MediaQuery.of(context).viewPadding.bottom > 0.0;
    return Scaffold(
      key: _scaffoldKey,
      resizeToAvoidBottomInset: false,
      backgroundColor: Colors.transparent,
      bottomNavigationBar: Container(
        height: withNotch ? 85 : 75,
        width: context.mediaQuery.width,
        decoration: BoxDecoration(
          color: context.colorPalette.white,
          boxShadow: [
            BoxShadow(
              color: context.colorPalette.primary,
              offset: const Offset(0.0, 1.0),
              blurRadius: 1.0,
            ),
          ],
        ),
        child: Row(
          children:
              screens.map((element) {
                final index = screens.indexOf(element);
                return NavBarItem(
                  onTap: () {
                    _onSelect(index);
                  },
                  isSelected: _currentIndex == index,
                  icon: items[index],
                );
              }).toList(),
        ),
      ),
      body: PageView(
        controller: _pageController,
        physics: const NeverScrollableScrollPhysics(),
        children: screens,
      ),
    );
  }
}
