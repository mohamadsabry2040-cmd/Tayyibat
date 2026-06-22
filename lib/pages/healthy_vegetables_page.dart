import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class HealthyVegetablesPage extends StatelessWidget {
  const HealthyVegetablesPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "🥔 البطاطس",
      "image": "assets/images/p60.webp",
      "subtitle": "خضار نشوي غني بالطاقة",
      "details":
          "تعتبر البطاطس من الخضروات النشوية وتحتوي على الكربوهيدرات والألياف المفيدة للجسم",
      "calories": "160 سعرة",
      "time": "20 دقيقة",
      "rating": "4.8",
    },
    {
      "name": "🌿 القلقاس",
      "image": "assets/images/p61.webp",
      "subtitle": "غني بالألياف والمعادن",
      "details":
          "القلقاس من الخضروات النشوية ويتميز باحتوائه على عناصر غذائية مفيدة وطعم مميز",
      "calories": "140 سعرة",
      "time": "25 دقيقة",
      "rating": "4.7",
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
            // ✅ الهيدر
            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            // ✅ عنوان الصفحة
            const Text(
              '🥦 الخضروات',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(height: 10),

            // ✅ الجريد
            Expanded(
              child: Padding(
                padding: const EdgeInsets.symmetric(
                  horizontal: 12,
                ),

                child: GridView.builder(
                  itemCount: items.length,

                  physics:
                      const BouncingScrollPhysics(),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(
                    crossAxisCount: 2,

                    crossAxisSpacing: 14,
                    mainAxisSpacing: 14,

                    childAspectRatio: 0.63,
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