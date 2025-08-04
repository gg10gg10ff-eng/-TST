import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walhakni/constants/app_themes.dart';
import 'package:walhakni/screens/home_screen.dart';
import 'package:walhakni/services/theme_service.dart';

void main() {
  runApp(
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => ThemeService()),
      ],
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    final themeService = Provider.of<ThemeService>(context);
    
    return MaterialApp(
      title: 'والحقني بالصالحين',
      debugShowCheckedModeBanner: false,
      themeMode: themeService.isDarkMode ? ThemeMode.dark : ThemeMode.light,
      theme: AppThemes.lightTheme,
      darkTheme: AppThemes.darkTheme,
      home: const HomeScreen(),
    );
  }
}