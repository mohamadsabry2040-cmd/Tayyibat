import 'package:flutter/material.dart';

class DangerHeaderWithBackWidget extends StatelessWidget {
  const DangerHeaderWithBackWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 220,

      child: Stack(
        children: [
          ClipPath(
            clipper: DangerHeaderClipper(),

            child: Container(
              height: 220,
              color: const Color(0xFFD32F2F),
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
                  Icons.warning_amber_rounded,
                  color: Colors.white,
                  size: 45,
                ),

                SizedBox(height: 10),

                Text(
                  'تحذير',

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

class DangerHeaderClipper extends CustomClipper<Path> {
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