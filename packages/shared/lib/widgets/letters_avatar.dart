import 'package:flutter/material.dart';
import 'package:shared/extensions/base_extension.dart';

class LettersAvatar extends StatelessWidget {
  final String displayName;
  final double? radius;

  const LettersAvatar({super.key, required this.displayName, this.radius});

  @override
  Widget build(BuildContext context) {
    return CircleAvatar(
      backgroundColor: context.colorScheme.surfaceContainer,
      foregroundColor: context.colorScheme.onSurface,
      radius: radius,
      child: Text(displayName[0]),
    );
  }
}
