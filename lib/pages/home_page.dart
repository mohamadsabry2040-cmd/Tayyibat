import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_widget.dart';
import 'package:tayyibat_app/design/widgets/bottom_nav_widget.dart';
import 'package:tayyibat_app/design/widgets/home_feature_card.dart';
import 'package:tayyibat_app/design/widgets/welcome_card.dart';
import 'package:tayyibat_app/design/widgets/hadith_slider_widget.dart';
import 'package:url_launcher/url_launcher.dart';

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  Future<void> openWhatsApp() async {
    final Uri appUrl = Uri.parse(
      'whatsapp://send?phone=201067600509&text=hello',
    );

    final Uri webUrl = Uri.parse(
      'https://wa.me/201067600509?text=hello',
    );

    try {
      if (await canLaunchUrl(appUrl)) {
        await launchUrl(
          appUrl,
          mode: LaunchMode.externalApplication,
        );
      } else {
        await launchUrl(
          webUrl,
          mode: LaunchMode.externalApplication,
        );
      }
    } catch (_) {
      await launchUrl(
        webUrl,
        mode: LaunchMode.externalApplication,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF5F7F6),

        body: CustomScrollView(
          physics: const BouncingScrollPhysics(),
          slivers: [

            /// الهيدر
            const SliverToBoxAdapter(
              child: HeaderWidget(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 6),
            ),

            /// الترحيب
            const SliverToBoxAdapter(
              child: WelcomeCard(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 10),
            ),

            /// السلايدر
            const SliverToBoxAdapter(
              child: HadithSliderWidget(),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 18),
            ),

            /// المسموحات والممنوعات
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              sliver: SliverToBoxAdapter(
                child: Row(
                  children: [

                    /// المسموحات
                    Expanded(
                      child: HomeFeatureCard(
                        title: 'المسموحات',
                        subtitle: 'الأطعمة والمشروبات المسموحة',
                        icon: Icons.check_rounded,
                        startColor: const Color(0xFF5FCB72),
                        endColor: const Color(0xFF3FAE5A),
                        imagePath: 'assets/images/healthy_food.png',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/allowed',
                          );
                        },
                      ),
                    ),

                    const SizedBox(width: 12),

                    /// الممنوعات
                    Expanded(
                      child: HomeFeatureCard(
                        title: 'الممنوعات',
                        subtitle: 'الأطعمة والمشروبات الممنوعة',
                        icon: Icons.close_rounded,
                        startColor: const Color(0xFFFF6B81),
                        endColor: const Color(0xFFE53935),
                        imagePath: 'assets/images/fast_food.png',
                        onTap: () {
                          Navigator.pushNamed(
                            context,
                            '/forbidden',
                          );
                        },
                      ),
                    ),
                  ],
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 14),
            ),
            /// الخدمات
            SliverPadding(
              padding: const EdgeInsets.symmetric(horizontal: 14),
              sliver: SliverToBoxAdapter(
                child: HomeFeatureCard(
                  title: 'الخدمات',
                  subtitle: 'العيادات والمطاعم والمتاجر وغيرها',
                  icon: Icons.storefront_rounded,
                  startColor: const Color(0xFF9C6BFF),
                  endColor: const Color(0xFF7B4DDB),
                  imagePath: 'assets/images/store.png',
                  onTap: () {
                    Navigator.pushNamed(
                      context,
                      '/comingSoon',
                    );
                  },
                ),
              ),
            ),

            const SliverToBoxAdapter(
              child: SizedBox(height: 24),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavWidget(
          currentIndex: 2,
          onTap: (index) async {
            if (index == 0) {
              Navigator.pushNamed(context, '/bio');
            } else if (index == 1) {
              Navigator.pushNamed(context, '/research');
            } else if (index == 2) {
              return;
            } else if (index == 3) {
              Navigator.pushNamed(context, '/settings');
            } else if (index == 4) {
              await openWhatsApp();
            }
          },
        ),
      ),
    );
  }
}