import 'package:flutter/material.dart';

import 'package:tayyibat_app/design/widgets/header_widget.dart';
import 'package:tayyibat_app/design/widgets/bottom_nav_widget.dart';
import 'package:tayyibat_app/design/widgets/welcome_card.dart';

class MainLayout extends StatelessWidget {
  final List<Widget> children;

  const MainLayout({
    super.key,
    required this.children,
  });

  @override
  Widget build(BuildContext context) {

    return Directionality(
      textDirection: TextDirection.rtl,

      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F5),

        appBar: AppBar(
          backgroundColor: const Color(0xFF1B8F5A),

          elevation: 0,

          leading: Navigator.canPop(context)
              ? IconButton(
                  icon: const Icon(Icons.arrow_back),

                  onPressed: () {
                    Navigator.pop(context);
                  },
                )
              : null,
        ),

        body: Column(
          children: [

            const HeaderWidget(),

            const SizedBox(height: 10),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),

                child: ListView(
                  children: [

                    const WelcomeCard(),

                    ...children,
                  ],
                ),
              ),
            ),
          ],
        ),

        bottomNavigationBar: BottomNavWidget(
          currentIndex: 1,

          onTap: (index) {

            if (index == 0) {
              Navigator.pushNamed(
                context,
                '/bio',
              );
            }

            if (index == 1) {
              Navigator.pushNamed(
                context,
                '/',
              );
            }

            if (index == 2) {
              Navigator.pushNamed(
                context,
                '/settings',
              );
            }
          },
        ),
      ),
    );
  }
}