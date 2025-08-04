import 'package:flutter/material.dart';
import 'package:walhakni/constants/app_colors.dart';

class SectionHeader extends StatelessWidget {
  final String title;
  
  const SectionHeader({
    super.key,
    required this.title,
  });

  @override
  Widget build(BuildContext context) {
    return Row(
      children: [
        const SizedBox(width: 8),
        Container(
          width: 4,
          height: 20,
          color: AppColors.primary,
        ),
        const SizedBox(width: 12),
        Text(
          title,
          style: const TextStyle(
            fontSize: 18,
            fontWeight: FontWeight.bold,
          ),
        ),
      ],
    );
  }
}