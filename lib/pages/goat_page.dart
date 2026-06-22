import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class GoatPage extends StatelessWidget {
  const GoatPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "لحم ماعز 🐐",
      "image": "assets/images/p19.webp",
      "subtitle": "غني بالبروتين",

      "details":
          "يحتوي على نسبة جيدة من البروتين والعناصر الغذائية المفيدة للجسم",

      "calories": "320 سعرة",
      "time": "35 دقيقة",
      "rating": "4.7",
    },

    {
      "name": "رأس ماعز 🐐",
      "image": "assets/images/p21.webp",
      "subtitle": "مصدر للطاقة",

      "details":
          "وجبة تقليدية ذات مذاق غني وتحتوي على عناصر غذائية متنوعة",

      "calories": "410 سعرة",
      "time": "50 دقيقة",
      "rating": "4.5",
    },

    {
      "name": "مخ ماعز 🐐",
      "image": "assets/images/p22.webp",
      "subtitle": "غني بالدهون",

      "details":
          "يحتوي على نسبة مرتفعة من الدهون ويقدم ضمن الأكلات الشعبية",

      "calories": "490 سعرة",
      "time": "25 دقيقة",
      "rating": "4.2",
    },

    {
      "name": "كبدة ماعز 🐐",
      "image": "assets/images/p23.webp",
      "subtitle": "غنية بالحديد",

      "details":
          "تعتبر مصدرًا ممتازًا للحديد وبعض الفيتامينات المهمة للجسم",

      "calories": "280 سعرة",
      "time": "18 دقيقة",
      "rating": "4.9",
    },

    {
      "name": "كوارع ماعز 🐐",
      "image": "assets/images/p24.webp",
      "subtitle": "غنية بالكولاجين",

      "details":
          "تساعد في دعم صحة المفاصل وتمنح إحساسًا بالشبع لفترة أطول",

      "calories": "400 سعرة",
      "time": "75 دقيقة",
      "rating": "4.4",
    },

    {
      "name": "أمعاء ماعز 🐐",
      "image": "assets/images/p25.webp",
      "subtitle": "وجبة شعبية",

      "details":
          "من الأكلات التقليدية المشهورة لدى بعض الثقافات الغذائية",

      "calories": "420 سعرة",
      "time": "45 دقيقة",
      "rating": "4.1",
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
              '🐐 الماعز',

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