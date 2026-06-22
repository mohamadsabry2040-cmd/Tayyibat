import 'dart:async';
import 'package:flutter/material.dart';

class HadithSliderWidget extends StatefulWidget {
  const HadithSliderWidget({super.key});

  @override
  State<HadithSliderWidget> createState() =>
      _HadithSliderWidgetState();
}

class _HadithSliderWidgetState extends State<HadithSliderWidget> {
  final PageController _pageController = PageController();

  int currentPage = 0;
  late Timer timer;

  final List<Map<String, dynamic>> hadiths = [
    {
      'title': 'صيام الأيام البيض',
      'icon': Icons.brightness_3,
      'color1': const Color(0xFF5B3DF5),
      'color2': const Color(0xFF7B61FF),
      'text':
          'عن أبي ذر رضي الله عنه قال: قال رسول الله ﷺ: إذا صمت من الشهر ثلاثًا، فصم ثلاث عشرة، وأربع عشرة، وخمس عشرة.',
    },
    {
      'title': 'صيام الإثنين والخميس',
      'icon': Icons.calendar_month,
      'color1': const Color(0xFF00897B),
      'color2': const Color(0xFF26A69A),
      'text':
          'ثبت عن رسول الله ﷺ أنه كان يصوم الإثنين والخميس ويقول: إنهما يومان تعرض فيهما الأعمال على الله، فأحب أن يعرض عملي وأنا صائم.',
    },
    {
      'title': 'صيام عشر ذي الحجة',
      'icon': Icons.star,
      'color1': const Color(0xFFFF9800),
      'color2': const Color(0xFFFFC107),
      'text':
          'قال رسول الله ﷺ: "ما من أيامٍ العملُ الصالحُ فيها أحبُّ إلى الله من هذه الأيام" قالوا: ولا الجهاد في سبيل الله؟ قال: "ولا الجهاد في سبيل الله إلا رجل خرج بنفسه وماله ثم لم يرجع من ذلك بشيء"',
    },
    {
      'title': 'صيام عاشوراء',
      'icon': Icons.auto_awesome,
      'color1': const Color(0xFFE91E63),
      'color2': const Color(0xFFF06292),
      'text':
          'قال رسول الله ﷺ: "صيام يوم عاشوراء، أحتسب على الله أن يُكفِّر السنة التي قبله" رواه مسلم',
    },
  ];

  @override
  void initState() {
    super.initState();

    timer = Timer.periodic(const Duration(seconds: 10), (_) {
      setState(() {
        currentPage = (currentPage + 1) % hadiths.length;
      });

      _pageController.animateToPage(
        currentPage,
        duration: const Duration(milliseconds: 500),
        curve: Curves.easeInOut,
      );
    });
  }

  @override
  void dispose() {
    timer.cancel();
    _pageController.dispose();
    super.dispose();
  }

  Widget buildIndicator(bool isActive) {
    return AnimatedContainer(
      duration: const Duration(milliseconds: 300),
      margin: const EdgeInsets.symmetric(horizontal: 4),
      width: isActive ? 20 : 8,
      height: 6,
      decoration: BoxDecoration(
        color: isActive
            ? Colors.white
            : Colors.white.withValues(alpha: 0.4),
        borderRadius: BorderRadius.circular(20),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 260,
          child: PageView.builder(
            controller: _pageController,
            physics: const ClampingScrollPhysics(),
            onPageChanged: (index) {
              setState(() {
                currentPage = index;
              });
            },
            itemCount: hadiths.length,
            itemBuilder: (context, index) {
              final hadith = hadiths[index];

              return Container(
                margin: const EdgeInsets.symmetric(
                  horizontal: 6,
                  vertical: 10,
                ),
                padding: const EdgeInsets.all(18),
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(28),
                  gradient: LinearGradient(
                    begin: Alignment.topRight,
                    end: Alignment.bottomLeft,
                    colors: [
                      hadith['color1'],
                      hadith['color2'],
                    ],
                    ),
                  boxShadow: [
                    BoxShadow(
                      color: hadith['color1']
                          .withValues(alpha: 0.25),
                      blurRadius: 12,
                      offset: const Offset(0, 6),
                    ),
                  ],
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                            color: Colors.white
                                .withValues(alpha: 0.2),
                            borderRadius: BorderRadius.circular(14),
                          ),
                          child: Icon(
                            hadith['icon'],
                            color: Colors.white,
                            size: 22,
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Text(
                            hadith['title'],
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                      ],
                    ),

                    const SizedBox(height: 12),

                    Text(
                      hadith['text'],
                      style: const TextStyle(
                        color: Colors.white,
                        fontSize: 17,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ],
                ),
              );
            },
          ),
        ),

        const SizedBox(height: 10),

        Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: List.generate(
            hadiths.length,
            (index) => buildIndicator(currentPage == index),
          ),
        ),
      ],
    );
  }
}