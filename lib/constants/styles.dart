import 'package:flutter/material.dart';
import 'colors.dart';

class AppStyles {
  static TextStyle hadithTextStyle = const TextStyle(
    fontSize: 16,
    fontFamily: 'Traditional Arabic',
  );

  static TextStyle appBarTitleStyle = const TextStyle(
    fontSize: 20,
    fontWeight: FontWeight.bold,
    color: Colors.white,
  );

  static InputDecoration textFieldDecoration(String hint) {
    return InputDecoration(
      hintText: hint,
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(10),
      ),
    );
  }

  static ButtonStyle goldButtonStyle = ElevatedButton.styleFrom(
    backgroundColor: AppColors.gold,
    padding: const EdgeInsets.symmetric(horizontal: 40, vertical: 15),
  );
}