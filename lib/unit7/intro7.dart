import 'package:flutter/material.dart';

class intro7 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(255, 255, 255, 1), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'CELEBRATIONS',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(226, 164, 202, 1), // اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
