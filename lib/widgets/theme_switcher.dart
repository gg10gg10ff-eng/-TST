import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../services/theme_service.dart';
import '../constants/colors.dart';

class ThemeSwitcher extends StatelessWidget {
  const ThemeSwitcher({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);

    return SwitchListTile(
      title: const Text('الوضع الليلي'),
      secondary: Icon(
        themeService.isDarkMode ? Icons.nightlight_round : Icons.wb_sunny,
        color: AppColors.yellow,
      ),
      activeColor: AppColors.yellow,
      value: themeService.isDarkMode,
      onChanged: (value) {
        themeService.toggleTheme();
      },
    );
  }
}