import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/danger_header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class WhiteFlourPage extends StatelessWidget {
  const WhiteFlourPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "🍞 البلدي",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🍞 الأبيض",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥖 الفينو",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥖 بتاو",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥖 سوري",
      "image": "assets/images/sq3.webp",
      "subtitle": "انتظروا التحديثات",

      "details":
          "انتظروا التحديثات",

      "calories": "انتظروا التحديثات",
      "time": "انتظروا التحديثات",
      "rating": "انتظروا التحديثات",
    },

    {
      "name": "🥖 كيزر",
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
              '🍞 الدقيق الأبيض',

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