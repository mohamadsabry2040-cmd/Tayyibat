import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class NaturalFruitsPage extends StatelessWidget {
  const NaturalFruitsPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "🍏 تفاح بدون قشر",
      "image": "assets/images/p37.webp",
      "subtitle": "غني بالألياف",

      "details":
          "يساعد في دعم الهضم ويحتوي على عناصر غذائية مفيدة للجسم",

      "calories": "95 سعرة",
      "time": "2 دقيقة",
      "rating": "4.9",
    },

    {
      "name": "🍐 كمثري بدون قشر",
      "image": "assets/images/p38.webp",
      "subtitle": "مصدر طبيعي للطاقة",

      "details":
          "تحتوي على نسبة جيدة من الفيتامينات وتساعد على الترطيب",

      "calories": "100 سعرة",
      "time": "2 دقيقة",
      "rating": "4.7",
    },

    {
      "name": "🍇 عنب",
      "image": "assets/images/p39.webp",
      "subtitle": "غني بمضادات الأكسدة",

      "details":
          "يساعد في دعم صحة الجسم ويتميز بمذاق حلو ومنعش",

      "calories": "110 سعرة",
      "time": "1 دقيقة",
      "rating": "4.8",
    },

    {
      "name": "🌴 تمر",
      "image": "assets/images/p40.webp",
      "subtitle": "مصدر سريع للطاقة",

      "details":
          "يحتوي على سكريات طبيعية وعناصر غذائية مفيدة للجسم",

      "calories": "140 سعرة",
      "time": "1 دقيقة",
      "rating": "4.9",
    },

    {
      "name": "🌴 رطب",
      "image": "assets/images/p43.webp",
      "subtitle": "غني بالمعادن",

      "details":
          "يتميز بمذاق طبيعي غني ويساعد في منح الجسم طاقة سريعة",

      "calories": "120 سعرة",
      "time": "1 دقيقة",
      "rating": "4.8",
    },

    {
      "name": "🍈 تين",
      "image": "assets/images/p41.webp",
      "subtitle": "غني بالألياف",

      "details":
          "يساعد في دعم الهضم ويحتوي على عناصر غذائية متنوعة",

      "calories": "90 سعرة",
      "time": "2 دقيقة",
      "rating": "4.6",
    },

    {
      "name": "🍌 موز",
      "image": "assets/images/p42.webp",
      "subtitle": "مصدر للبوتاسيوم",

      "details":
          "يساعد في دعم الطاقة ويعتبر خيارًا مناسبًا قبل التمارين",

      "calories": "105 سعرة",
      "time": "1 دقيقة",
      "rating": "4.9",
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
              'ثمار طبيعية',

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