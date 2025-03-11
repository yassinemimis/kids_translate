import 'package:flutter/material.dart';

class intro6 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(232, 224, 245, 1), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'GAMES',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(255, 219, 0, 1), // اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
