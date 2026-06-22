import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/danger_header_with_back_widget.dart';

class ForbiddenPage extends StatelessWidget {
  const ForbiddenPage({super.key});

  Widget buildItem(
    BuildContext context,
    String title,
    String subtitle,
    IconData icon,
    Color color,
    String route,
  ) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: ListTile(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(20),
        ),
        tileColor: Colors.white,
        leading: Icon(icon, color: color, size: 30),
        title: Text(
          title,
          style: const TextStyle(fontWeight: FontWeight.bold),
        ),
        subtitle: Text(subtitle),
        trailing: Icon(Icons.arrow_forward_ios, color: color),
        onTap: () {
          Navigator.pushNamed(context, route);
        },
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: const Color(0xFFF4F6F5),
        body: Column(
          children: [
            const DangerHeaderWithBackWidget(),

            Expanded(
              child: Padding(
                padding: const EdgeInsets.all(16),
                child: ListView(
                  children: [
                    buildItem(context, 'الطيور', 'جميع أنواع الطيور', Icons.pets, Colors.red, '/birds'),
                    buildItem(context, 'الألبان', 'منتجات الحليب', Icons.local_drink, Colors.blue, '/dairy'),
                    buildItem(context, 'الدقيق الأبيض', 'الخبز والمعجنات', Icons.grain, Colors.brown, '/whiteFlour'),
                    buildItem(context, 'الحلويات', 'السكريات', Icons.cake, Colors.pink, '/sweets'),
                    buildItem(context, 'المشروبات', 'مشروبات غير صحية', Icons.local_bar, Colors.purple, '/drinks'),
                    buildItem(context, 'البقوليات', 'الفول والعدس', Icons.eco, Colors.green, '/legumes'),
                    buildItem(context, 'الخضروات', 'أنواع الخضروات', Icons.spa, Colors.teal, '/vegetables'),
                    buildItem(context, 'الفاكهة', 'أنواع الفاكهة', Icons.apple, Colors.orange, '/fruits'),
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