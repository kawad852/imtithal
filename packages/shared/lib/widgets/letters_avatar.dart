import 'package:auto_size_text/auto_size_text.dart';
import 'package:flutter/material.dart';
import 'package:shared/extensions/base_extension.dart';

class LettersAvatar extends StatelessWidget {
  final String displayName;
  final double radius;

  const LettersAvatar({super.key, required this.displayName, required this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colorPalette.black252,
      foregroundColor: context.colorScheme.surface,
      radius: radius / 2,
      child: Center(
        child: Padding(
          padding: const EdgeInsets.all(2),
          child: AutoSizeText(
            displayName.isNotEmpty ? displayName[0] : "",
            minFontSize: 10,
            maxFontSize: 30,
            maxLines: 1,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }
}
