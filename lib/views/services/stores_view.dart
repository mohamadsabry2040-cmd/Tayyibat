import 'package:flutter/material.dart';

class StoresView extends StatelessWidget {
  const StoresView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF4F6F5),

      appBar: AppBar(
        title: const Text(
          'متاجر الطيبات',
        ),
      ),

      body: const Center(
        child: Text(
          'صفحة المتاجر',
          style: TextStyle(
            fontSize: 22,
            fontWeight: FontWeight.bold,
            color: Colors.black,
          ),
        ),
      ),
    );
  }
}