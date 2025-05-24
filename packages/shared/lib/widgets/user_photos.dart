import 'package:flutter/material.dart';
import 'package:shared/models/user/user_model.dart';
import 'package:shared/widgets/user_photo.dart';

class UserPhotos extends StatelessWidget {
  final List<UserModel> users;

  const UserPhotos({super.key, required this.users});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 20,
      child: ListView.builder(
        itemCount: users.length,
        shrinkWrap: true,
        scrollDirection: Axis.horizontal,
        physics: const NeverScrollableScrollPhysics(),
        padding: EdgeInsets.zero,
        itemBuilder: (context, index) {
          final user = users[index];
          return Align(
            widthFactor: 0.5,
            child: UserPhoto(url: user.profilePhoto, displayName: user.displayName, size: 10),
          );
        },
      ),
    );
  }
}
