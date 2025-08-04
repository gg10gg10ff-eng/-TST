import 'package:flutter/material.dart';
import 'package:walhakni/constants/colors.dart';
import 'package:walhakni/constants/strings.dart';
import 'package:walhakni/widgets/custom_app_bar.dart';

class ForumScreen extends StatelessWidget {
  const ForumScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.forum,
        backgroundColor: AppColors.pink,
      ),
      body: ListView.builder(
        itemCount: 10,
        itemBuilder: (context, index) {
          return Card(
            margin: const EdgeInsets.all(8),
            color: AppColors.softRed.withOpacity(0.1),
            child: ListTile(
              title: Text(
                'مجموعة مناقشة ${index + 1}',
                style: const TextStyle(color: AppColors.black),
              ),
              subtitle: const Text(
                'آخر مشاركة: اليوم 10:30 ص',
                style: TextStyle(color: Colors.grey),
              ),
              leading: const Icon(Icons.group, color: AppColors.pink),
              trailing: const Icon(Icons.arrow_forward_ios, size: 16),
              onTap: () {
                // Navigate to group details
              },
            ),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: AppColors.pink,
        onPressed: () {
          // Create new group
        },
        child: const Icon(Icons.add),
      ),
    );
  }
}