import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/danger_header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class SweetsPage extends StatelessWidget {
  const SweetsPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "🍯 كنافة",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظرواا التحديثات",

      "details":
          "انتظرواا التحديثات",

      "calories": "انتظرواا التحديثات ",
      "time": "انتظرواا التحديثات ",
      "rating": "انتظرواا التحديثات",
    },

    {
      "name": "🍩 بلح الشام",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          " انتظروا التحديثات",

      "calories": " انتظروا التحديثات",
      "time": "انتظروا التحديثات ",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍩 الزلابية",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات ",
      "time": "انتظروا التحديثات ",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍝 اللازانيا",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍰 الكيك",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥐 الباتيه",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍰 الجاتو",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🎂 التورتة",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍪 الكعك",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥐 الكرواسون",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍪 البسكويت",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
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
            const DangerHeaderWithBackWidget(),

            const SizedBox(height: 10),

            // ✅ عنوان الصفحة
            const Text(
              '🍰 الحلويات',

              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
                color: Colors.redAccent,
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