import 'package:flutter/material.dart';
import 'package:shared/widgets/letters_avatar.dart';

import 'base_network_image.dart';

class UserPhoto extends StatelessWidget {
  final String displayName;
  final String? url;
  final double size;

  const UserPhoto({super.key, required this.url, this.size = 20, required this.displayName});

  @override
  Widget build(BuildContext context) {
    if (url == null) {
      return LettersAvatar(displayName: displayName, radius: size);
    }
    return BaseNetworkImage(url!, width: size, height: size, shape: BoxShape.circle);
  }
}
