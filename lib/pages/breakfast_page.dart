import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/food_card_widget.dart';

class BreakfastPage extends StatelessWidget {
  const BreakfastPage({super.key});

  static const List<Map<String, dynamic>> items = [
    {
      "name": "خبز بالرده",
      "image": "assets/images/p1.webp",
      "subtitle": "غني بالألياف",
      "details":
          "وجبة صحية غنية بالعناصر الغذائية ومناسبة لنظام غذائي متوازن",
      "calories": "320 سعرة",
      "time": "20 دقيقة",
      "rating": "4.8",
    },
    {
      "name": "التوست الاسمر",
      "image": "assets/images/p2.webp",
      "subtitle": "مصدر جيد للطاقة",
      "details":
          "يساعد على الشعور بالشبع لفترة أطول ومناسب للفطور الصحي",
      "calories": "250 سعرة",
      "time": "10 دقائق",
      "rating": "4.6",
    },

    {
      "name": "خبز الشعير",
      "image": "assets/images/p54.webp",
      "subtitle": "مصدر جيد للطاقة",
      "details":
          "يساعد على الشعور بالشبع لفترة أطول ومناسب للفطور الصحي",
      "calories": "250 سعرة",
      "time": "10 دقائق",
      "rating": "4.6",
    },

    {
      "name": "البطاطس المقلية",
      "image": "assets/images/p03.webp",
      "subtitle": "يحتوي على سعرات عالية",
      "details":
          "يفضل تناوله باعتدال ضمن نظام غذائي متوازن",
      "calories": "500 سعرة",
      "time": "25 دقيقة",
      "rating": "4.3",
    },
    {
      "name": "البطاطس المسلوقة",
      "image": "assets/images/p04.webp",
      "subtitle": "خيار صحي ومغذي",
      "details":
          "غنية بالعناصر المفيدة وتساعد على الإحساس بالشبع",
      "calories": "180 سعرة",
      "time": "15 دقيقة",
      "rating": "4.7",
    },
    {
      "name": "الحلاوة الطحينية",
      "image": "assets/images/p06.webp",
      "subtitle": "غنية بالمعادن",
      "details":
          "مصدر جيد للطاقة وتحتوي على عناصر غذائية مفيدة",
      "calories": "420 سعرة",
      "time": "5 دقائق",
      "rating": "4.5",
    },
    {
      "name": "جبنة مثلثات",
      "image": "assets/images/p05.webp",
      "subtitle": "مصدر للكالسيوم",
      "details":
          "تساعد في دعم صحة العظام والأسنان",
      "calories": "210 سعرة",
      "time": "3 دقائق",
      "rating": "4.4",
    },
    {
      "name": "عسل نحل",
      "image": "assets/images/p44.webp",
      "subtitle": "مصدر الفركتوز",
      "details":
          "تساعد في دعم صحة العظام والأسنان",
      "calories": "210 سعرة",
      "time": "3 دقائق",
      "rating": "4.4",
    },
    {
      "name": "مربي تفاح و خوخ و تين",
      "image": "assets/images/p45.webp",
      "subtitle": "مصدر الفركتوز",
      "details":
          "تساعد في دعم صحة العظام والأسنان",
      "calories": "210 سعرة",
      "time": "3 دقائق",
      "rating": "4.4",
    },
    {
      "name": "شكولاته نوتيلا",
      "image": "assets/images/p46.webp",
      "subtitle": "مصدر سريع للطاقة",
      "details":
          "تساعد في دعم صحة العظام والأسنان",
      "calories": "210 سعرة",
      "time": "3 دقائق",
      "rating": "4.4",
    },
    {
      "name": "القشطة",
      "image": "assets/images/p53.webp",
      "subtitle": "مصدر للدهون والطاقة",
      "details":
          "تحتوي على الدهون ومنتجات الحليب وتستخدم في الحلويات والأطعمة المختلفة",
      "calories": "340 سعرة",
      "time": "2 دقائق",
      "rating": "4.5",
    },
    {    
      "name": "الجبنة الرومي",
      "image": "assets/images/p52.webp",
      "subtitle": "غنية بالطاقة",
      "details":
          "تحتوي على الدهون والبروتين والكالسيوم وتؤكل باعتدال",
      "calories": "387 سعرة",
      "time": "2 دقائق",
      "rating": "4.4",
    },


    {
      "name": "جبنة فلمنك",
      "image": "assets/images/p51.webp",
      "subtitle": "مصدر للبروتين والكالسيوم",
      "details":
          "تحتوي على البروتين والكالسيوم وتستخدم في السندويتشات والوجبات المختلفة",
      "calories": "350 سعرة",
      "time": "2 دقائق",
      "rating": "4.5",
    },

    {
      "name": "جبنة شيدر",
      "image": "assets/images/p50.webp",
      "subtitle": "غنية بالكالسيوم",
      "details":
          "تحتوي على البروتين والدهون والكالسيوم وتستخدم في الأطعمة والمخبوزات",
      "calories": "403 سعرة",
      "time": "2 دقائق",
      "rating": "4.6",
    },

    {
      "name": "جبنة جودا",
      "image": "assets/images/p49.webp",
      "subtitle": "مصدر جيد للكالسيوم",
      "details":
          "تحتوي على البروتين والكالسيوم والدهون وتتميز بطعمها المعتدل",
      "calories": "356 سعرة",
      "time": "2 دقائق",
      "rating": "4.5",
    },

    {
      "name": "جبنة بارميزان",
      "image": "assets/images/p48.webp",
      "subtitle": "مرتفعة بالبروتين",
      "details":
          "تحتوي على نسبة مرتفعة من البروتين والكالسيوم وتستخدم مبشورة مع الأطعمة",
      "calories": "431 سعرة",
      "time": "2 دقائق",
      "rating": "4.7",
    },

    {
      "name": "جبنة موتزاريلا",
      "image": "assets/images/p47.webp",
      "subtitle": "مصدر للبروتين",
      "details":
          "تحتوي على البروتين والكالسيوم وتستخدم في البيتزا والأطعمة المختلفة",
      "calories": "280 سعرة",
      "time": "2 دقائق",
      "rating": "4.8",
    },

  ];
  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xFFF8F9FA),

        body: Column(
          children: [

            // ✅ الهيدر
            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            // ✅ عنوان الصفحة
            const Text(
              '🥗 الفطار والعشاء',

              style: TextStyle(
                fontSize: 22,
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

                      // ✅ التفاصيل الإضافية
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