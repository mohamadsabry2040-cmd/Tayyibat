import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class AllowedDrinksPage extends StatelessWidget {
  const AllowedDrinksPage({super.key});

  // ✅ البيانات
  static const List<Map<String, dynamic>> items = [
    {
      "name": "🍇 عصير العنب",
      "image": "assets/images/p27.webp",
      "subtitle": "غني بمضادات الأكسدة",
      "details":
          "يساعد في دعم صحة الجسم ويمنح إحساسًا بالانتعاش والطاقة",
      "calories": "120 سعرة",
      "time": "3 دقائق",
      "rating": "4.8",
    },
    {
      "name": "🍏 التفاح بدون قشر",
      "image": "assets/images/p28.webp",
      "subtitle": "خفيف على المعدة",
      "details":
          "يعتبر خيارًا مناسبًا ويحتوي على عناصر غذائية مفيدة",
      "calories": "95 سعرة",
      "time": "2 دقيقة",
      "rating": "4.7",
    },
    {
      "name": "🍈 الجوافة بدون بذر",
      "image": "assets/images/p29.webp",
      "subtitle": "غنية بفيتامين C",
      "details":
          "تساعد في دعم المناعة وتتميز بمذاق طبيعي منعش",
      "calories": "110 سعرة",
      "time": "3 دقائق",
      "rating": "4.8",
    },
    {
      "name": "🍎 الرمان عصير مصفى",
      "image": "assets/images/p30.webp",
      "subtitle": "غني بالعناصر الغذائية",
      "details":
          "يحتوي على مضادات أكسدة طبيعية ويساعد في الترطيب",
      "calories": "130 سعرة",
      "time": "4 دقائق",
      "rating": "4.9",
    },
    {
      "name": "🍎 عصير القصب",
      "image": "assets/images/p31.webp",
      "subtitle": "مصدر سريع للطاقة",
      "details":
          "يمنح الجسم طاقة فورية ويتميز بمذاق حلو طبيعي",
      "calories": "150 سعرة",
      "time": "2 دقيقة",
      "rating": "4.6",
    },
    {
      "name": "🍎 قمر الدين",
      "image": "assets/images/p32.webp",
      "subtitle": "غني بالفيتامينات",
      "details":
          "مشروب مشهور يتميز بمذاق غني ويساعد في منح الطاقة",
      "calories": "170 سعرة",
      "time": "5 دقائق",
      "rating": "4.7",
    },
    {
      "name": "🍵 مشروبات الاعشاب",
      "image": "assets/images/p33.webp",
      "subtitle": "مهدئة ومنعشة",
      "details":
          "تساعد على الاسترخاء وتتميز بفوائد طبيعية متعددة",
      "calories": "40 سعرة",
      "time": "5 دقائق",
      "rating": "4.8",
    },
    {
      "name": "🍵 مشروب المغات",
      "image": "assets/images/p34.webp",
      "subtitle": "مشروب تقليدي",
      "details":
          "يتميز بقوام غني ويقدم دافئًا خاصة في الأجواء الباردة",
      "calories": "190 سعرة",
      "time": "10 دقائق",
      "rating": "4.5",
    },
    {
      "name": "☕️ قهوة تركي",
      "image": "assets/images/p35.webp",
      "subtitle": "غنية بالكافيين",
      "details":
          "تساعد في زيادة التركيز وتتميز بمذاق قوي ومميز",
      "calories": "15 سعرة",
      "time": "5 دقائق",
      "rating": "4.9",
    },
    {
      "name": "🍵 شاي أخضر",
      "image": "assets/images/p36.webp",
      "subtitle": "غني بمضادات الأكسدة",
      "details":
          "يساعد في دعم النشاط ويعتبر خيارًا صحيًا خفيفًا",
      "calories": "5 سعرات",
      "time": "4 دقائق",
      "rating": "4.8",
    },
    {
      "name": "🥮 بسبوسة بالقشطة",
      "image": "assets/images/p055.webp",
      "subtitle": "غنية بالطاقة والكربوهيدرات",
      "details":
          "تحتوي على السميد والقشطة والسكريات وتؤكل باعتدال ضمن نظام غذائي متوازن",
      "calories": "380 سعرة",
      "time": "10 دقائق",
      "rating": "4.8",
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
              '🍎 المشروبات و الحلويات',

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

                    // ✅ ارتفاع مناسب للكارت
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