import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class FatsAndOilsPage extends StatelessWidget {
  const FatsAndOilsPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [

    {
      "name": "🫒 زيت زيتون",
      "image": "assets/images/p56.webp",

      "subtitle":
          "غني بالدهون الأحادية",

      "details":
          "يحتوي على دهون أحادية غير مشبعة ومركبات مضادة للأكسدة ويستخدم ضمن الأنظمة الغذائية المتوازنة",

      "calories": "884 سعرة",

      "time": "1 دقيقة",

      "rating": "4.9",
    },

    {
      "name": "🌽 زيت ذرة",
      "image": "assets/images/p57.webp",

      "subtitle":
          "مصدر للدهون النباتية",

      "details":
          "يحتوي على دهون غير مشبعة وفيتامين E ويستخدم في الطهي وتحضير الأطعمة المختلفة",

      "calories": "884 سعرة",

      "time": "1 دقيقة",

      "rating": "4.6",
    },

    {
      "name": "🥄 السمنة",
      "image": "assets/images/p58.webp",

      "subtitle":
          "مصدر للطاقة",

      "details":
          "تحتوي على دهون مشبعة وتستخدم في بعض الأطعمة والحلويات ويفضل تناولها باعتدال",

      "calories": "900 سعرة",

      "time": "1 دقيقة",

      "rating": "4.5",
    },

    {
      "name": "🧈 الزبدة",
      "image": "assets/images/p59.webp",

      "subtitle":
          "تحتوي على دهون ومنتجات حليب",

      "details":
          "تحتوي على دهون وفيتامينات ذائبة في الدهون وتستخدم في الخبز والطهي",

      "calories": "717 سعرة",

      "time": "1 دقيقة",

      "rating": "4.7",
    },

  ];

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(

        backgroundColor:
            const Color(0xFFF4F6F5),

        body: Column(
          children: [

            // ✅ الهيدر
            const HeaderWithBackWidget(),

            const SizedBox(
              height: 10,
            ),

            // ✅ العنوان
            const Text(
              '🫒 الدهون والزيوت',

              style: TextStyle(
                fontSize: 20,

                fontWeight:
                    FontWeight.bold,

                color:
                    Color(0xFF1B5E20),
              ),
            ),

            const SizedBox(
              height: 10,
            ),

            // ✅ الجريد
            Expanded(

              child: Padding(

                padding:
                    const EdgeInsets.symmetric(
                  horizontal: 12,
                ),

                child: GridView.builder(

                  itemCount:
                      items.length,

                  physics:
                      const BouncingScrollPhysics(),

                  gridDelegate:
                      const SliverGridDelegateWithFixedCrossAxisCount(

                    crossAxisCount: 2,

                    crossAxisSpacing:
                        14,

                    mainAxisSpacing:
                        14,

                    childAspectRatio:
                        0.68,
                  ),

                  itemBuilder:
                      (context, index) {

                    final item =
                        items[index];

                    return FoodCardWidget(

                      name:
                          item["name"],

                      image:
                          item["image"],

                      subtitle:
                          item["subtitle"],

                      details:
                          item["details"],

                      calories:
                          item["calories"],

                      time:
                          item["time"],

                      rating:
                          item["rating"],

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