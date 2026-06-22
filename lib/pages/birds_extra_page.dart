import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class BirdsExtraPage extends StatelessWidget {
  const BirdsExtraPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "حمام 🕊️",
      "image": "assets/images/p26.webp",
      "subtitle": "غني بالبروتين",

      "details":
          "يعتبر من اللحوم الخفيفة ويحتوي على عناصر غذائية مفيدة للجسم",

      "calories": "290 سعرة",
      "time": "30 دقيقة",
      "rating": "4.8",
    },

    {
      "name": "يمام 🐦",
      "image": "assets/images/p26.webp",
      "subtitle": "وجبة خفيفة",

      "details":
          "يتميز بمذاق لطيف ويقدم ضمن العديد من الأطباق التقليدية",

      "calories": "260 سعرة",
      "time": "25 دقيقة",
      "rating": "4.5",
    },

    {
      "name": "سمان 🐤",
      "image": "assets/images/p26.webp",
      "subtitle": "غني بالعناصر الغذائية",

      "details":
          "يحتوي على نسبة جيدة من البروتين وبعض الفيتامينات المهمة",

      "calories": "310 سعرة",
      "time": "20 دقيقة",
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
              '🐦 طيور إضافية',

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