import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class KebdaPage extends StatelessWidget {
  const KebdaPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "لحم جاموسي 🐃",
      "image": "assets/images/p014.webp",
      "subtitle": "غني بالبروتين",

      "details":
          "يحتوي على نسبة جيدة من البروتين والعناصر الغذائية المهمة للجسم",

      "calories": "360 سعرة",
      "time": "40 دقيقة",
      "rating": "4.7",
    },

    {
      "name": "راس جاموسي 🐃",
      "image": "assets/images/p015.webp",
      "subtitle": "مصدر للطاقة",

      "details":
          "وجبة تقليدية ذات مذاق غني وتحتوي على عناصر غذائية متنوعة",

      "calories": "430 سعرة",
      "time": "55 دقيقة",
      "rating": "4.5",
    },

    {
      "name": "مخ جاموسي 🐃",
      "image": "assets/images/p016.webp",
      "subtitle": "غني بالدهون",

      "details":
          "يحتوي على نسبة مرتفعة من الدهون ويقدم في العديد من الأطباق الشعبية",

      "calories": "520 سعرة",
      "time": "30 دقيقة",
      "rating": "4.2",
    },

    {
      "name": "كبدة جاموسي 🐃",
      "image": "assets/images/p017.webp",
      "subtitle": "غنية بالحديد",

      "details":
          "تعتبر مصدرًا ممتازًا للحديد وبعض الفيتامينات المفيدة للجسم",

      "calories": "300 سعرة",
      "time": "20 دقيقة",
      "rating": "4.9",
    },

    {
      "name": "كوارع جاموسي 🐃",
      "image": "assets/images/p018.webp",
      "subtitle": "غنية بالكولاجين",

      "details":
          "تساعد في دعم صحة المفاصل وتمنح إحساسًا بالشبع لفترة أطول",

      "calories": "410 سعرة",
      "time": "85 دقيقة",
      "rating": "4.4",
    },

    {
      "name": "امعاء جاموسي 🐃",
      "image": "assets/images/p019.webp",
      "subtitle": "وجبة شعبية",

      "details":
          "من الأكلات التقليدية المشهورة لدى بعض الثقافات الغذائية",

      "calories": "440 سعرة",
      "time": "50 دقيقة",
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
              '🍖 جاموسي',

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