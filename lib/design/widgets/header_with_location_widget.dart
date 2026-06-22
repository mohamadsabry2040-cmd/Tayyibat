import 'package:flutter/material.dart';
import 'package:tayyibat_app/design/widgets/location_dialog_widget.dart';
import 'package:tayyibat_app/services/location_manager.dart';

class HeaderWithLocationWidget extends StatefulWidget {
  const HeaderWithLocationWidget({super.key});

  @override
  State<HeaderWithLocationWidget> createState() =>
      _HeaderWithLocationWidgetState();
}

class _HeaderWithLocationWidgetState
    extends State<HeaderWithLocationWidget> {

  @override
  void initState() {
    super.initState();
    loadData();
  }

  Future<void> loadData() async {
    await LocationManager.loadLocation();

    if (mounted) {
      setState(() {});
    }
  }

  void openDialog() {
    showDialog(
      context: context,
      builder: (_) {
        return LocationDialogWidget(
          onSaved: () async {
            await loadData();
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 300,
      child: Stack(
        children: [

          ClipPath(
            clipper: HeaderClipper(),
            child: Container(
              height: 300,
              color: const Color(0xFF1B8F5A),
            ),
          ),

          Positioned(
            top: 60,
            right: 20,
            child: IconButton(
              icon: const Icon(
                Icons.arrow_back,
                color: Colors.white,
              ),
              onPressed: () => Navigator.pop(context),
            ),
          ),

          Positioned(
            top: 70,
            left: 0,
            right: 0,
            child: Column(
              children: [

                const Icon(
                  Icons.spa,
                  color: Colors.white,
                  size: 45,
                ),

                const SizedBox(height: 10),

                const Text(
                  'نظام الطيبات الغذائي',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22,
                    fontWeight: FontWeight.bold,
                  ),
                ),

                if (!LocationManager.hasLocation()) ...[

                  const SizedBox(height: 16),

                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 28),
                    child: Text(
                      'حدد موقعك لعرض أقرب المطاعم والمخابز والعيادات والخدمات المتوفرة حولك',
                      textAlign: TextAlign.center,
                      style: TextStyle(
                        color: Colors.white70,
                        fontSize: 14,
                        height: 1.5,
                        fontWeight: FontWeight.w500,
                      ),
                    ),
                  ),

                  const SizedBox(height: 24),

                ] else ...[

                  const SizedBox(height: 28),

                ],

                GestureDetector(
                  onTap: openDialog,
                  child: Container(
                    margin: const EdgeInsets.symmetric(horizontal: 26),
                    padding: const EdgeInsets.symmetric(
                      horizontal: 18,
                      vertical: 16,
                    ),

                    decoration: BoxDecoration(
                      color: Colors.white.withValues(alpha: 0.15),
                      borderRadius: BorderRadius.circular(18),

                      border: Border.all(
                        color: Colors.white24,
                      ),

                      boxShadow: [
                        BoxShadow(
                          color: Colors.black.withValues(alpha: 0.08),
                          blurRadius: 12,
                          offset: const Offset(0, 4),
                        ),
                      ],
                    ),

                    child: Row(
                      children: [
                        Container(
                          padding: const EdgeInsets.all(8),
                          decoration: BoxDecoration(
                            color: Colors.white.withValues(alpha: 0.15),
                            borderRadius: BorderRadius.circular(12),
                          ),

                          child: const Icon(
                            Icons.my_location,
                            color: Colors.white,
                            size: 22,
                          ),
                        ),

                        const SizedBox(width: 12),

                        Expanded(
                          child: Text(
                            LocationManager.hasLocation()
                                ? '${LocationManager.country} - '
                                  '${LocationManager.city} - '
                                  '${LocationManager.area}'
                                : 'اضغط لتحديد موقعك وعرض الخدمات القريبة',

                            style: const TextStyle(
                              color: Colors.white,
                              fontSize: 15,
                              fontWeight: FontWeight.w600,
                              height: 1.4,
                            ),
                          ),
                        ),

                        const SizedBox(width: 8),

                        const Icon(
                          Icons.keyboard_arrow_down_rounded,
                          color: Colors.white,
                          size: 28,
                        ),
                      ],
                    ),
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
  bool shouldReclip(CustomClipper<Path> oldClipper) {
    return false;
  }
}