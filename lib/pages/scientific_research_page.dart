import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';

class ScientificResearchPage extends StatelessWidget {
  const ScientificResearchPage({super.key});

  Widget sectionTitle(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(
          fontSize: 20,
          fontWeight: FontWeight.bold,
        ),
      ),
    );
  }

  Widget textItem(String text) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 4),
      child: Text(
        text,
        textAlign: TextAlign.right,
        style: const TextStyle(fontSize: 16),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        body: Column(
          children: [
            const HeaderWithBackWidget(), // ✅ الهيدر الجديد

            Expanded(
              child: SingleChildScrollView(
                child: Padding(
                  padding: const EdgeInsets.symmetric(
                    horizontal: 10,
                    vertical: 16,
                  ),
                  child: SizedBox(
                    width: double.infinity,
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        sectionTitle('🏆 جائزة نوبل في الطب 2016'),

                        textItem('تم منح الجائزة إلى:'),
                        textItem('👉 يوشينوري أوسومي (ياباني)'),

                        sectionTitle('🔬 سبب الجائزة'),
                        textItem('لاكتشافه: آليات الالتهام الذاتي (Autophagy)'),

                        sectionTitle('🧠 ما هو الالتهام الذاتي؟'),
                        textItem('هو عملية تقوم فيها الخلية بـ:'),
                        textItem('• تكسير مكوناتها التالفة'),
                        textItem('• إعادة تدويرها'),
                        textItem('• استخدام نواتجها لإنتاج طاقة أو بناء جديد'),

                        textItem('📌 بمعنى بسيط:'),
                        textItem('👉 الخلية تنظف نفسها بنفسها'),

                        sectionTitle('🧪 كيف تم الاكتشاف؟'),
                        textItem('• في التسعينيات'),
                        textItem('• استخدم خميرة الخباز كنموذج'),
                        textItem('• اكتشف الجينات المسؤولة'),
                        textItem('• شرح الآلية بالكامل'),

                        sectionTitle('🔍 لماذا هذا مهم؟'),
                        textItem('يلعب دورًا في:'),
                        textItem('• البقاء أثناء الجوع'),
                        textItem('• مقاومة العدوى'),
                        textItem('• نمو الأجنة'),
                        textItem('• التخلص من البروتينات التالفة'),

                        sectionTitle('⚠️ علاقته بالأمراض'),
                        textItem('• باركنسون'),
                        textItem('• السكري'),
                        textItem('• السرطان'),
                        textItem('• أمراض الشيخوخة'),

                        sectionTitle('🧬 أهمية الاكتشاف'),
                        textItem('• غيّر فهمنا لكيفية عمل الخلايا'),
                        textItem('• فتح بابًا لأبحاث علاجية جديدة'),
                      ],
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}