import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/header_with_back_widget.dart';

class AllowedPage extends StatelessWidget {
  const AllowedPage({super.key});

  Widget buildItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(
        vertical: 10,
      ),

      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius:
              BorderRadius.circular(20),
        ),

        tileColor: Colors.white,

        leading: Icon(
          icon,
          color: color,
          size: 30,
        ),

        title: Text(
          title,

          style: const TextStyle(
            fontWeight: FontWeight.bold,
          ),
        ),

        subtitle: Text(subtitle),

        trailing: Icon(
          Icons.arrow_forward_ios,
          color: color,
        ),

        onTap: () {

          if (route.isNotEmpty) {

            Navigator.pushNamed(
              context,
              route,
            );
          }
        },
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

            Expanded(
              child: Padding(
                padding:
                    const EdgeInsets.all(16),

                child: ListView(
                  children: [

                    buildItem(
                      context,

                      'الفطار والعشاء',

                      'وجبات خفيفة وصحية',

                      Icons.free_breakfast,

                      Colors.orange,

                      '/breakfast',
                    ),

                    buildItem(
                      context,

                      'الغداء',

                      'الوجبات الرئيسية',

                      Icons.lunch_dining,

                      Colors.red,

                      '/lunchFolder',
                    ),

                    buildItem(
                      context,

                      'الدهون والزيوت',

                      'زيوت ودهون غذائية',

                      Icons.oil_barrel,

                      Colors.amber,

                      '/fatsAndOils',
                    ),

                    buildItem(
                      context,

                      'ثمار طبيعية',

                      'فواكه مفيدة وطبيعية',

                      Icons.apple,

                      Colors.green,

                      '/naturalFruits',
                    ),

                    buildItem(
                      context,

                      'المشروبات',

                      'مشروبات صحية ومسموحة',

                      Icons.local_drink,

                      Colors.blue,

                      '/allowedDrinks',
                    ),

                    buildItem(
                      context,

                      'الخضروات',

                      'خضروات طازجة ومفيدة',

                      Icons.eco,

                      Colors.green,

                      '/healthyVegetables',
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