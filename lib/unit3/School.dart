
import 'package:firdaws/unit3/intro3.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:audioplayers/audioplayers.dart';

class School extends StatefulWidget {
  @override
  _FlipBookState createState() => _FlipBookState();
}

class _FlipBookState extends State<School> {
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
          backgroundColor: Color.fromRGBO(178, 229, 222, 1),
          lastPage: Container(
            color: Colors.white,
            child: const Center(child: Text('Last Page!')),
          ),
          children: [
            intro3(),
            // AnimalPage(mainImage: 'assets/6_right.png', isLeftPage: true),
            // AnimalPage(mainImage: 'assets/6_left.png', isLeftPage: false),
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
          color: Color.fromRGBO(178, 229, 222, 1), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "facilities School مرافق المدرسة ",
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
        top: screenHeight * 0.13,
        left: isLeftPage ? screenWidth * 0.55 : null,
        right: isLeftPage ? null : screenWidth * 0.4,
        child: animalColumn(
          isLeftPage ? 'assets/90.png' : 'assets/79.png',
          isLeftPage ? 'classroom' : 'Teacher',
          isLeftPage ? 'القسم' : 'مدرس',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.08,
        child: animalColumn(
          isLeftPage ? 'assets/91.png' : 'assets/80.png',
          isLeftPage ? 'canteen' : 'Policeman',
          isLeftPage ? 'المطعم' : 'شرطي',
          screenHeight, screenWidth
        ),
      ),

      Positioned(
        top: screenHeight * 0.31,
        left: isLeftPage ? screenWidth * 0.03 : null,
        right: isLeftPage ? null : screenWidth * 0.1,
        child: animalColumn(
          isLeftPage ? 'assets/92.png' : 'assets/81.png',
          isLeftPage ? 'pool swiming' : 'Cook',
          isLeftPage ? 'حمام السباحة' : 'طبّاخ',
          screenHeight, screenWidth
        ),
      ),
            Positioned(
        top: screenHeight * 0.52,
        left: isLeftPage ? screenWidth * 0.05 : null,
        right: isLeftPage ? null : screenWidth * 0.08,
        child: animalColumn(
          isLeftPage ? 'assets/93.png' : 'assets/82.png',
          isLeftPage ? 'lavatory' : 'Dentist',
          isLeftPage ? 'المرحاض' : 'طبيب أسنان',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.68,
        left: isLeftPage ? screenWidth * 0.06 : null,
        right: isLeftPage ? null : screenWidth * 0.08,
        child: animalColumn(
          isLeftPage ? 'assets/94.png' : 'assets/83.png',
          isLeftPage ? 'room comptuer' : 'Aunt',
          isLeftPage ? 'غرفة الكمبيوتر' : 'العمة أو الخالة',
          screenHeight, screenWidth
        ),
      ),

      Positioned(
        top: screenHeight * 0.68,
        left: isLeftPage ? screenWidth * 0.51 : null,
        right: isLeftPage ? null : screenWidth * 0.4,
        child: animalColumn(
          isLeftPage ? 'assets/95.png' : 'assets/85.png',
          isLeftPage ? 'library' : 'Tailor',
          isLeftPage ? 'المكتبة' : 'خياط',
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
          color: Color.fromARGB(255, 213, 237, 159), // يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              isLeftPage ? 'Nationalities الجنسيات' :  'Countries البلدان' ,
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
        right: isLeftPage ? null : screenWidth * 0.63,
        child: animalColumn(
          isLeftPage ? 'assets/55.png' : 'assets/62.png',
          isLeftPage ? 'Chinese' : 'China',
          isLeftPage ? 'صيني' : 'الصين',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/56.png' : 'assets/61.png',
          isLeftPage ? 'Algerian' : 'Algeria',
          isLeftPage ? 'جزائري' : 'الجزائر',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.41,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/54.png' : 'assets/63.png',
          isLeftPage ? 'Egyptian' : 'Egypt',
          isLeftPage ? 'مصري' : 'مصر',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.06,
        child: animalColumn(
          isLeftPage ? 'assets/53.png' : 'assets/64.png',
          isLeftPage ? 'British' : 'Britain',
          isLeftPage ? 'بريطاني' : 'بريطانيا',
          screenHeight, screenWidth
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.64 : null,
        right: isLeftPage ? null : screenWidth * 0.6,
        child: animalColumn(
          isLeftPage ? 'assets/52.png' : 'assets/65.png',
          isLeftPage ? 'American' : 'United States of America',
          isLeftPage ? 'أمريكي' : 'الولايات المتحدة الامريكية',
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