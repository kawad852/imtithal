import 'package:flutter/material.dart';
import 'package:shared/models/user/user_model.dart';
import 'package:shared/widgets/user_photo.dart';

class UserPhotos extends StatelessWidget {
  final List<UserModel> users;
  final double height;

  const UserPhotos({super.key, required this.users, this.height = 20});

  @override
  Widget build(BuildContext context) {
    final list = users.take(5).toList();
    return SizedBox(
      height: height,
      child: ListView.builder(
        itemCount: list.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final user = list[index];
          return Align(
            widthFactor: 0.5,
            child: UserPhoto(
              url: user.profilePhoto,
              displayName: user.displayName,
              size: height / 2,
            ),
          );
        },
      ),
    );
  }
}
