import 'package:firdaws/unit1/intro1.dart';
import 'package:firdaws/unit2/intro2.dart';
import 'package:firdaws/unit5/intro5.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:audioplayers/audioplayers.dart';

class food extends StatefulWidget {
  @override
  _FlipBookState createState() => _FlipBookState();
}

class _FlipBookState extends State<food> {
  final _controller = GlobalKey<PageFlipWidgetState>();
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playFlipSound() async {
    await _audioPlayer.play(AssetSource('flip_sound.mp3'));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: GestureDetector(
        onTap: () {
          _playFlipSound();  // Play the sound when the user taps to flip the page
        },
        child: PageFlipWidget(
          key: _controller,
          backgroundColor: Color.fromRGBO(255, 230, 210, 1),
          lastPage: Container(
            color: Colors.white,
            child: const Center(child: Text('Last Page!')),
          ),
          children: [
            intro5(),
            // AnimalPage(mainImage: 'assets/7_right.png', isLeftPage: true),
            // AnimalPage(mainImage: 'assets/7_left.png', isLeftPage: false),
            // AnimalPage1(mainImage: 'assets/8_right.png', isLeftPage: true),
            // AnimalPage1(mainImage: 'assets/8_left.png', isLeftPage: false),
            // AnimalPage2(mainImage: 'assets/9_right.png', isLeftPage: true),
            // AnimalPage2(mainImage: 'assets/9_left.png', isLeftPage: false),
            // AnimalPage3(mainImage: 'assets/10_right.png', isLeftPage: true),
            // AnimalPage3(mainImage: 'assets/10_left.png', isLeftPage: false),
            // AnimalPage4(mainImage: 'assets/11_right.png', isLeftPage: true),
            // AnimalPage4(mainImage: 'assets/11_left.png', isLeftPage: false),
          ],
        ),
      ),
    );
  }
}



class AnimalPage extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage({required this.mainImage, required this.isLeftPage});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(255, 230, 210, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              
               isLeftPage ? "meats and  Fruits اللحوم و الفواكه" : "meats and  Vegetables اللحوم و الخضر ",
              style: TextStyle(
                fontSize: screenWidth * 0.06,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreepsterCaps',
                color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.7,
          child: Image.asset(
            mainImage,
            height: screenHeight * 0.6,
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.6 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/201.png' : 'assets/211.png',
          isLeftPage ? 'oranges' : 'Architect',
          isLeftPage ? 'البرتقال' : 'مهندس معماري',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.008,
        child: animalColumn(
          isLeftPage ? 'assets/203.png' : 'assets/210.png',
          isLeftPage ? 'grapes' : 'lettuce',
          isLeftPage ? 'العنب' : 'خس',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.3,
        left: isLeftPage ? screenWidth * 0.02 : null,
        right: isLeftPage ? null : screenWidth * 0,
        child: animalColumn(
          isLeftPage ? 'assets/213.png' : 'assets/214.png',
          isLeftPage ? 'lamb' : 'chicken',
          isLeftPage ? 'لحم الخروف' : 'لحم الدجاج',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.5,
        left: isLeftPage ? screenWidth * 0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.02,
        child: animalColumn(
          isLeftPage ? 'assets/204.png' : 'assets/209.png',
          isLeftPage ? 'strawberries' : 'onions',
          isLeftPage ? 'الفراولة' : 'بصل',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.72,
        left: isLeftPage ? screenWidth * 0.6 : null,
        right: isLeftPage ? null : screenWidth * 0.1,
        child: animalColumn(
          isLeftPage ? 'assets/205.png' : 'assets/208.png',
          isLeftPage ? 'dates' : 'potatoes',
          isLeftPage ? 'تمر' : 'بطاطا',
          screenHeight, screenWidth
        ),
      ),
            Positioned(
        top: screenHeight * 0.72,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/206.png' : 'assets/215.png',
          isLeftPage ? 'bananas' : 'fish',
          isLeftPage ? 'الموز' : 'لحم السمك',
          screenHeight, screenWidth
        ),
      ),
     
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
  return Column(
    children: [
      Image.asset(imagePath, height: screenHeight * 0.15),
      Text(
        englishName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
      Text(
        arabicName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

}

class AnimalPage1 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage1({required this.mainImage, required this.isLeftPage});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(255, 230, 210, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "Snacks and Dishes وجبات خفيفة و األطباق " ,
              style: TextStyle(
                fontSize: screenWidth * 0.05,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreepsterCaps',
                color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.62,
          child: Image.asset(
            mainImage,
            height: screenHeight * 0.6,
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.6 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/216.png' : 'assets/217.png',
          isLeftPage ? 'chips' : 'China',
          isLeftPage ? 'رقائق البطاطا المقلية' : 'الصين',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth *  0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/222.png' : 'assets/218.png',
          isLeftPage ? 'cheese' : 'Algeria',
          isLeftPage ? 'الجبن' : 'الجزائر',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.41,
        left: isLeftPage ? screenWidth * 0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/223.png' : 'assets/219.png',
          isLeftPage ? 'candies' : 'Egypt',
          isLeftPage ? 'حلوى' : 'مصر',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth *  0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/224.png' : 'assets/226.png',
          isLeftPage ? 'soda' : 'Britain',
          isLeftPage ? 'مشروب غازي ' : 'بريطانيا',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.64 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/225.png' : 'assets/227.png',
          isLeftPage ? 'chocolate' : 'United States of America',
          isLeftPage ? 'شوكولاتة' : 'الولايات المتحدة الامريكية',
          screenHeight, screenWidth
        ),
      ),
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
  return Column(
    children: [
      Image.asset(imagePath, height: screenHeight * 0.15,width: screenWidth * 0.3),
      Text(
        englishName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
      Text(
        arabicName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

}
class AnimalPage2 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage2({required this.mainImage, required this.isLeftPage});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(255, 230, 210, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "Nouns الاسماء" ,
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreepsterCaps',
                color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.62,
          child: Image.asset(
            mainImage,
            height: screenHeight * 0.6,
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.6 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/228.png' : 'assets/235.png',
          isLeftPage ? 'food' : 'sheep',
          isLeftPage ? 'طعام' : 'خروف',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth *  0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/229.png' : 'assets/233.png',
          isLeftPage ? 'bar chocolate' : 'food junk',
          isLeftPage ? 'قطعة شكولاته' : 'الوجبات السريعة',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.41,
        left: isLeftPage ? screenWidth * 0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/230.png' : 'assets/234.png',
          isLeftPage ? 'basket' : 'veggies',
          isLeftPage ? 'سلة' : 'الخضار',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth *  0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/231.png' : 'assets/236.png',
          isLeftPage ? 'meal' : 'shark',
          isLeftPage ? 'وجبة' : 'سمك القرش',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.64 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/232.png' : 'assets/237.png',
          isLeftPage ? 'lunch' : 'body',
          isLeftPage ? 'غداء' : 'جسم',
          screenHeight, screenWidth
        ),
      ),
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
  return Column(
    children: [
      Image.asset(imagePath, height: screenHeight * 0.15,width: screenWidth * 0.3),
      Text(
        englishName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
      Text(
        arabicName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

}
class AnimalPage3 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage3({required this.mainImage, required this.isLeftPage});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(255, 230, 210, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "Verbs الافعال" ,
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreepsterCaps',
                color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.62,
          child: Image.asset(
            mainImage,
            height: screenHeight * 0.6,
          ),
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.35 : null,
        right: isLeftPage ? null : screenWidth * 0.35,
        child: animalColumn(
          isLeftPage ? 'assets/238.png' : 'assets/241.png',
          isLeftPage ? 'to help' : 'to eat',
          isLeftPage ? 'يساعد' : 'يأكل',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.72,
        left: isLeftPage ? screenWidth *  0.35 : null,
        right: isLeftPage ? null : screenWidth * 0.35,
        child: animalColumn(
          isLeftPage ? 'assets/239.png' : 'assets/242.png',
          isLeftPage ? 'to prepare ' : 'to see',
          isLeftPage ? 'يجهز/ يحضر' : 'يرى',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.41,
        left: isLeftPage ? screenWidth * 0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/240.png' : 'assets/0.png',
          isLeftPage ? 'to cause' : '',
          isLeftPage ? 'يسبب' : '',
          screenHeight, screenWidth
        ),
      ),
      
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
  return Column(
    children: [
      Image.asset(imagePath, height: screenHeight * 0.15,width: screenWidth * 0.3),
      Text(
        englishName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
      Text(
        arabicName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

}
class AnimalPage4 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage4({required this.mainImage, required this.isLeftPage});

  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final screenWidth = mediaQuery.size.width;
    final screenHeight = mediaQuery.size.height;

    return Center(
  child: Stack(
    alignment: Alignment.center,
    children: [
      Positioned(
        top: screenHeight * 0.03, // ضع الـ Container في الجزء العلوي من الشاشة
        left: 0,
        right: 0,
        child: Container(
          padding: EdgeInsets.all(16.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(255, 230, 210, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "Adjectives الصفات" ,
              style: TextStyle(
                fontSize: screenWidth * 0.07,
                fontWeight: FontWeight.bold,
                fontFamily: 'CreepsterCaps',
                color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
              ),
            ),
          ),
        ),
      ),
      Align(
        alignment: isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
        child: FractionallySizedBox(
          widthFactor: 0.62,
          child: Image.asset(
            mainImage,
            height: screenHeight * 0.6,
          ),
        ),
      ),
     
      Positioned(
        top: screenHeight * 0.41,
        left: isLeftPage ? screenWidth * 0.04 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/244.png' : 'assets/243.png',
          isLeftPage ? 'healthy' : 'unhealthy',
          isLeftPage ? 'صحي' : 'غير صحي',
          screenHeight, screenWidth
        ),
      ),
      
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth) {
  return Column(
    children: [
      Image.asset(imagePath, height: screenHeight * 0.15,width: screenWidth * 0.3),
      Text(
        englishName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
      Text(
        arabicName,
        style: TextStyle(fontSize: screenWidth * 0.03, fontWeight: FontWeight.bold),
      ),
    ],
  );
}

}