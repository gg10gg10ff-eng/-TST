import 'package:flutter/material.dart';
import 'package:walhakni/constants/app_colors.dart';
import 'package:walhakni/constants/app_images.dart';
import 'package:walhakni/widgets/main_action_button.dart';
import 'package:walhakni/screens/hadiths_screen.dart';
import 'package:walhakni/screens/library_screen.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              // Header Banner
              Container(
                height: 200,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppImages.homeBanner),
                    fit: BoxFit.cover,
                  ),
                ),
              ),

              // Welcome Text
              const Padding(
                padding: EdgeInsets.all(20),
                child: Text(
                  'مرحباً بك في تطبيق والحقني بالصالحين',
                  style: TextStyle(
                    fontSize: 24,
                    fontWeight: FontWeight.bold,
                    color: AppColors.primary,
                  ),
                  textAlign: TextAlign.center,
                ),
              ),

              // Main Buttons
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: Column(
                  children: [
                    MainActionButton(
                      icon: Icons.book,
                      text: 'الأحاديث النبوية',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const HadithsScreen(),
                          ),
                        );
                      },
                      color: AppColors.primary,
                    ),
                    const SizedBox(height: 15),
                    MainActionButton(
                      icon: Icons.library_books,
                      text: 'المكتبة الإسلامية',
                      onPressed: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => const LibraryScreen(),
                          ),
                        );
                      },
                      color: AppColors.secondary,
                    ),
                  ],
                ),
              ),

              // Features Section
              const Padding(
                padding: EdgeInsets.all(20),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'مميزات التطبيق',
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.bold,
                        color: AppColors.primary,
                      ),
                    ),
                    SizedBox(height: 15),
                    SingleChildScrollView(
                      scrollDirection: Axis.horizontal,
                      child: Row(
                        children: [
                          FeatureCard(
                            icon: Icons.auto_stories,
                            title: 'أحاديث مصنفة',
                            subtitle: 'تصفح الأحاديث حسب الأئمة',
                          ),
                          SizedBox(width: 10),
                          FeatureCard(
                            icon: Icons.group,
                            title: 'مجتمع نسائي',
                            subtitle: 'منتديات للنقاش الهادف',
                          ),
                          SizedBox(width: 10),
                          FeatureCard(
                            icon: Icons.nightlight_round,
                            title: 'وضع ليلي',
                            subtitle: 'راحة لعينيك في الليل',
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}

class FeatureCard extends StatelessWidget {
  final IconData icon;
  final String title;
  final String subtitle;

  const FeatureCard({
    super.key,
    required this.icon,
    required this.title,
    required this.subtitle,
  });

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 3,
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(15),
      ),
      child: Padding(
        padding: const EdgeInsets.all(15),
        child: Column(
          children: [
            Container(
              padding: const EdgeInsets.all(12),
              decoration: BoxDecoration(
                color: AppColors.primary.withOpacity(0.2),
                shape: BoxShape.circle,
              ),
              child: Icon(icon, color: AppColors.primary),
            ),
            const SizedBox(height: 10),
            Text(
              title,
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
              ),
            ),
            Text(
              subtitle,
              style: TextStyle(
                color: Colors.grey[600],
                fontSize: 14,
              ),
            ),
          ],
        ),
      ),
    );
  }
}