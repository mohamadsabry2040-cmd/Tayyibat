import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';
import 'package:tayyibat_app/design/widgets/app_card.dart';

class LunchFolderPage extends StatelessWidget {
  const LunchFolderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F5),

        body: Column(
          children: [

            const HeaderWithBackWidget(),

            const SizedBox(height: 10),

            const Text(
              '🍗 الغداء',
              style: TextStyle(
                fontSize: 20,
                fontWeight: FontWeight.bold,
              ),
            ),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [

                    AppCard(
                      title: '🐪 جملي',
                      subtitle: 'وجبات ووصفات الجمال',
                      icon: Icons.restaurant,
                      color: Colors.deepOrange,
                      onTap: () {
                        Navigator.pushNamed(context, '/lunch');
                      },
                    ),

                    AppCard(
                      title: '🐃 جاموسي',
                      subtitle: 'أكلات ووصفات الجاموسي',
                      icon: Icons.set_meal,
                      color: Colors.brown,
                      onTap: () {
                        Navigator.pushNamed(context, '/kebda');
                      },
                    ),

                    AppCard(
                      title: '🐄 بقري',
                      subtitle: 'أطباق ووصفات بقري',
                      icon: Icons.lunch_dining,
                      color: Colors.teal,
                      onTap: () {
                        Navigator.pushNamed(context, '/kawar3');
                      },
                    ),

                    AppCard(
                      title: '🐑 خروف',
                      subtitle: 'أكلات ووصفات الخروف',
                      icon: Icons.dinner_dining,
                      color: Colors.indigo,
                      onTap: () {
                        Navigator.pushNamed(context, '/ahsha');
                      },
                    ),

                    AppCard(
                      title: '🐐 ماعز',
                      subtitle: 'وصفات وأكلات الماعز',
                      icon: Icons.food_bank,
                      color: Colors.green,
                      onTap: () {
                        Navigator.pushNamed(context, '/goat');
                      },
                    ),

                    AppCard(
                      title: '🐟 أسماك',
                      subtitle: 'أكلات ووصفات الأسماك',
                      icon: Icons.phishing,
                      color: Colors.blue,
                      onTap: () {
                        Navigator.pushNamed(context, '/fish');
                      },
                    ),

                    AppCard(
                      title: '🐦 طيور أخرى',
                      subtitle: 'وصفات الطيور المختلفة',
                      icon: Icons.egg_alt,
                      color: Colors.purple,
                      onTap: () {
                        Navigator.pushNamed(context, '/birdsExtra');
                      },
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