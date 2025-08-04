import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walhakni/constants/colors.dart';
import 'package:walhakni/constants/strings.dart';
import 'package:walhakni/services/theme_service.dart';
import 'package:walhakni/widgets/custom_app_bar.dart';
import 'package:walhakni/widgets/theme_switcher.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  String selectedLanguage = 'العربية';
  double fontSize = 16.0;
  bool isAdmin = false;

  final List<String> languages = [
    'العربية',
    'English',
    'فارسی',
    'اردو'
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(
        title: AppStrings.settings,
        backgroundColor: AppColors.darkGray,
      ),
      body: Container(
        color: Provider.of<ThemeService>(context).isDarkMode 
            ? Colors.grey[900] 
            : Colors.grey[100],
        child: ListView(
          padding: const EdgeInsets.all(16),
          children: [
            const ThemeSwitcher(),
            const Divider(),
            ListTile(
              title: const Text(AppStrings.language),
              trailing: DropdownButton<String>(
                value: selectedLanguage,
                items: languages.map((language) {
                  return DropdownMenuItem(
                    value: language,
                    child: Text(language),
                  );
                }).toList(),
                onChanged: (value) {
                  setState(() {
                    selectedLanguage = value!;
                  });
                },
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(AppStrings.fontSize),
              subtitle: Slider(
                value: fontSize,
                min: 12,
                max: 24,
                divisions: 6,
                label: fontSize.round().toString(),
                onChanged: (value) {
                  setState(() {
                    fontSize = value;
                  });
                },
                activeColor: AppColors.gold,
              ),
            ),
            const Divider(),
            ListTile(
              title: const Text(AppStrings.accountSettings),
              leading: const Icon(Icons.account_circle),
              onTap: () {
                // TODO: Implement account settings navigation
              },
            ),
            ListTile(
              title: const Text(AppStrings.privacy),
              leading: const Icon(Icons.privacy_tip),
              onTap: () {
                // TODO: Implement privacy settings navigation
              },
            ),
            ListTile(
              title: const Text(AppStrings.notifications),
              leading: const Icon(Icons.notifications),
              onTap: () {
                // TODO: Implement notification settings navigation
              },
            ),
            const Divider(),
            if (isAdmin)
              ListTile(
                title: const Text(AppStrings.adminPanel),
                leading: const Icon(Icons.admin_panel_settings),
                onTap: () {
                  // TODO: Implement admin panel navigation
                },
              ),
          ],
        ),
      ),
    );
  }
}