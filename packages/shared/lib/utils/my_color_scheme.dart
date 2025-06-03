import '../../shared.dart';

class MyColorScheme {
  final bool isLight;

  MyColorScheme(this.isLight);

  ColorScheme get value => ColorScheme.fromSeed(
    seedColor: const Color(0xFF708D81),
    surface: isLight ? Colors.white : null,
    brightness: isLight ? Brightness.light : Brightness.dark,
  );
}
