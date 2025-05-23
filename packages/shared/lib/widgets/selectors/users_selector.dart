import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../../models/user/user_model.dart';

class UsersSelector extends StatelessWidget {
  final Widget Function(BuildContext, List<UserModel>) builder;

  const UsersSelector({super.key, required this.builder});

  @override
  Widget build(BuildContext context) {
    return Selector<List<UserModel>, List<UserModel>>(
      selector: (context, provider) => provider,
      builder: (context, users, _) {
        return builder(context, users);
      },
    );
  }
}
