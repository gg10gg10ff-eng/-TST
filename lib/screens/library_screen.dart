import 'package:flutter/material.dart';
import 'package:walhakni/constants/colors.dart';
import 'package:walhakni/constants/strings.dart';
import 'package:walhakni/widgets/book_card.dart';
import 'package:walhakni/widgets/custom_app_bar.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: CustomAppBar(
        title: AppStrings.library,
        backgroundColor: AppColors.calmGreen,
      ),
      body: GridView.builder(
        padding: const EdgeInsets.all(10),
        gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
          crossAxisCount: 2,
          crossAxisSpacing: 10,
          mainAxisSpacing: 10,
          childAspectRatio: 0.7,
        ),
        itemCount: 8,
        itemBuilder: (context, index) {
          return BookCard(
            title: 'كتاب إسلامي ${index + 1}',
            author: 'العالم الإسلامي',
            onTap: () {
              // Open book
            },
          );
        },
      ),
    );
  }
}