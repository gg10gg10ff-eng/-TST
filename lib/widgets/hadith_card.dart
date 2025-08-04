import 'package:flutter/material.dart';
import '../constants/colors.dart';
import '../constants/styles.dart';

class HadithCard extends StatelessWidget {
  final String text;
  final String imam;
  final String category;

  const HadithCard({
    super.key,
    required this.text,
    required this.imam,
    required this.category,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      margin: const EdgeInsets.all(8),
      color: AppColors.hadithBackground,
      child: Padding(
        padding: const EdgeInsets.all(12),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              text,
              style: AppStyles.hadithTextStyle,
              textDirection: TextDirection.rtl,
            ),
            const SizedBox(height: 8),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Chip(
                  label: Text(imam),
                  backgroundColor: AppColors.gold.withOpacity(0.2),
                ),
                Chip(
                  label: Text(category),
                  backgroundColor: AppColors.gold.withOpacity(0.2),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}