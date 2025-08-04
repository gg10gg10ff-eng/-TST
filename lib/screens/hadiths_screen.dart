import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:walhakni/constants/strings.dart';
import 'package:walhakni/models/hadith_model.dart';
import 'package:walhakni/services/hadith_service.dart';
import 'package:walhakni/widgets/custom_app_bar.dart';
import 'package:walhakni/widgets/hadith_card.dart';

class HadithsScreen extends StatefulWidget {
  const HadithsScreen({super.key});

  @override
  State<HadithsScreen> createState() => _HadithsScreenState();
}

class _HadithsScreenState extends State<HadithsScreen> {
  String? selectedImam;
  String? selectedCategory;
  String searchQuery = '';

  final List<String> imams = [
    'الإمام علي (ع)',
    'الإمام الحسن (ع)',
    'الإمام الحسين (ع)',
    'الإمام زين العابدين (ع)',
    'الإمام الباقر (ع)',
    'الإمام الصادق (ع)',
    'الإمام الكاظم (ع)',
    'الإمام الرضا (ع)',
    'الإمام الجواد (ع)',
    'الإمام الهادي (ع)',
    'الإمام العسكري (ع)',
    'الإمام المهدي (عج)'
  ];

  final List<String> categories = [
    'العبادات',
    'الأخلاق',
    'المعرفة',
    'الأسرة',
    'أحكام النساء',
    'الصبر'
  ];

  @override
  Widget build(BuildContext context) {
    final hadithService = Provider.of<HadithService>(context);
    List<Hadith> filteredHadiths = hadithService.filterHadiths(
      imam: selectedImam,
      category: selectedCategory,
      query: searchQuery,
    );

    return Scaffold(
      appBar: CustomAppBar(title: AppStrings.hadiths),
      body: Column(
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextField(
              decoration: InputDecoration(
                hintText: AppStrings.searchHadiths,
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
              onChanged: (value) {
                setState(() {
                  searchQuery = value;
                });
              },
            ),
          ),
          Row(
            children: [
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedImam,
                    hint: const Text(AppStrings.selectImam),
                    items: imams.map((imam) {
                      return DropdownMenuItem(
                        value: imam,
                        child: Text(imam),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedImam = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: DropdownButtonFormField<String>(
                    value: selectedCategory,
                    hint: const Text(AppStrings.selectCategory),
                    items: categories.map((category) {
                      return DropdownMenuItem(
                        value: category,
                        child: Text(category),
                      );
                    }).toList(),
                    onChanged: (value) {
                      setState(() {
                        selectedCategory = value;
                      });
                    },
                    decoration: InputDecoration(
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: ListView.builder(
              itemCount: filteredHadiths.length,
              itemBuilder: (context, index) {
                final hadith = filteredHadiths[index];
                return HadithCard(
                  text: hadith.text,
                  imam: hadith.imam,
                  category: hadith.category,
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}