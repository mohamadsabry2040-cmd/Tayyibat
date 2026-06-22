import 'package:flutter/material.dart';

class HeaderWithBackWidget extends StatelessWidget {
  const HeaderWithBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,

      child: Stack(
        children: [
          ClipPath(
            clipper: HeaderClipper(),

            child: Container(
              height: 220,
              color: const Color(0xFF1B8F5A),
            ),
          ),

          // زر الرجوع
          Positioned(
            top: 60,
            left: 20,

            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),

              onPressed: () => Navigator.pop(context),
            ),
          ),

          // اللوجو + العنوان
          const Positioned(
            top: 70,
            left: 0,
            right: 0,

            child: Column(
              children: [
                Icon(
                  Icons.spa,
                  color: Colors.white,
                  size: 45,
                ),

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