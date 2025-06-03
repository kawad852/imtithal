import 'package:shared/shared.dart';

const kScreenMargin = 16.0;
const kBurgerImage =
    "https://www.foodandwine.com/thmb/DI29Houjc_ccAtFKly0BbVsusHc=/1500x0/filters:no_upscale():max_bytes(150000):strip_icc()/crispy-comte-cheesburgers-FT-RECIPE0921-6166c6552b7148e8a8561f7765ddf20b.jpg";
const kProviderLogo =
    "https://upload.wikimedia.org/wikipedia/commons/thumb/0/05/McDonald%27s_square_2020.svg/1200px-McDonald%27s_square_2020.svg.png";

const kRadiusPrimary = 5.0;
const kRadiusSecondary = 10.0;
const kRadiusTertiary = 15.0;

const kMaxWidth = 600.0;

class MyTheme {
  static final String fontFamily = GoogleFonts.cairo().fontFamily!;

  static InputDecorationTheme inputDecorationTheme(BuildContext context, ColorScheme colorScheme) =>
      InputDecorationTheme(
        filled: true,
        isDense: true,
        fillColor: const Color(0xFFF5F5F5),
        constraints: const BoxConstraints(maxWidth: 500),
        hintStyle: TextStyle(fontSize: 14, color: context.colorPalette.grey8B8),
        contentPadding: const EdgeInsetsDirectional.symmetric(
          horizontal: 5,
          vertical: 10,
        ).copyWith(start: 20),
        enabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusSecondary),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        disabledBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusSecondary),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusSecondary),
          borderSide: const BorderSide(color: Colors.transparent),
        ),
        errorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusSecondary),
          borderSide: BorderSide(color: colorScheme.error),
        ),
        focusedErrorBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(kRadiusSecondary),
          borderSide: BorderSide(color: colorScheme.error),
        ),
      );

  ThemeData materialTheme(BuildContext context, ColorScheme colorScheme) {
    return ThemeData(
      useMaterial3: true,
      fontFamily: fontFamily,
      colorScheme: colorScheme,
      appBarTheme: const AppBarTheme(),
      actionIconTheme: ActionIconThemeData(
        backButtonIconBuilder: (BuildContext context) {
          return const CustomBack();
        },
      ),
      listTileTheme: ListTileThemeData(
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusPrimary)),
      ),
      cardTheme: CardThemeData(color: colorScheme.onInverseSurface, margin: EdgeInsets.zero),
      filledButtonTheme: FilledButtonThemeData(
        style: FilledButton.styleFrom(
          shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(kRadiusPrimary)),
        ),
      ),
      bottomAppBarTheme: BottomAppBarTheme(
        surfaceTintColor: colorScheme.background,
        color: colorScheme.background,
        elevation: 0,
      ),
      inputDecorationTheme: inputDecorationTheme(context, colorScheme),
    );
  }
}
