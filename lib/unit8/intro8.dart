import 'package:flutter/material.dart';

class intro8 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(224, 247, 250, 1), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'ANIMALS',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(239, 62, 35, 1),// اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
