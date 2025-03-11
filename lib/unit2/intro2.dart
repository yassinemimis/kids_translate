import 'package:flutter/material.dart';

class intro2 extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        backgroundColor: Color.fromARGB(255, 254, 232, 209), // اللون الأخضر الفاتح كخلفية
        body: Center(
          child: LayoutBuilder(
            builder: (context, constraints) {
              return Text(
                'Occupations and Jobs',
                style: TextStyle(
                  fontSize: constraints.maxWidth * 0.08, // حجم النص بناءً على عرض الشاشة
                  fontWeight: FontWeight.bold,
                  fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
                  color: Color.fromRGBO(110, 104, 175, 1), // اللون الأحمر
                ),
              );
            },
          ),
        ),
      ),
    );
  }
}
