import 'package:flutter/material.dart';

class HeaderWidget extends StatelessWidget {
  const HeaderWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220, // ✅ مهم لتحديد حجم الهيدر
      child: Stack(
        children: [

          // ✅ الخلفية المنحنية
          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 220,
              color: const Color(0xFF1B8F5A),
            ),
          ),

          // ✅ أيقونة القائمة
          const Positioned(
            top: 60,
            left: 20,
            child: Icon(
              Icons.menu,
              color: Colors.white,
              size: 28,
            ),
          ),

          // ✅ اللوجو + العنوان (بعد التصحيح)
          const Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Column(
              children: [
                Icon(Icons.spa, color: Colors.white, size: 45),
                SizedBox(height: 10),
                Text(
                  'نظام الطيبات الغذائي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}

class HeaderClipper extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    Path path = Path();

    path.lineTo(0, size.height - 40);

    path.quadraticBezierTo(
      size.width / 2,
      size.height + 40,
      size.width,
      size.height - 40,
    );

    path.lineTo(size.width, 0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}