import 'package:flutter/material.dart';
import 'package:walhakni/constants/colors.dart';
import 'package:walhakni/constants/strings.dart';
import 'package:walhakni/constants/styles.dart';
import 'package:walhakni/screens/home_screen.dart';
import 'package:walhakni/widgets/custom_app_bar.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: const CustomAppBar(title: AppStrings.login),
      body: Padding(
        padding: const EdgeInsets.all(20.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              decoration: AppStyles.textFieldDecoration('البريد الإلكتروني'),
            ),
            const SizedBox(height: 20),
            TextField(
              obscureText: true,
              decoration: AppStyles.textFieldDecoration('كلمة المرور'),
            ),
            const SizedBox(height: 30),
            ElevatedButton(
              style: ElevatedButton.styleFrom(
                backgroundColor: AppColors.gold,
                minimumSize: const Size(double.infinity, 50),
              ),
              onPressed: () {
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(builder: (context) => const HomeScreen()),
                );
              },
              child: const Text(AppStrings.login),
            ),
            const SizedBox(height: 20),
            TextButton(
              onPressed: () {
                // Navigate to register screen
              },
              child: const Text(AppStrings.register),
            ),
          ],
        ),
      ),
    );
  }
}