import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class FishPage extends StatelessWidget {
  const FishPage({super.key});

  // ✅ بيانات الأسماك
  static const List<Map<String, dynamic>> items = [
    {
      "name": "تونة 🐟",
      "image": "assets/images/p62.webp",
      "subtitle": "غنية بالبروتين",

      "details":
          "تعتبر التونة من أفضل مصادر البروتين وأوميغا 3 وتساعد في بناء العضلات",

      "calories": "200 سعرة",
      "time": "20 دقيقة",
      "rating": "4.8",
    },

    {
      "name": "سردين 🐟",
      "image": "assets/images/p63.webp",
      "subtitle": "غني بالدهون الصحية",

      "details":
          "السردين يحتوي على أوميغا 3 والكالسيوم وهو مفيد لصحة القلب والعظام",

      "calories": "180 سعرة",
      "time": "15 دقيقة",
      "rating": "4.6",
    },

    {
      "name": "رنجة 🐟",
      "image": "assets/images/p64.webp",
      "subtitle": "مدخن ولذيذ",

      "details":
          "الرنجة من الأسماك المدخنة الشهيرة وتقدم غالبًا في المناسبات",

      "calories": "250 سعرة",
      "time": "25 دقيقة",
      "rating": "4.5",
    },

    {
      "name": "ماكريل 🐟",
      "image": "assets/images/p65.webp",
      "subtitle": "غني بالزيوت المفيدة",

      "details":
          "الماكريل يحتوي على نسبة عالية من الأحماض الدهنية المفيدة للجسم",

      "calories": "220 سعرة",
      "time": "30 دقيقة",
      "rating": "4.7",
    },

    {
      "name": "أسماك بحر 🌊",
      "image": "assets/images/p66.webp",
      "subtitle": "أنواع متنوعة",

      "details":
          " جميع أسماك البحر عدا الجمبرى الكابوريا الأستاكوزا",

      "calories": "متوسط",
      "time": "35 دقيقة",
      "rating": "4.6",
    },
  ];

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F5),

        body: Column(
          children: [

            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            const Text(
              '🐟 الأسماك',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(horizontal: 12),

                child: GridView.builder(
                  itemCount: items.length,

                  physics: const BouncingScrollPhysics(),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,
                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,
                    childAspectRatio: 0.68,
                  ),

                  itemBuilder: (context, index) {
                    final item = items[index];

                    return FoodCardWidget(
                      name: item["name"],
                      image: item["image"],
                      subtitle: item["subtitle"],
                      details: item["details"],
                      calories: item["calories"],
                      time: item["time"],
                      rating: item["rating"],
                      onTap: () {},
                    );
                  },
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}