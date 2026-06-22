import 'package:flutter/material.dart';

class WelcomeCard extends StatelessWidget {
  const WelcomeCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 10),
      padding: const EdgeInsets.all(16),
      decoration: BoxDecoration(
        color: const Color(0xFFF1F3F2),
        borderRadius: BorderRadius.circular(25),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withValues(alpha: 0.08),
            blurRadius: 20,
            offset: const Offset(0, 10),
          ),
        ],
      ),
      child: Row(
        children: [
          // 🔵 أيقونة يسار
          Container(
            padding: const EdgeInsets.all(12),
            decoration: BoxDecoration(
              color: Colors.green.withValues(alpha: 0.15),
              shape: BoxShape.circle,
            ),
            child: const Icon(
              Icons.spa,
              color: Color(0xFF1B8F5A),
              size: 30,
            ),
          ),

          const SizedBox(width: 12),

          // 📝 النص
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: const [
                Text(
                  'مرحباً بك في نظام الطيبات الغذائي',
                  style: TextStyle(
                    fontSize: 16,
                    fontWeight: FontWeight.bold,
                    color: Color(0xFF1B8F5A),
                  ),
                ),
                SizedBox(height: 6),
                Text(
                  'استكشف المسموحات والممنوعات وتعرف على أفضل الخيارات الغذائية لصحتك',
                  style: TextStyle(
                    fontSize: 13,
                    color: Colors.black54,
                  ),
                ),
              ],
            ),
          ),

          // 🌿 زخرفة يمين
          Column(
            children: [
              Icon(Icons.eco, color: Colors.green.shade300),
              Icon(Icons.eco, color: Colors.green.shade200),
            ],
          )
        ],
      ),
    );
  }
}