import 'package:firdaws/unit1/intro1.dart';
import 'package:firdaws/unit6/intro6.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:audioplayers/audioplayers.dart';

class Games extends StatefulWidget {
  @override
  _FlipBookState createState() => _FlipBookState();
}

class _FlipBookState extends State<Games> {
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
          backgroundColor: Color.fromRGBO(232, 224, 245, 1),
          lastPage: Container(
            color: Colors.white,
            child: const Center(child: Text('Last Page!')),
          ),
          children: [
            intro6(),
            // AnimalPage(mainImage: 'assets/12_right.png', isLeftPage: true),
            // AnimalPage(mainImage: 'assets/12_left.png', isLeftPage: false),
            // AnimalPage1(mainImage: 'assets/50.png', isLeftPage: true),
            // AnimalPage1(mainImage: 'assets/51.png', isLeftPage: false),
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
  final AudioPlayer _audioPlayer = AudioPlayer();

  void _playSound(String sound) async {
    print("f");
    await _audioPlayer.play(AssetSource(sound));
  }
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
          padding: EdgeInsets.all(10.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
          color: Color.fromRGBO(232, 224, 245, 1),// يمكنك ضبط لون الخلفية ودرجة الشفافية
          child: Center(
            child: Text(
              "Family members أعضاء العائلة",
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
        right: isLeftPage ? null : screenWidth * 0.7,
        child: animalColumn(
                isLeftPage ? 'assets/245.png' : 'assets/251.png',
                isLeftPage ? 'Sister' : 'Uncle',
                isLeftPage ? 'الاخت' : 'العم أو الخال',
                screenHeight, screenWidth,'apple.mp3'
              ),
            
      ),
      Positioned(
        top: screenHeight * 0.11,
        left: isLeftPage ? screenWidth * 0.15 : null,
        right: isLeftPage ? null : screenWidth * 0.35,
        child: animalColumn(
          isLeftPage ? 'assets/246.png' : 'assets/13.png',
          isLeftPage ? 'Cousin' : 'Mother’s parents',
          isLeftPage ? 'ابن العم' : 'والدي الام',
          screenHeight, screenWidth,'apple.mp3'
        ),
      ),
      Positioned(
        top: screenHeight * 0.3,
        left: isLeftPage ? screenWidth * 0.01 : null,
        right: isLeftPage ? null : screenWidth * 0.08,
        child: animalColumn(
          isLeftPage ? 'assets/247.png' : 'assets/252.png',
          isLeftPage ? 'Brother' : 'Grandfather',
          isLeftPage ? 'الاخ' : 'الجد',
          screenHeight, screenWidth,'apple.mp3'
        ),
      ),
      Positioned(
        top: screenHeight * 0.51,
        left: isLeftPage ? screenWidth * 0.08 : null,
        right: isLeftPage ? null : screenWidth * 0.02,
        child: animalColumn(
          isLeftPage ? 'assets/249.png' : 'assets/253.png',
          isLeftPage ? 'Father' : 'Aunt',
          isLeftPage ? 'الاب' : 'العمة أو الخالة',
          screenHeight, screenWidth,'apple.mp3'
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.15 : null,
        right: isLeftPage ? null : screenWidth * 0.68,
        child: animalColumn(
          isLeftPage ? 'assets/250.png' : 'assets/252.png',
          isLeftPage ? 'Mother’s parents' : 'Grandmother',
          isLeftPage ? 'والدي الام' : 'الجدة',
          screenHeight, screenWidth,'ball.mp3'
        ),
      ),
      Positioned(
        top: screenHeight * 0.71,
        left: isLeftPage ? screenWidth * 0.65 : null,
        right: isLeftPage ? null : screenWidth * 0.35,
        child: animalColumn(
          isLeftPage ? 'assets/248.png' : 'assets/41.png',
          isLeftPage ? 'Niece' : 'Mother',
          isLeftPage ? 'بنت الاخت' : 'الام',
          screenHeight, screenWidth,'bus.mp3'
        ),
      ),
    ],
  ),
);

  }

 Widget animalColumn(String imagePath, String englishName, String arabicName, double screenHeight, double screenWidth, String sound) {
  return Column(
    children: [
      GestureDetector(
        onTap: () => _playSound(sound),
        child: Image.asset(imagePath, height: screenHeight * 0.15),
      ),
      GestureDetector(
        onTap: () => _playSound(sound),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.volume_up, 
              size: screenWidth * 0.04, // حجم الأيقونة بنسبة 4% من عرض الشاشة
            ),
            SizedBox(width: screenWidth * 0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
            Text(
              englishName,
              style: TextStyle(
                fontSize: screenWidth * 0.03, // حجم النص بنسبة 3% من عرض الشاشة
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
      ),
      GestureDetector(
        onTap: () => _playSound(sound),
        child: Row(
          mainAxisSize: MainAxisSize.min,
          children: [
            Icon(
              Icons.volume_up, 
              size: screenWidth * 0.04, // حجم الأيقونة بنسبة 4% من عرض الشاشة
            ),
            SizedBox(width: screenWidth * 0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
            Text(
              arabicName,
              style: TextStyle(
                fontSize: screenWidth * 0.03, // حجم النص بنسبة 3% من عرض الشاشة
                fontWeight: FontWeight.bold,
              ),
            ),
          ],
        ),
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
          padding: EdgeInsets.all(10.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
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