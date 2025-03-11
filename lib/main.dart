// import 'package:flutter/material.dart';
// import 'package:flutter_svg/flutter_svg.dart';
// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatefulWidget {
//   @override
//   _MyAppState createState() => _MyAppState();
// }

// class _MyAppState extends State<MyApp> {
//   bool isDarkMode = false;

//   void toggleTheme() {
//     setState(() {
//       isDarkMode = !isDarkMode;
//     });
//   }

//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       title: 'Login Screen',
//       theme: ThemeData.light().copyWith(
//         primaryColor: Colors.blue,
//         scaffoldBackgroundColor: Colors.white,
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.yellow, // لون زر تسجيل الدخول للوضع الفاتح
//             foregroundColor: Colors.black, // لون النص للوضع الفاتح
//           ),
//         ),
//       ),
//       darkTheme: ThemeData.dark().copyWith(
//         primaryColor: Colors.blue,
//         scaffoldBackgroundColor: Color.fromARGB(255, 30, 30, 30),
//         elevatedButtonTheme: ElevatedButtonThemeData(
//           style: ElevatedButton.styleFrom(
//             backgroundColor: Colors.yellow, // لون زر تسجيل الدخول للوضع الداكن
//             foregroundColor: Colors.black, // لون النص للوضع الداكن
//           ),
//         ),
//       ),
//       themeMode: isDarkMode ? ThemeMode.dark : ThemeMode.light,
//       home: LoginScreen(toggleTheme: toggleTheme, isDarkMode: isDarkMode),
//     );
//   }
// }

// class LoginScreen extends StatelessWidget {
//   final VoidCallback toggleTheme;
//   final bool isDarkMode;

//   LoginScreen({required this.toggleTheme, required this.isDarkMode});

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: Center(
//         child: Padding(
//           padding: const EdgeInsets.symmetric(horizontal: 30.0),
//           child: Column(
//             mainAxisAlignment: MainAxisAlignment.center,
//             children: [
//               // Login Account Text
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.spaceBetween,
//                 children: [
//                   Text(
//                     'Login Account',
//                     style: TextStyle(
//                       fontSize: 24,
//                       fontWeight: FontWeight.bold,
//                     ),
//                   ),
//                   IconButton(
//                     icon: Icon(isDarkMode ? Icons.nightlight_round : Icons.wb_sunny),
//                     onPressed: toggleTheme,
//                   ),
//                 ],
//               ),
//               SizedBox(height: 10),
//               Text(
//                 'Hello, welcome back to our account!',
//                 style: TextStyle(fontSize: 16, color: Colors.grey),
//               ),
//               SizedBox(height: 20),
//               // Email TextField
//               TextField(
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Email address',
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Password TextField
//               TextField(
//                 obscureText: true,
//                 decoration: InputDecoration(
//                   border: OutlineInputBorder(),
//                   labelText: 'Password',
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Forgot Password Text
//               Align(
//                 alignment: Alignment.centerRight,
//                 child: TextButton(
//                   onPressed: () {
//                     // Handle Forgot Password
//                   },
//                   child: Text('Forgot Password?'),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Login Button
//               ElevatedButton(
//                 onPressed: () {
//                   // Handle Login
//                 },
//                 style: ElevatedButton.styleFrom(
//                   minimumSize: Size(double.infinity, 50),
//                 ),
//                 child: Text('Login'),
//               ),
//               SizedBox(height: 20),
//               // Continue with Apple Button
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Handle Continue with Apple
//                 },
//                 icon: Icon(Icons.apple),
//                 label: Text('Continue with Apple'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.black,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(300, 50),
//                    side: BorderSide(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 10),
//               // Sign in with Google Button
//               OutlinedButton.icon(
//   onPressed: () {
//     // Handle Sign in with Google
//   },
//   icon: SvgPicture.asset(
//     'assets/Google__G__logo.svg', // Path to your SVG file
//     width: 20, // Adjust width as needed
//     height: 20, // Adjust height as needed
//   ),
//   label: Text('Sign in with Google'),
//   style: OutlinedButton.styleFrom(
//     backgroundColor: Colors.white,
//     foregroundColor: Colors.black,
//     minimumSize: Size(300, 50),
//     side: BorderSide(color: Colors.grey),
//   ),
// ),
//               SizedBox(height: 10),
//               // Login with Facebook Button
//               ElevatedButton.icon(
//                 onPressed: () {
//                   // Handle Login with Facebook
//                 },
//                 icon: Icon(Icons.facebook),
//                 label: Text('Login with Facebook'),
//                 style: ElevatedButton.styleFrom(
//                   backgroundColor: Colors.blue,
//                   foregroundColor: Colors.white,
//                   minimumSize: Size(300, 50),
//                    side: BorderSide(color: Colors.grey),
//                 ),
//               ),
//               SizedBox(height: 20),
//               // Not registered yet? Create Account
//               Row(
//                 mainAxisAlignment: MainAxisAlignment.center,
//                 children: [
//                   Text('Not registered yet? '),
//                   TextButton(
//                     onPressed: () {
//                       // Handle Create Account
//                     },
//                     child: Text('Create Account'),
//                   ),
//                 ],
//               ),
//             ],
//           ),
//         ),
//       ),
//     );
//   }
// }
// import 'package:firdaws/unit1/intro1.dart';
// import 'package:flutter/material.dart';
// import 'package:page_flip/page_flip.dart'; // تأكد من اسم الحزمة الصحيح

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: FlipBook(),
//     );
//   }
// }

// class FlipBook extends StatelessWidget {
//   final _controller = GlobalKey<PageFlipWidgetState>();

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       body: PageFlipWidget(
//         key: _controller,
//         backgroundColor: Color.fromARGB(255, 213, 237, 159),
//         lastPage: Container(
//           color: Colors.white,
//           child: const Center(child: Text('Last Page!')),
//         ),
//         children: [
//           intro1(),
//           AnimalPage(mainImage: 'assets/main_image_right.png', isLeftPage: true),
//           AnimalPage(mainImage: 'assets/main_image_left.png', isLeftPage: false),
//         ],
//       ),
      
//     );
//   }
// }


// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimalPages(),
//     );
//   }
// }

// class AnimalPages extends StatelessWidget {
//    final List<Map<String, String>> animalsPage1 = [
//     {"name": "Lion", "image": "assets/lion.png", "arabic": "أسد"},
//     {"name": "Tiger", "image": "assets/lion.png", "arabic": "نمر"},
//     {"name": "Owl", "image": "assets/lion.png", "arabic": "بومة"},
//     {"name": "Snake", "image": "assets/lion.png", "arabic": "ثعبان"},
//     {"name": "Turtle", "image": "assets/lion.png", "arabic": "سلحفاة"},
//     {"name": "Goat", "image": "assets/lion.png", "arabic": "ماعز"},
//   ];

//   final List<Map<String, String>> animalsPage2 = [
//     {"name": "Wolf", "image": "assets/lion.png", "arabic": "ذئب"},
//     {"name": "Giraffe", "image": "assets/lion.png", "arabic": "زرافة"},
//     {"name": "Elephant", "image": "assets/lion.png", "arabic": "فيل"},
//     {"name": "Rabbit", "image": "assets/lion.png", "arabic": "أرنب"},
//     {"name": "Dog", "image": "assets/lion.png", "arabic": "كلب"},
//     {"name": "Fox", "image": "assets/lion.png", "arabic": "ثعلب"},
//   ];
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text("Animal Pages")),
//       body: PageView(
//         children: [
//           AnimalPage(animals: animalsPage1, mainImage: 'assets/main_image_right.png'),
//           AnimalPage(animals: animalsPage2, mainImage: 'assets/main_image_left.png'),
//         ],
//       ),
//     );
//   }
// }

// class AnimalPage extends StatelessWidget {
//   final List<Map<String, String>> animals;
//   final String mainImage;

//   AnimalPage({required this.animals, required this.mainImage});

//   @override
//   Widget build(BuildContext context) {
//     return Center(
//       child: Stack(
//         alignment: Alignment.center,
//         children: [
//           Image.asset(mainImage), // الصورة المقسومة
//           GridView.builder(
//             shrinkWrap: true,
//             gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
//               crossAxisCount: 3,
//               mainAxisSpacing: 10,
//               crossAxisSpacing: 10,
//               childAspectRatio: 1 / 1.5,
//             ),
//             itemCount: animals.length,
//             itemBuilder: (context, index) {
//               return Column(
//                 children: [
//                   Image.asset(animals[index]["image"]!, height: 50), // الصورة الصغيرة
//                   Text(animals[index]["name"]!),
//                   Text(animals[index]["arabic"]!, style: TextStyle(color: Colors.grey)),
//                 ],
//               );
//             },
//           ),
//         ],
//       ),
//     );
//   }
// }
// import 'package:firdaws/unit1/intro1.dart';
// import 'package:flutter/material.dart';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: AnimalPages(),
//     );
//   }
// }

// class AnimalPages extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//        backgroundColor: Color.fromARGB(255, 213, 237, 159),
     
//       body: PageView(
//         children: [
//           intro1(),
//           AnimalPage(mainImage: 'assets/main_image_right.png', isLeftPage: true),
//           AnimalPage(mainImage: 'assets/main_image_left.png', isLeftPage: false),
//         ],
//       ),
//     );
//   }
// }

// class AnimalPage extends StatelessWidget {
//   final String mainImage;
//   final bool isLeftPage;

//   AnimalPage({required this.mainImage, required this.isLeftPage});

//   @override
//   Widget build(BuildContext context) {
//     final mediaQuery = MediaQuery.of(context);
//     final screenWidth = mediaQuery.size.width;
//     final screenHeight = mediaQuery.size.height;

//     return Center(
//   child: Stack(
//     alignment: Alignment.center,
//     children: [
//       Positioned(
//         top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
//         left: 0,
//         right: 0,
//         child: Container(
//           padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
//           color: Color.fromARGB(255, 213, 237, 159), // يمكنك ضبط لون الخلفية ودرجة الشفافية
//           child: Center(
//             child: Text(
//               "Family members أعضاء العائلة",
//               style: TextStyle(
//                 fontSize: screenWidth * 0.06,
//                 fontWeight: FontWeight.bold,
//                 fontFamily: 'CreepsterCaps',
//                 color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
//               ),
//             ),
//           ),
//         ),
//       ),
//       Align(
//         alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
//         child: FractionallySizedBox(
//           widthFactor: 0.7,
//           child: Image.asset(
//             mainImage,
//             height: screenHeight * 0.6,
//           ),
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.11,
//         left: isLeftPage ? screenWidth * 0.8 : null,
//         right: isLeftPage ? null : screenWidth * 0.8,
//         child: animalColumn(
//           isLeftPage ? 'assets/19.png' : 'assets/12.png',
//           isLeftPage ? 'Sister' : 'Uncle',
//           isLeftPage ? 'الاخت' : 'العم أو الخال',
//           screenHeight, screenWidth
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.11,
//         left: isLeftPage ? screenWidth * 0.35 : null,
//         right: isLeftPage ? null : screenWidth * 0.35,
//         child: animalColumn(
//           isLeftPage ? 'assets/18.png' : 'assets/13.png',
//           isLeftPage ? 'Cousin' : 'Mother’s parents',
//           isLeftPage ? 'ابن العم' : 'والدي الام',
//           screenHeight, screenWidth
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.26,
//         left: isLeftPage ? screenWidth * 0.08 : null,
//         right: isLeftPage ? null : screenWidth * 0.08,
//         child: animalColumn(
//           isLeftPage ? 'assets/17.png' : 'assets/14.png',
//           isLeftPage ? 'Brother' : 'Grandfather',
//           isLeftPage ? 'الاخ' : 'الجد',
//           screenHeight, screenWidth
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.51,
//         left: isLeftPage ? screenWidth * 0.08 : null,
//         right: isLeftPage ? null : screenWidth * 0.08,
//         child: animalColumn(
//           isLeftPage ? 'assets/16.png' : 'assets/15.png',
//           isLeftPage ? 'Father' : 'Aunt',
//           isLeftPage ? 'الاب' : 'العمة أو الخالة',
//           screenHeight, screenWidth
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.71,
//         left: isLeftPage ? screenWidth * 0.35 : null,
//         right: isLeftPage ? null : screenWidth * 0.76,
//         child: animalColumn(
//           isLeftPage ? 'assets/GRANDMOM.png' : 'assets/21.png',
//           isLeftPage ? 'Mother’s parents' : 'Grandmother',
//           isLeftPage ? 'والدي الام' : 'الجدة',
//           screenHeight, screenWidth
//         ),
//       ),
//       Positioned(
//         top: screenHeight * 0.71,
//         left: isLeftPage ? screenWidth * 0.8 : null,
//         right: isLeftPage ? null : screenWidth * 0.35,
//         child: animalColumn(
//           isLeftPage ? 'assets/31.png' : 'assets/41.png',
//           isLeftPage ? 'Niece' : 'Mother',
//           isLeftPage ? 'بنت الاخت' : 'الام',
//           screenHeight, screenWidth
//         ),
//       ),
//     ],
//   ),
// );

//   }

//  Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
//   return Column(
//     children: [
//       Image.asset(imagePath, height: screenHeight * 0.15),
//       Text(
//         englishName,
//         style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
//       ),
//       Text(
//         arabicName,
//         style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
//       ),
//     ],
//   );
// }

// }
// import 'package:flutter/material.dart';
// import 'dart:math';

// void main() {
//   runApp(MyApp());
// }

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: PageFlipDemo(),
//     );
//   }
// }

// class PageFlipDemo extends StatefulWidget {
//   @override
//   _PageFlipDemoState createState() => _PageFlipDemoState();
// }

// class _PageFlipDemoState extends State<PageFlipDemo> with SingleTickerProviderStateMixin {
//   late AnimationController _controller;
//   late Animation<double> _animation;

//   @override
//   void initState() {
//     super.initState();

//     // تهيئة AnimationController
//     _controller = AnimationController(
//       vsync: this,
//       duration: const Duration(seconds: 1),
//     );

//     // تهيئة Animation مع Tween
//     _animation = Tween<double>(begin: 0, end: 1).animate(_controller);
//   }

//   void _startFlip() {
//     if (_controller.isCompleted) {
//       _controller.reverse();
//     } else {
//       _controller.forward();
//     }
//   }

//   @override
//   void dispose() {
//     _controller.dispose();
//     super.dispose();
//   }

//   @override
//   Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: AppBar(title: Text('Page Turn Effect')),
//       body: Center(
//         child: GestureDetector(
//           onTap: _startFlip,
//           child: AnimatedBuilder(
//             animation: _animation,
//             builder: (context, child) {
//               double angle = _animation.value * pi; // التدوير 180 درجة
//               return Transform(
//                 alignment: Alignment.bottomLeft,
//                 transform: Matrix4.identity()
//                   ..setEntry(3, 2, 0.001)
//                   ..rotateX(angle),
//                 child: Stack(
//                   children: [
//                     // الصفحة الأولى التي تظهر أثناء التقليب
//                     if (angle < pi / 2)
//                       _buildPage(content: 'Page 1', color: Colors.blue),
//                     // الصفحة الثانية التي تظهر بعد التقليب
//                     if (angle >= pi / 2)
//                       Transform(
//                         alignment: Alignment.bottomLeft,
//                         transform: Matrix4.identity()..rotateX(-pi),
//                         child: _buildPage(content: 'Page 2', color: Colors.red),
//                       ),
//                   ],
//                 ),
//               );
//             },
//           ),
//         ),
//       ),
//     );
//   }

//   Widget _buildPage({required String content, required Color color}) {
//     return Container(
//       width: 300,
//       height: 400,
//       color: color,
//       child: Center(
//         child: Text(
//           content,
//           style: TextStyle(fontSize: 32, color: Colors.white),
//         ),
//       ),
//     );
//   }
// }


















































import 'package:audioplayers/audioplayers.dart';
import 'package:firdaws/music_provider.dart';
import 'package:firdaws/unit1/Family_members.dart';
import 'package:firdaws/unit1/intro1.dart';
import 'package:firdaws/unit2/intro2.dart';
import 'package:firdaws/unit2/jobs_and_occupations.dart';
import 'package:firdaws/unit3/School.dart';
import 'package:firdaws/unit3/intro3.dart';
import 'package:firdaws/unit4/intro4.dart';
import 'package:firdaws/unit5/food.dart';
import 'package:firdaws/unit5/intro5.dart';
import 'package:firdaws/unit6/games.dart';
import 'package:firdaws/unit6/intro6.dart';
import 'package:firdaws/unit7/intro7.dart';
import 'package:firdaws/unit8/intro8.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'music_provider.dart'; // تأكد من استيراد ملف MusicProvider

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (context) => MusicProvider(),
      child: MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  // حالة الأيقونة واللون لكل دائرة
  final List<Map<String, dynamic>> _circles = [
    {
      'assetPath': 'assets/icon1.png',
      'color': Color.fromRGBO(220, 182, 240, 1),
      'active': false
    },
    {
      'assetPath': 'assets/icon2.png',
      'color': Color.fromRGBO(155, 235, 248, 1),
      'active': false
    },
    {
      'assetPath': 'assets/icon3.png',
      'color': Color.fromRGBO(213, 237, 159, 1),
      'active': false
    },
  ];
@override
  void initState() {
    super.initState();
    // الحصول على MusicProvider وتشغيل الموسيقى تلقائيًا عند بدء الصفحة
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);
    musicProvider.playMusic(); // تشغيل الموسيقى
  }
  void _onCircleTap(int index) {
    final musicProvider = Provider.of<MusicProvider>(context, listen: false);

    setState(() {
      // تغيير الأيقونة واللون عند الضغط
      _circles[index]['active'] = !_circles[index]['active']; // تبديل الحالة النشطة

      if (_circles[index]['active']) {
        _circles[index] = {
          'assetPath': 'assets/icon${index + 4}.png', // مسار أيقونة جديدة بناءً على الفهرس
          'color': Colors.grey, // لون خلفية جديد
          'active': true,
        };
        // استدعاء دالة إيقاف الموسيقى
        musicProvider.pauseMusic(); // تأكد من تعريف musicProvider بشكل صحيح
      } else {
        _circles[index] = {
          'assetPath': 'assets/icon${index + 1}.png',
          'color': [
            Color.fromRGBO(220, 182, 240, 1),
            Color.fromRGBO(155, 235, 248, 1),
            Color.fromRGBO(213, 237, 159, 1),
          ][index], // استعادة اللون الأصلي بناءً على الفهرس
          'active': false,
        };
        musicProvider.playMusic(); 
      }
    });
  }
  void _showImageDialog(BuildContext context, BoxConstraints constraints) {
    showDialog(
      context: context,
      barrierColor: Colors.black54, // تعيين لون الحاجز خلف النافذة
      builder: (BuildContext context) {
        return StatefulBuilder(
          builder: (context, setState) {
            return Dialog(
              backgroundColor: Colors.transparent, // تعيين خلفية النافذة إلى شفافة
              child: Stack(
                alignment: Alignment.center,
                children: [
                  // الصورة في الخلفية
                  Image.asset(
                    'assets/image.png', // مسار الصورة التي تريد عرضها
                    fit: BoxFit.cover,
                  ),
                  // الدوائر الثلاث فوق الصورة مع النصوص
                  Positioned(
                    top: constraints.maxHeight * 0.08,
                    child: Column(
                      mainAxisSize: MainAxisSize.min,
                      children: List.generate(_circles.length, (index) {
                        return Column(
                          children: [
                            GestureDetector(
                              onTap: () {
                                _onCircleTap(index);
                                setState(() {}); // تحديث الحالة عند الضغط
                              },
                              child: Container(
                                width: constraints.maxWidth * 0.15, // قطر الدائرة
                                height: constraints.maxWidth * 0.15,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  color: _circles[index]['color'], // لون الخلفية داخل الدائرة
                                ),
                                child: Center(
                                  child: Image.asset(
                                    _circles[index]['assetPath'], // استخدام الأيقونة الحالية
                                    width: constraints.maxWidth * 0.08, // حجم الأيقونة
                                    height: constraints.maxWidth * 0.08,
                                  ),
                                ),
                              ),
                            ),
                            SizedBox( height: constraints.maxWidth * 0), // مسافة بين الدائرة والنص
                            Text(
                              ['sound', 'music', 'notification'][index],
                              style: TextStyle(
                                fontSize: constraints.maxWidth * 0.06, // حجم الخط
                                fontWeight: FontWeight.bold,
                                fontFamily: 'CreepsterCaps',
                                color: Colors.black,
                              ),
                              textAlign: TextAlign.center, // محاذاة النص في الوسط
                            ),
                            SizedBox(height: constraints.maxHeight * 0.02), // مسافة بين الدوائر
                          ],
                        );
                      }),
                    ),
                  ),
                ],
              ),
            );
          },
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
       backgroundColor: Color.fromARGB(255, 231, 15, 8),
      body: SafeArea(
        child: Stack(
          children: [
            BackgroundWithCircles(), // الخلفية الدائرية
            LayoutBuilder(
              builder: (context, constraints) {
                return SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(constraints.maxWidth * 0.05),
                    child: Column(
                      children: [
                        Align(
                          alignment: Alignment.topRight,
                          child: GestureDetector(
                            onTap: () => _showImageDialog(context, constraints),
                            child: Image.asset(
                              'assets/paramette.png', // مسار صورة الأيقونة
                              width:
                                  constraints.maxWidth * 0.12, // حجم الأيقونة
                              height:
                                  constraints.maxWidth * 0.12, // حجم الأيقونة
                            ),
                          ),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT ONE',
                          subtitle: 'FAMILY AND FRIENDS',
                          image: 'assets/family.png',
                          color: Color.fromARGB(255, 224, 238, 223),
                          titleColor: Color.fromARGB(255, 238, 119, 33),
                          constraints: constraints,
                          targetPage: FlipBook(),
                          
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT TOW',
                          subtitle: 'OCCUPATIONS AND JOBS',
                          image: 'assets/JOBS.png',
                          color: Color.fromARGB(255, 254, 232, 209),
                          titleColor: Color.fromRGBO(110, 104, 175, 1),
                          constraints: constraints,
                            targetPage: jobs_and_occupations(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT THREE',
                          subtitle: 'SCHOOL',
                          image: 'assets/SCHOOL.png',
                          color: Color.fromRGBO(178, 229, 222, 1),
                          titleColor: Color.fromRGBO(238, 60, 86, 1),
                          constraints: constraints,
                            targetPage: School(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT FOUR',
                          subtitle: 'HEALTH',
                          image: 'assets/health.png',
                          color: Color.fromRGBO(240, 228, 206, 1),
                          titleColor: Color.fromRGBO(170, 208, 54, 1),
                          constraints: constraints,
                            targetPage: intro4(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT FIVE',
                          subtitle: 'FOOD',
                          image: 'assets/FOOD.png',
                          color: Color.fromRGBO(255, 230, 210, 1),
                          titleColor: Color.fromRGBO(92, 154, 211, 1),
                          constraints: constraints,
                            targetPage: food(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT SIX',
                          subtitle: 'GAMES',
                          image: 'assets/GAMES.png',
                          color: Color.fromRGBO(232, 224, 245, 1),
                          titleColor: Color.fromRGBO(255, 219, 0, 1),
                          constraints: constraints,
                            targetPage: Games(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT SEVEN',
                          subtitle: 'CELEBRATIONS',
                          image: 'assets/celebrations.png',
                          color: Color.fromRGBO(240, 240, 240, 1),
                          titleColor: Color.fromRGBO(226, 164, 202, 1),
                          constraints: constraints,
                            targetPage: intro7(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        UnitCard(
                          title: 'UNIT EIGHT',
                          subtitle: 'ANIMALS',
                          image: 'assets/animals.png',
                          color: Color.fromRGBO(224, 247, 250, 1),
                          titleColor: Color.fromRGBO(239, 62, 35, 1),
                          constraints: constraints,
                            targetPage: intro8(),
                        ),
                        SizedBox(height: constraints.maxHeight * 0.03),
                        // يمكنك إضافة المزيد من البطاقات هنا إذا كنت بحاجة
                      ],
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }
}

class BackgroundWithCircles extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return SizedBox.expand(
      // جعل الخلفية تمتد لكامل الشاشة
      child: Container(
        color: Color.fromARGB(255, 231, 15, 8), // اللون الأحمر الأساسي
        child: CustomPaint(
          painter: CirclePainter(),
        ),
      ),
    );
  }
}

class CirclePainter extends CustomPainter {
  @override
  void paint(Canvas canvas, Size size) {
    final paint = Paint()
      ..color = Color.fromARGB(60, 217, 217, 217) // لون أحمر أفتح
      ..style = PaintingStyle.fill;

    // رسم الدوائر بأحجام وأماكن مختلفة
    canvas.drawCircle(Offset(size.width * 0.2, size.height * 0.1), 100, paint);
    canvas.drawCircle(Offset(size.width * 0.55, size.height * 0.05), 30, paint);
    canvas.drawCircle(Offset(size.width * 0, size.height * 0.33), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.5, size.height * 0.48), 130, paint);
    canvas.drawCircle(Offset(size.width * 0.8, size.height * 0.2), 120, paint);
    canvas.drawCircle(Offset(size.width * 0.90, size.height * 0.4), 30, paint);
    canvas.drawCircle(Offset(size.width * 0.35, size.height * 0.27), 46, paint);
    canvas.drawCircle(Offset(size.width * 0.06, size.height * 0.51), 40, paint);
    canvas.drawCircle(Offset(size.width * 0.1, size.height * 0.7), 100, paint);
    canvas.drawCircle(Offset(size.width * 0.58, size.height * 0.75), 80, paint);
    canvas.drawCircle(
        Offset(size.width * 1.08, size.height * 0.64), 120, paint);
    canvas.drawCircle(
        Offset(size.width * 0.25, size.height * 0.95), 100, paint);
    canvas.drawCircle(Offset(size.width * 0.9, size.height * 0.92), 90, paint);
    canvas.drawCircle(Offset(size.width * 0.58, size.height * 0.9), 35, paint);
  }

  @override
  bool shouldRepaint(CustomPainter oldDelegate) {
    return false;
  }
}

class UnitCard extends StatefulWidget {
  final String title;
  final String subtitle;
  final String image;
  final Color color;
  final Color titleColor;
  final BoxConstraints constraints;
  final Widget targetPage;

  UnitCard({
    required this.title,
    required this.subtitle,
    required this.image,
    required this.color,
    required this.constraints,
    required this.titleColor,
    required this.targetPage,
  });

  @override
  _UnitCardState createState() => _UnitCardState();
}

class _UnitCardState extends State<UnitCard> with SingleTickerProviderStateMixin {
  late AnimationController _controller;
  late Animation<double> _animation;
  late AudioPlayer _audioPlayer; // إضافة متغير لتشغيل الموسيقى
 String backgroundMusic="assets/background_music.mp3";
  @override
  void initState() {
    super.initState();

    _controller = AnimationController(
      duration: const Duration(seconds: 2),
      vsync: this,
    )..repeat(reverse: true);

    _animation = Tween<double>(begin: 1.2, end: 1.4).animate(
      CurvedAnimation(
        parent: _controller,
        curve: Curves.easeInOut,
      ),
    );

    _audioPlayer = AudioPlayer(); // تهيئة مشغل الصوت
    // _playMusic(backgroundMusic); // تشغيل الموسيقى
  }

  @override
  void dispose() {
    _controller.dispose();
    _audioPlayer.dispose(); // تحرير الموارد الخاصة بمشغل الصوت
    super.dispose();
  }

  // void _playMusic(String url) async {
  //   await _audioPlayer.play(UrlSource(url)); // تشغيل الموسيقى من URL أو من المسار المحلي
  // }

  void _pauseMusic() {
    _audioPlayer.pause(); // إيقاف الموسيقى مؤقتاً
  }

  void _resumeMusic() {
    _audioPlayer.resume(); // استئناف الموسيقى
  }

  void _stopMusic() {
    _audioPlayer.stop(); // إيقاف الموسيقى
  }
  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        Navigator.push(
          context,
          MaterialPageRoute(builder: (context) => widget.targetPage),
        );
      },
      child: FractionallySizedBox(
        widthFactor: 1,
        child: Container(
          height: widget.constraints.maxHeight * 0.3,
          decoration: BoxDecoration(
            gradient: LinearGradient(
              colors: [
                Colors.white,
                widget.color,
                widget.color,
                Colors.white,
              ],
              stops: [0.08, 0.28, 0.75, 1.0],
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
            ),
            borderRadius: BorderRadius.circular(20),
            boxShadow: [
              BoxShadow(
                color: Colors.black26,
                blurRadius: 10,
                offset: Offset(0, 4),
              ),
            ],
          ),
          child: Column(
            children: [
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.only(
                      left: (widget.constraints.maxWidth * 0.04)),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      Text(
                        widget.title,
                        style: TextStyle(
                          fontSize: widget.constraints.maxWidth * 0.08,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CreepsterCaps',
                          color: widget.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 2,
                child: Padding(
                  padding: EdgeInsets.all(widget.constraints.maxWidth * 0),
                  child: AnimatedBuilder(
                    animation: _animation,
                    builder: (context, child) {
                      return Transform.scale(
                        scale: _animation.value,
                        child: Image.asset(widget.image, fit: BoxFit.fitWidth),
                      );
                    },
                  ),
                ),
              ),
              Expanded(
                flex: 1,
                child: Padding(
                  padding: EdgeInsets.all(widget.constraints.maxWidth * 0.03),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        widget.subtitle,
                        style: TextStyle(
                          fontSize: widget.constraints.maxWidth * 0.06,
                          fontWeight: FontWeight.bold,
                          fontFamily: 'CreepsterCaps',
                          color: widget.titleColor,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}


























// import 'package:flutter/material.dart';
// import 'dart:math' as math;

// void main() => runApp(MyApp());

// class MyApp extends StatelessWidget {
//   @override
//   Widget build(BuildContext context) {
//     return MaterialApp(
//       home: Scaffold(
//         appBar: AppBar(title: Text('Custom Page Flip Effect')),
//         body: PageFlipView(),
//       ),
//     );
//   }
// }

// class PageFlipView extends StatefulWidget {
//   @override
//   _PageFlipViewState createState() => _PageFlipViewState();
// }

// class _PageFlipViewState extends State<PageFlipView> {
//   PageController _controller = PageController(viewportFraction: 0.8);

//   @override
//   Widget build(BuildContext context) {
//     return PageView.builder(
//       controller: _controller,
//       itemCount: 3, // عدد الصفحات
//       itemBuilder: (context, index) {
//         return AnimatedBuilder(
//           animation: _controller,
//           builder: (context, child) {
//             double value = 1.0;
//             if (_controller.position.haveDimensions) {
//               value = _controller.page! - index;
//               value = (1 - (value.abs() * 0.3)).clamp(0.0, 1.0);
//             }
//             return Transform(
//               transform: Matrix4.identity()
//                 ..setEntry(3, 2, 0.001)
//                 ..rotateY(math.pi * (1 - value)),
//               alignment: Alignment.center,
//               child: Container(
//                 margin: const EdgeInsets.symmetric(horizontal: 10, vertical: 40),
//                 decoration: BoxDecoration(
//                   color: Colors.white,
//                   borderRadius: BorderRadius.circular(12),
//                   boxShadow: [
//                     BoxShadow(
//                       color: Colors.black12,
//                       spreadRadius: 2,
//                       blurRadius: 5,
//                     ),
//                   ],
//                 ),
//                 child: Center(
//                   child: Text(
//                     'Page ${index + 1}',
//                     style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
//                   ),
//                 ),
//               ),
//             );
//           },
//         );
//       },
//     );
//   }
// }
