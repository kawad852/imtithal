import 'package:shared/shared.dart';

class SearchHeader extends StatelessWidget {
  final String titleText;
  final Widget? trailing;
  final EdgeInsetsGeometry? contentPadding;
  final double? minTileHeight;

  const SearchHeader({
    super.key,
    required this.titleText,
    this.trailing,
    this.contentPadding,
    this.minTileHeight,
  });

  @override
  Widget build(BuildContext context) {
    return ListTile(
      titleTextStyle: context.textTheme.titleLarge,
      contentPadding: contentPadding,
      minTileHeight: minTileHeight,
      title: Text(titleText),
      trailing: trailing,
    );
  }
}
