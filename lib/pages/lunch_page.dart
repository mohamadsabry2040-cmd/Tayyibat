import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class LunchPage extends StatelessWidget {
  const LunchPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "لحم جملي 🐪",
      "image": "assets/images/p07.webp",
      "subtitle": "غني بالبروتين",

      "details":
          "يحتوي على نسبة عالية من البروتين والعناصر الغذائية المهمة للجسم",

      "calories": "350 سعرة",
      "time": "45 دقيقة",
      "rating": "4.7",
    },

    {
      "name": "راس جملي 🐪",
      "image": "assets/images/p013.webp",
      "subtitle": "مصدر للطاقة",

      "details":
          "يتميز بمذاق غني ويحتوي على عناصر غذائية متنوعة",

      "calories": "420 سعرة",
      "time": "60 دقيقة",
      "rating": "4.5",
    },

    {
      "name": "مخ جملي 🐪",
      "image": "assets/images/p09.webp",
      "subtitle": "غني بالدهون",

      "details":
          "يحتوي على نسبة مرتفعة من الدهون ويقدم كوجبة تقليدية شهيرة",

      "calories": "500 سعرة",
      "time": "35 دقيقة",
      "rating": "4.3",
    },

    {
      "name": "كبدة جملي 🐪",
      "image": "assets/images/p08.webp",
      "subtitle": "غنية بالحديد",

      "details":
          "مصدر ممتاز للحديد وبعض الفيتامينات المهمة للجسم",

      "calories": "310 سعرة",
      "time": "20 دقيقة",
      "rating": "4.8",
    },

    {
      "name": "كوارع جملي 🐪",
      "image": "assets/images/p012.webp",
      "subtitle": "غنية بالكولاجين",

      "details":
          "تساعد في دعم صحة المفاصل وتمنح إحساسًا بالشبع",

      "calories": "390 سعرة",
      "time": "90 دقيقة",
      "rating": "4.4",
    },

    {
      "name": "امعاء جملي 🐪",
      "image": "assets/images/p010.webp",
      "subtitle": "وجبة شعبية",

      "details":
          "تعتبر من الأكلات التقليدية المحببة لدى بعض الأشخاص",

      "calories": "430 سعرة",
      "time": "50 دقيقة",
      "rating": "4.1",
    },

    {
      "name": "سنام جملي 🐪",
      "image": "assets/images/p011.webp",
      "subtitle": "غني بالطاقة",

      "details":
          "يحتوي على نسبة مرتفعة من الدهون ويمنح الجسم طاقة عالية",

      "calories": "540 سعرة",
      "time": "70 دقيقة",
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

            // ✅ الهيدر
            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            // ✅ عنوان الصفحة
            const Text(
              '🍗 الجمل',

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