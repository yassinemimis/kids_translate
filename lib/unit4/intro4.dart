import 'package:flutter/material.dart';

class intro4 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(240, 228, 206, 1), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'HEALTH',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(170, 208, 54, 1), // اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
