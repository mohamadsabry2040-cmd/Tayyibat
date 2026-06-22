import 'package:flutter/material.dart';

class BottomNavWidget extends StatelessWidget {
  final int currentIndex;
  final ValueChanged<int> onTap;

  const BottomNavWidget({
    super.key,
    required this.currentIndex,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return BottomNavigationBar(
      currentIndex: currentIndex,
      type: BottomNavigationBarType.fixed,
      selectedItemColor: const Color(0xFF1B8F5A),
      unselectedItemColor: Colors.grey,
      onTap: onTap,
      items: const [

        BottomNavigationBarItem(
          icon: Icon(Icons.info_outline),
          label: 'حول التطبيق',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.science),
          label: 'الأبحاث',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.home),
          label: 'الرئيسية',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.settings),
          label: 'الإعدادات',
        ),

        BottomNavigationBarItem(
          icon: Icon(Icons.support_agent),
          label: 'تواصل',
        ),
      ],
    );
  }
}