import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class BioPage extends StatelessWidget {
  const BioPage({super.key});

  // فتح جروب الفيسبوك
  Future<void> openFacebookGroup() async {
    final Uri url = Uri.parse(
      'https://www.facebook.com/share/g/18sbP4mXeW/',
    );

    await launchUrl(
      url,
      mode: LaunchMode.externalApplication,
    );
  }

  Widget buildSection({
    required String title,
    required String content,
    required IconData icon,
    required Color color,
  }) {
    return Container(
      padding: const EdgeInsets.all(18),
      margin: const EdgeInsets.only(
        bottom: 20,
      ),

      decoration: BoxDecoration(
        color: Colors.white,

        borderRadius:
            BorderRadius.circular(25),

        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(
              alpha: 0.05,
            ),

            blurRadius: 15,

            offset: const Offset(0, 6),
          ),
        ],
      ),

      child: Column(
        crossAxisAlignment:
            CrossAxisAlignment.start,

        children: [
          Row(
            children: [
              Container(
                padding:
                    const EdgeInsets.all(10),

                decoration: BoxDecoration(
                  color: color.withValues(
                    alpha: 0.12,
                  ),

                  borderRadius:
                      BorderRadius.circular(
                    14,
                  ),
                ),

                child: Icon(
                  icon,
                  color: color,
                  size: 24,
                ),
              ),

              const SizedBox(width: 12),

              Text(
                title,

                style: TextStyle(
                  fontSize: 22,
                  fontWeight:
                      FontWeight.bold,

                  color: color,
                ),
              ),
            ],
          ),

          const SizedBox(height: 18),

          Text(
            content,

            style: const TextStyle(
              fontSize: 16,
              height: 1.9,
              color: Colors.black87,
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor:
            const Color(0xFFF4F6F5),

        body: Column(
          children: [
            const HeaderWithBackWidget(),

            const SizedBox(height: 20),

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.all(16),

                child: ListView(
                  children: [
                    Center(
                      child: Container(
                        margin:
                            const EdgeInsets.only(
                          bottom: 25,
                        ),

                        width: 130,
                        height: 130,

                        decoration:
                            BoxDecoration(
                          shape: BoxShape.circle,

                          border: Border.all(
                            color: Colors.white,
                            width: 4,
                          ),

                          boxShadow: [
                            BoxShadow(
                              color: Colors.black
                                  .withValues(
                                alpha: 0.1,
                              ),

                              blurRadius: 12,
                            ),
                          ],

                          image:
                              const DecorationImage(
                            image: AssetImage(
                              'assets/images/doctor.jpg',
                            ),
                            fit: BoxFit.cover,
                          ),
                        ),
                      ),
                    ),

                    // ✅ السيرة الذاتية
                    buildSection(
                      title: 'السيرة الذاتية',

                      icon: Icons.person,

                      color:
                          const Color(0xFF1B8F5A),

                      content:
                          'الاسم بالكامل ضياء الدين شلبي محمد العوضي من مواليد عام 1979، تخرج من كلية الطب جامعة عين شمس عام 2002 بتقدير امتياز، تخصص في التخدير والرعاية المركزة، حصل على لقب استشاري (أ) وكان عمره 31 عامًا، حصل على درجة الدكتوراه، صاحب نظام الطيبات ويؤمن أن المرض نتيجة نمط حياة خاطئ، وتوفي في ظروف غامضة رحمه الله تعالى وجزاه عنا خيرًا وأسكنه فسيح جناته.',
                    ),

                    // ✅ من نحن
                    buildSection(
                      title: 'من نحن',

                      icon: Icons.groups,

                      color:
                          const Color(0xFF1565C0),

                      content:
                          'بعد انتشار الأمراض ورؤيتنا لأحبابنا يتألمون من الأمراض والآلام، ثم تجربة نظام الطيبات، تم إنشاء هذا التطبيق صدقة على روحه بجهود ذاتية.',
                    ),

                    // ✅ هدف التطبيق
                    buildSection(
                      title: 'هدف التطبيق',

                      icon: Icons.favorite,

                      color:
                          const Color(0xFFE65100),

                      content:
                          'نشر ودعم ثقافة الأكل الصحي وتشجيع العادات الغذائية المفيدة بأسلوب بسيط على مستوى العالم باللغتين العربية والإنجليزية.\n\nننتظر دعمكم بالأفكار والاقتراحات.',
                    ),

                    // ✅ جروب الفيسبوك
                    Container(
                      padding:
                          const EdgeInsets.all(18),

                      margin:
                          const EdgeInsets.only(
                        bottom: 20,
                      ),

                      decoration: BoxDecoration(
                        color: Colors.white,

                        borderRadius:
                            BorderRadius.circular(
                          25,
                        ),

                        boxShadow: [
                          BoxShadow(
                            color: Colors.black
                                .withValues(
                              alpha: 0.05,
                            ),

                            blurRadius: 15,

                            offset:
                                const Offset(0, 6),
                          ),
                        ],
                      ),

                      child: Column(
                        crossAxisAlignment:
                            CrossAxisAlignment.start,

                        children: [
                          Row(
                            children: [
                              Container(
                                padding:
                                    const EdgeInsets
                                        .all(10),

                                decoration:
                                    BoxDecoration(
                                  color: Colors.blue
                                      .withValues(
                                    alpha: 0.12,
                                  ),

                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    14,
                                  ),
                                ),

                                child: const Icon(
                                  Icons.facebook,
                                  color: Colors.blue,
                                  size: 24,
                                ),
                              ),
                              const SizedBox(
                                width: 12,
                              ),

                              const Text(
                                'جروب الفيسبوك الرسمي',

                                style: TextStyle(
                                  fontSize: 22,
                                  fontWeight:
                                      FontWeight
                                          .bold,

                                  color:
                                      Colors.blue,
                                ),
                              ),
                            ],
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          const Text(
                            'انضم إلى مجتمع الطيبات الرسمي لمشاركة التجارب والمنتجات والنصائح الغذائية المفيدة.',

                            style: TextStyle(
                              fontSize: 16,
                              height: 1.9,
                              color:
                                  Colors.black87,
                            ),
                          ),

                          const SizedBox(
                            height: 18,
                          ),

                          SizedBox(
                            width: double.infinity,

                            child: ElevatedButton.icon(
                              onPressed:
                                  openFacebookGroup,

                              icon: const Icon(
                                Icons.facebook,
                              ),

                              label: const Text(
                                'الانضمام للجروب',
                              ),

                              style:
                                  ElevatedButton
                                      .styleFrom(
                                backgroundColor:
                                    Colors.blue,

                                foregroundColor:
                                    Colors.white,

                                padding:
                                    const EdgeInsets
                                        .symmetric(
                                  vertical: 14,
                                ),

                                shape:
                                    RoundedRectangleBorder(
                                  borderRadius:
                                      BorderRadius
                                          .circular(
                                    16,
                                  ),
                                ),
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}