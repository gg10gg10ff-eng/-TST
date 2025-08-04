import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class CustomAppBar extends StatelessWidget implements PreferredSizeWidget {
  final String title;
  final Color backgroundColor;

  const CustomAppBar({
    super.key,
    required this.title,
    this.backgroundColor = AppColors.gold,
  });

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(title, style: AppStyles.appBarTitleStyle),
      backgroundColor: backgroundColor,
      centerTitle: true,
    );
  }

  @override
  Size get preferredSize => const Size.fromHeight(kToolbarHeight);
}