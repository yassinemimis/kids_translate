import 'package:flutter/material.dart';

class intro3 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromRGBO(178, 229, 222, 1), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'SCHOOL',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.12, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(238, 60, 86, 1),// اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
