import 'package:flutter/material.dart';

class intro1 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(
                  255, 224, 238, 223), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'Family and friends',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.08, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromARGB(255, 238, 119, 33), // اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
