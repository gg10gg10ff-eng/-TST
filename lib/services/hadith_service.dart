import 'package:flutter/material.dart';
import '../models/hadith_model.dart';

class HadithService extends ChangeNotifier {
  final List<Hadith> _hadiths = [
    Hadith(
      id: '1',
      text: 'قال الإمام علي (ع): "الصبر من الإيمان بمنزلة الرأس من الجسد".',
      imam: 'الإمام علي (ع)',
      category: 'الصبر',
      source: 'نهج البلاغة',
      grade: 1,
    ),
    Hadith(
      id: '2',
      text: 'قال الإمام الصادق (ع): "طلب العلم فريضة على كل مسلم ومسلمة".',
      imam: 'الإمام الصادق (ع)',
      category: 'المعرفة',
      source: 'الكافي',
      grade: 1,
    ),
  ];

  List<Hadith> filterHadiths({
    String? imam,
    String? category,
    String query = '',
  }) {
    return _hadiths.where((hadith) {
      bool matchesImam = imam == null || hadith.imam == imam;
      bool matchesCategory = category == null || hadith.category == category;
      bool matchesQuery = query.isEmpty ||
          hadith.text.toLowerCase().contains(query.toLowerCase()) ||
          hadith.imam.toLowerCase().contains(query.toLowerCase()) ||
          hadith.category.toLowerCase().contains(query.toLowerCase());

      return matchesImam && matchesCategory && matchesQuery;
    }).toList();
  }
}