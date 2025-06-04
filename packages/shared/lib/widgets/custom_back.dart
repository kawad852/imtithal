import 'package:shared/shared.dart';

class CustomBack extends StatelessWidget {
  final Color? color;
  const CustomBack({super.key, this.color});

  @override
  Widget build(BuildContext context) {
    return Align(
      alignment: AlignmentDirectional.centerStart,
      child: IconButton(
        onPressed: () {
          context.back();
        },
        icon: Icon(Icons.arrow_back_rounded, color: color ?? context.colorPalette.black),
      ),
    );
  }
}
