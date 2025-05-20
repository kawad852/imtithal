import 'package:flutter/material.dart';
import 'package:shared/extensions/base_extension.dart';

class SearchAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String hintText;
  final Function(String) onChanged;
  final PreferredSizeWidget? bottom;
  final List<Widget>? actions;
  final TextEditingController? controller;

  const SearchAppBar({
    super.key,
    required this.onChanged,
    required this.hintText,
    this.bottom,
    this.actions,
    this.controller,
  });

  @override
  Widget build(BuildContext context) {
    return Theme(
      data: Theme.of(
        context,
      ).copyWith(inputDecorationTheme: const InputDecorationTheme(border: InputBorder.none)),
      child: AppBar(
        backgroundColor: Colors.transparent,
        foregroundColor: context.colorScheme.onSurface,
        surfaceTintColor: Colors.transparent,
        title: TextField(
          autofocus: true,
          // style: context.bodyStyle,
          controller: controller,
          decoration: InputDecoration(
            hintText: hintText,
            // hintStyle: TextStyle(
            //   color: context.extendedColors.grey666,
            // ),
          ),
          onChanged: onChanged,
        ),
        actions: actions,
        bottom: bottom,
      ),
    );
  }

  @override
  Size get preferredSize => Size.fromHeight(100);
}
