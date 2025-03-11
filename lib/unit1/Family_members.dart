import 'package:firdaws/unit1/intro1.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class FlipBook extends StatefulWidget {
  @override
  _FlipBookState createState() => _FlipBookState();
}

class _FlipBookState extends State<FlipBook> {
  @override
  void initState() {
    super.initState();
    // اجعل الشاشة أفقية فقط عند الدخول إلى هذه الصفحة
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.landscapeRight,
      DeviceOrientation.landscapeLeft,
    ]);
  }

  @override
  void dispose() {
    // إعادة الشاشة للوضع الرأسي عند مغادرة الصفحة
    SystemChrome.setPreferredOrientations([
      DeviceOrientation.portraitUp,
      DeviceOrientation.portraitDown,
    ]);
    super.dispose();
  }

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
          _playFlipSound(); // Play the sound when the user taps to flip the page
        },
        child: PageFlipWidget(
          key: _controller,
          backgroundColor: Color.fromARGB(255, 224, 238, 223),
         lastPage: Container(
  color: Color.fromARGB(255, 224, 238, 223),
  child: Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          'End of unit',
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.08, // حجم النص بناءً على عرض الشاشة
            fontWeight: FontWeight.bold,
            fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
            color: Color.fromARGB(255, 238, 119, 33), // اللون البنفسجي
          ),
        );
      },
    ),
  ),
),
          children: [
            intro1(),
            AnimalPage(mainImage: 'assets/300.png', isLeftPage: true),
            AnimalPage1(mainImage: 'assets/302.png', isLeftPage: true),
            AnimalPage2(mainImage: 'assets/302.png', isLeftPage: true),
            AnimalPage3(mainImage: 'assets/303.png', isLeftPage: true),
            AnimalPage3(mainImage: 'assets/304.png', isLeftPage: false),
            AnimalPage4(mainImage: 'assets/306.png', isLeftPage: true),
            AnimalPage2(mainImage: 'assets/307.png', isLeftPage: false),
            AnimalPage5(mainImage: 'assets/308.png', isLeftPage: true),
            AnimalPage6(mainImage: 'assets/309.png', isLeftPage: true),
            AnimalPage7(mainImage: 'assets/310.png', isLeftPage: true),
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              // padding: EdgeInsets.all(4.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  "Family members أعضاء العائلة",
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.02,
            left: isLeftPage ? screenWidth * 0.8 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/19.png' : 'assets/12.png',
                isLeftPage ? 'Sister' : 'Uncle',
                isLeftPage ? 'الاخت' : 'العم أو الخال',
                screenHeight,
                screenWidth,
                'Sister.mp3',
                'SisterA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.02,
            left: isLeftPage ? screenWidth * 0.14 : null,
            right: isLeftPage ? null : screenWidth * 0.35,
            child: animalColumn(
                isLeftPage ? 'assets/18.png' : 'assets/13.png',
                isLeftPage ? 'Nephew' : 'Mother’s parents',
                isLeftPage ? 'إبن الأخ' : 'والدي الام',
                screenHeight,
                screenWidth,
                'Nephew.mp3',
                'NephewA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.26,
            left: isLeftPage ? screenWidth * 0.14 : null,
            right: isLeftPage ? null : screenWidth * 0.08,
            child: animalColumn(
                isLeftPage ? 'assets/17.png' : 'assets/14.png',
                isLeftPage ? 'Brother' : 'Grandfather',
                isLeftPage ? 'الاخ' : 'الجد',
                screenHeight,
                screenWidth,
                'Brother.mp3',
                'BrotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.08,
            child: animalColumn(
                isLeftPage ? 'assets/301.png' : 'assets/15.png',
                isLeftPage ? 'Cousin' : 'Aunt',
                isLeftPage ? 'أبناء وبنات (العم والخال ' : 'العمة أو الخالة',
                screenHeight,
                screenWidth,
                'Cousin.mp3',
                'CousinA.mp3'),
          ),

          Positioned(
            top: screenHeight * 0.26,
            left: isLeftPage ? screenWidth * 0.8 : null,
            right: isLeftPage ? null : screenWidth * 0.35,
            child: animalColumn(
                isLeftPage ? 'assets/31.png' : 'assets/41.png',
                isLeftPage ? 'Niece' : 'Mother',
                isLeftPage ? 'بنت الاخت' : 'الام',
                screenHeight,
                screenWidth,
                'Niece.mp3',
                'NieceA.mp3'),
          ),

          // Positioned(
          //   top: screenHeight * 0.51,
          //   left: isLeftPage ? screenWidth * 0.08 : null,
          //   right: isLeftPage ? null : screenWidth * 0.08,
          //   child: animalColumn(
          //     isLeftPage ? 'assets/15.png' : 'assets/15.png',
          //     isLeftPage ? 'Father' : 'Aunt',
          //     isLeftPage ? 'الاب' : 'العمة أو الخالة',
          //     screenHeight, screenWidth,'apple.mp3'
          //   ),
          // ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.39 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/GRANDMOM.png' : 'assets/21.png',
                isLeftPage ? 'Grandmother' : 'Grandmother',
                isLeftPage ? 'الجدة' : 'الجدة',
                screenHeight,
                screenWidth,
                'Grandmother.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.5 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/12.png' : 'assets/21.png',
                isLeftPage ? 'Uncle' : 'Grandmother',
                isLeftPage ? 'العم أو الخال' : 'الجدة',
                screenHeight,
                screenWidth,
                'Uncle.mp3',
                'UncleA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.61 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/13.png' : 'assets/21.png',
                isLeftPage ? 'Mother’s parents' : 'Grandmother',
                isLeftPage ? 'والدي الام' : 'الجدة',
                screenHeight,
                screenWidth,
                'Mother’s parents.mp3',
                'Mother’s parentsA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.73 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/15.png' : 'assets/21.png',
                isLeftPage ? 'Aunt' : 'Grandmother',
                isLeftPage ? 'العمة أو الخالة' : 'الجدة',
                screenHeight,
                screenWidth,
                'Aunt.mp3',
                'AuntA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.28 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/14.png' : 'assets/21.png',
                isLeftPage ? 'Grandfather' : 'Grandmother',
                isLeftPage ? 'الجد' : 'الجدة',
                screenHeight,
                screenWidth,
                'Grandfather.mp3',
                'GrandfatherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.14 : null,
            right: isLeftPage ? null : screenWidth * 0.76,
            child: animalColumn(
                isLeftPage ? 'assets/41.png' : 'assets/21.png',
                isLeftPage ? 'Mother' : 'Grandmother',
                isLeftPage ? 'الام' : 'الجدة',
                screenHeight,
                screenWidth,
                'Mother.mp3',
                'MotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.805 : null,
            right: isLeftPage ? null : screenWidth * 0.35,
            child: animalColumn(
                isLeftPage ? 'assets/16.png' : 'assets/21.png',
                isLeftPage ? 'Father' : 'Grandmother',
                isLeftPage ? 'الاب' : 'الجدة',
                screenHeight,
                screenWidth,
                'Father.mp3',
                'FatherA.mp3'),
          ),
        ],
      ),
    );
  }

  Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Nationalities الجنسيات',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.11,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.64,
            child: animalColumn(
                isLeftPage ? 'assets/55.png' : 'assets/62.png',
                isLeftPage ? 'Chinese' : 'China',
                isLeftPage ? 'صيني' : 'الصين',
                screenHeight,
                screenWidth,
                'Chinese.mp3',
                'ChineseA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.11,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.08,
            child: animalColumn(
                isLeftPage ? 'assets/56.png' : 'assets/61.png',
                isLeftPage ? 'Algerian' : 'Algeria',
                isLeftPage ? 'جزائري' : 'الجزائر',
                screenHeight,
                screenWidth,
                'Algerian.mp3',
                'AlgerianA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.41,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.06,
            child: animalColumn(
                isLeftPage ? 'assets/54.png' : 'assets/63.png',
                isLeftPage ? 'Egyptian' : 'Egypt',
                isLeftPage ? 'مصري' : 'مصر',
                screenHeight,
                screenWidth,
                'Egyptian.mp3',
                'EgyptianA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.74,
            left: isLeftPage ? screenWidth * 0.48 : null,
            right: isLeftPage ? null : screenWidth * 0.06,
            child: animalColumn(
                isLeftPage ? 'assets/53.png' : 'assets/64.png',
                isLeftPage ? 'British' : 'Britain',
                isLeftPage ? 'بريطاني' : 'بريطانيا',
                screenHeight,
                screenWidth,
                'British.mp3',
                'BritishA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.41,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/52.png' : 'assets/65.png',
                isLeftPage ? 'American' : 'United States of America',
                isLeftPage ? 'أمريكي' : 'الولايات المتحدة الامريكية',
                screenHeight,
                screenWidth,
                'Americanz.mp3',
                'AmericanzA.mp3'),
          ),
        ],
      ),
    );
  }

 Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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

class AnimalPage2 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage2({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                isLeftPage ?  'Countries البلدان ' :'Verbs الأفعال',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/62.png' : 'assets/-42.png',
                isLeftPage ? 'China' : 'to have',
                isLeftPage ? 'الصين' : 'يملك',
                screenHeight,
                screenWidth,
                isLeftPage ? 'China.mp3' : 'have.mp3',
              isLeftPage ? 'ChinaA.mp3' : 'haveA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.04 : null,
            right: isLeftPage ? null : screenWidth * 0.08,
            child: animalColumn(
                isLeftPage ? 'assets/61.png' : 'assets/-43.png',
                isLeftPage ? 'Algeria' : 'to speak',
                isLeftPage ? 'الجزائر' : 'يتحدث',
                screenHeight,
                screenWidth,
                isLeftPage ? 'Algeria.mp3' : 'speak.mp3',
              isLeftPage ? 'AlgeriaA.mp3' : 'speakA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: isLeftPage ? screenWidth * 0.02 : null,
            right: isLeftPage ? null : screenWidth * 2,
            child: animalColumn(
                isLeftPage ? 'assets/63.png' : 'assets/63.png',
                isLeftPage ? 'Egypt' : 'Egypt',
                isLeftPage ? 'مصر' : 'مصر',
                screenHeight,
                screenWidth,
                'Egypt.mp3',
                'EgyptA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.74,
            left: isLeftPage ? screenWidth * 0.45 : null,
            right: isLeftPage ? null : screenWidth * 0.43,
            child: animalColumn(
                isLeftPage ? 'assets/64.png' : 'assets/-44.png',
                isLeftPage ? 'Britain' : 'to be',
                isLeftPage ? 'بريطانيا' : 'يكون',
                screenHeight,
                screenWidth,
                 isLeftPage ? 'Britain.mp3' : 'be.mp3',
              isLeftPage ? 'BritainA.mp3' : 'beA.mp3' ),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 2.6,
            child: animalColumn(
                isLeftPage ? 'assets/65.png' : 'assets/65.png',
                isLeftPage
                    ? 'United States of America'
                    : 'United States of America',
                isLeftPage
                    ? 'الولايات المتحدة الامريكية'
                    : 'الولايات المتحدة الامريكية',
                screenHeight,
                screenWidth,
                'USA.mp3',
                'USAA.mp3'),
          ),
        ],
      ),
    );
  }
 Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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
class AnimalPage3 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage3({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Numbers الارقام',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-1.png' : 'assets/-16.png',
                isLeftPage ? 'One' : 'Sixteen',
                isLeftPage ? 'واحد' : 'ستة عشر',
                screenHeight,
                screenWidth,
                isLeftPage ?'One.mp3': 'Sixteen.mp3',
                isLeftPage ?'OneA.mp3': 'SixteenA.mp3' ),
          ),
          Positioned(
            top: screenHeight * 0.3,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-2.png' : 'assets/-17.png',
                isLeftPage ? 'Two' : 'Seventeen',
                isLeftPage ? 'اثنان' : 'سبعة عشر',
                screenHeight,
                screenWidth,
                isLeftPage ?'Two.mp3': 'Seventeen.mp3',
                isLeftPage ?'TwoA.mp3': 'SeventeenA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.6,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-4.png' : 'assets/-19.png',
                isLeftPage ? 'Four' : 'Nineteen',
                isLeftPage ? 'أربعة' : 'تسعة عشر',
                screenHeight,
                screenWidth,
                isLeftPage ?'Four.mp3': 'Nineteen.mp3',
                isLeftPage ?'FourA.mp3': 'NineteenA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-5.png' : 'assets/-20.png',
                isLeftPage ? 'Five' : 'Twenty',
                isLeftPage ? 'خمسة' : 'عشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Five.mp3': 'Twenty.mp3',
                isLeftPage ?'FiveA.mp3': 'TwentyA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/-15.png' : 'assets/-30.png',
                isLeftPage ? 'Fifteen' : 'Thirty',
                isLeftPage ? 'خمسة عشر' : 'ثلاثون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Fifteen.mp3': 'Thirty.mp3',
                isLeftPage ?'FifteenA.mp3': 'ThirtyA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.3,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.81,
            child: animalColumn(
                isLeftPage ? 'assets/-14.png' : 'assets/-29.png',
                isLeftPage ? 'Fourteen' : 'Twenty-nine',
                isLeftPage ? 'اربعة عشر' : 'تسعة وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Fourteen.mp3': 'Twenty-nine.mp3',
                isLeftPage ?'FourteenA.mp3': 'Twenty-nineA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.6,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-12.png' : 'assets/-27.png',
                isLeftPage ? 'Twelve' : 'Twenty-seven',
                isLeftPage ? 'اثنا عشر' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Twelve.mp3': 'Twenty-seven.mp3',
                isLeftPage ?'TwelveA.mp3': 'Twenty-sevenA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.81,
            child: animalColumn(
                isLeftPage ? 'assets/-11.png' : 'assets/-26.png',
                isLeftPage ? 'Eleven' : 'Twenty-six',
                isLeftPage ? 'احد عشر' : 'ستة وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Eleven.mp3': 'Twenty-six.mp3',
                isLeftPage ?'ElevenA.mp3': 'Twenty-sixA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.81,
            child: animalColumn(
                isLeftPage ? 'assets/-3.png' : 'assets/-28.png',
                isLeftPage ? 'Three' : 'Twenty-eight',
                isLeftPage ? 'ثلاثة' : 'ثمانية وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Three.mp3': 'Twenty-eight.mp3',
                isLeftPage ?'ThreeA.mp3': 'Twenty-eightA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.45,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-13.png' : 'assets/-18.png',
                isLeftPage ? 'Thirteen' : 'Eighteen',
                isLeftPage ? 'ثلاثة عشر' : 'ثمانية عشر',
                screenHeight,
                screenWidth,
                isLeftPage ?'Thirteen.mp3': 'Eighteen.mp3',
                isLeftPage ?'ThirteenA.mp3': 'EighteenA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.23 : null,
            right: isLeftPage ? null : screenWidth * 0.23,
            child: animalColumn(
                isLeftPage ? 'assets/-10.png' : 'assets/-21.png',
                isLeftPage ? 'Ten' : 'Twenty-one',
                isLeftPage ? 'عشرة' : 'واحد وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Ten.mp3': 'Twenty-one.mp3',
                isLeftPage ?'TenA.mp3': 'Twenty-oneA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.35 : null,
            right: isLeftPage ? null : screenWidth * 0.35,
            child: animalColumn(
                isLeftPage ? 'assets/-9.png' : 'assets/-22.png',
                isLeftPage ? 'Nine' : 'Twenty-two',
                isLeftPage ? 'تسعة' : 'اثنان وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Nine.mp3': 'Twenty-two.mp3',
                isLeftPage ?'NineA.mp3': 'Twenty-twoA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.47 : null,
            right: isLeftPage ? null : screenWidth * 0.47,
            child: animalColumn(
                isLeftPage ? 'assets/-8.png' : 'assets/-23.png',
                isLeftPage ? 'Eight' : 'Twenty-three',
                isLeftPage ? 'ثمانية' : 'ثلاثة وعشرون',
                screenHeight,
                screenWidth,
               isLeftPage ?'Eight.mp3': 'Twenty-three.mp3',
                isLeftPage ?'EightA.mp3': 'Twenty-threeA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.59 : null,
            right: isLeftPage ? null : screenWidth * 0.59,
            child: animalColumn(
                isLeftPage ? 'assets/-7.png' : 'assets/-24.png',
                isLeftPage ? 'Seven' : 'Twenty-four',
                isLeftPage ? 'سبعة' : 'اربعة وعشرون',
                screenHeight,
                screenWidth,
                isLeftPage ?'Seven.mp3': 'Twenty-four.mp3',
                isLeftPage ?'SevenA.mp3': 'Twenty-fourA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.71 : null,
            right: isLeftPage ? null : screenWidth * 0.71,
            child: animalColumn(
                isLeftPage ? 'assets/-6.png' : 'assets/-25.png',
                isLeftPage ? 'Six' : 'Twenty-five',
                isLeftPage ? 'ستة' : 'خمسة وعشرون',
                screenHeight,
                screenWidth,
               isLeftPage ?'Six.mp3': 'Twenty-five.mp3',
                isLeftPage ?'SixA.mp3': 'Twenty-fiveA.mp3'),
          ),
        ],
      ),
    );
  }

  Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.1),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.015, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.015, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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

class AnimalPage4 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage4({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Nouns الاسماء',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.04,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-31.png' : 'assets/-16.png',
                isLeftPage ? 'Family' : 'Sixteen',
                isLeftPage ? 'العائلة' : 'ستة عشر',
                screenHeight,
                screenWidth,
                'Family.mp3',
                'FamilyA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.28,
            left: isLeftPage ? screenWidth * 0.84 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-36.png' : 'assets/-27.png',
                isLeftPage ? 'Friends' : 'Twenty-seven',
                isLeftPage ? 'الاصدقاء' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'Friends.mp3',
                'FriendsA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.51,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-33.png' : 'assets/-19.png',
                isLeftPage ? 'Years old' : 'Nineteen',
                isLeftPage ? 'سنة' : 'تسعة عشر',
                screenHeight,
                screenWidth,
                'Years-old.mp3',
                'Years-oldA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.83 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-35.png' : 'assets/-20.png',
                isLeftPage ? 'Language' : 'Twenty',
                isLeftPage ? 'اللغة' : 'عشرون',
                screenHeight,
                screenWidth,
                'Language.mp3',
                'LanguageA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.11 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/-34.png' : 'assets/-30.png',
                isLeftPage ? 'Country' : 'Thirty',
                isLeftPage ? 'البلد' : 'ثلاثون',
                screenHeight,
                screenWidth,
                'Country.mp3',
                'CountryA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.4,
            left: isLeftPage ? screenWidth * 0.11 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-37.png' : 'assets/-27.png',
                isLeftPage ? 'Age' : 'Twenty-seven',
                isLeftPage ? 'السن' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'Age.mp3',
                'AgeA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.1 : null,
            right: isLeftPage ? null : screenWidth * 0.81,
            child: animalColumn(
                isLeftPage ? 'assets/-38.png' : 'assets/-26.png',
                isLeftPage ? 'Name' : 'Twenty-six',
                isLeftPage ? 'الاسم' : 'ستة وعشرون',
                screenHeight,
                screenWidth,
                'Name.mp3',
                'NameA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.23 : null,
            right: isLeftPage ? null : screenWidth * 0.23,
            child: animalColumn(
                isLeftPage ? 'assets/-41.png' : 'assets/-21.png',
                isLeftPage ? 'City' : 'Twenty-one',
                isLeftPage ? 'المدينة' : 'واحد وعشرون',
                screenHeight,
                screenWidth,
                'City.mp3',
                'CityA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.41 : null,
            right: isLeftPage ? null : screenWidth * 0.47,
            child: animalColumn(
                isLeftPage ? 'assets/-32.png' : 'assets/-23.png',
                isLeftPage ? 'Nationality' : 'Twenty-three',
                isLeftPage ? 'الجنسية' : 'ثلاثة وعشرون',
                screenHeight,
                screenWidth,
                'Nationality.mp3',
                'NationalityA.mp3'),
                
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.5 : null,
            right: isLeftPage ? null : screenWidth * 0.59,
            child: animalColumn(
                isLeftPage ? 'assets/-39.png' : 'assets/-24.png',
                isLeftPage ? 'Members' : 'Twenty-four',
                isLeftPage ? 'الاعضاء' : 'اربعة وعشرون',
                screenHeight,
                screenWidth,
                'Members.mp3',
                'MembersA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.69 : null,
            right: isLeftPage ? null : screenWidth * 0.71,
            child: animalColumn(
                isLeftPage ? 'assets/-40.png' : 'assets/-25.png',
                isLeftPage ? 'Home' : 'Twenty-five',
                isLeftPage ? 'البيت' : 'خمسة وعشرون',
                screenHeight,
                screenWidth,
                'Home.mp3',
                'HomeA.mp3'),
          ),
        ],
      ),
    );
  }

 Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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





class AnimalPage5 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage5({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Pronouns الضمائر',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-45.png' : 'assets/-16.png',
                isLeftPage ? 'I' : 'Sixteen',
                isLeftPage ? 'أنا' : 'ستة عشر',
                screenHeight,
                screenWidth,
                'I.mp3',
                'IA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.25 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-46.png' : 'assets/-27.png',
                isLeftPage ? 'You' : 'Twenty-seven',
                isLeftPage ? 'أنت' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'You.mp3',
                'YouA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.42,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-47.png' : 'assets/-19.png',
                isLeftPage ? 'He' : 'Nineteen',
                isLeftPage ? 'هو' : 'تسعة عشر',
                screenHeight,
                screenWidth,
                'He.mp3',
                'HeA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.83 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-48.png' : 'assets/-20.png',
                isLeftPage ? 'She' : 'Twenty',
                isLeftPage ? 'هي' : 'عشرون',
                screenHeight,
                screenWidth,
                'She.mp3',
                'SheA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.07 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/-49.png' : 'assets/-30.png',
                isLeftPage ? 'It' : 'Thirty',
                isLeftPage ? 'ضمير يستعمل لغير العاقل' : 'ثلاثون',
                screenHeight,
                screenWidth,
                'It.mp3',
                'ItA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.42,
            left: isLeftPage ? screenWidth * 0.065 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-50.png' : 'assets/-27.png',
                isLeftPage ? 'we' : 'Twenty-seven',
                isLeftPage ? 'نحن' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'ball.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.03 : null,
            right: isLeftPage ? null : screenWidth * 0.81,
            child: animalColumn(
                isLeftPage ? 'assets/-51.png' : 'assets/-26.png',
                isLeftPage ? 'There' : 'Twenty-six',
                isLeftPage ? 'هناك' : 'ستة وعشرون',
                screenHeight,
                screenWidth,
                'There.mp3',
                'ThereA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.6 : null,
            right: isLeftPage ? null : screenWidth * 0.23,
            child: animalColumn(
                isLeftPage ? 'assets/-52.png' : 'assets/-21.png',
                isLeftPage ? 'This' : 'Twenty-one',
                isLeftPage ? 'هذا /هذه' : 'واحد وعشرون',
                screenHeight,
                screenWidth,
                'This.mp3',
                'ThisA.mp3'),
          ),
        
        ],
      ),
    );
  }

   Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
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





class AnimalPage6 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage6({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, // ضع الـ Container في الجزء العلوي من الشاشة
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Greetings التحّيات',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.825 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-53.png' : 'assets/-16.png',
                isLeftPage ? 'Hi' : 'Sixteen',
                isLeftPage ? 'أهلا' : 'ستة عشر',
                screenHeight,
                screenWidth,
                'Hi.mp3',
               'HiA.mp3' ),
          ),
          Positioned(
            top: screenHeight * 0.73,
            left: isLeftPage ? screenWidth * 0.32 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-54.png' : 'assets/-27.png',
                isLeftPage ? 'Hello' : 'Twenty-seven',
                isLeftPage ? 'مرحبا' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'Hello.mp3',
                'HelloA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.42,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-55.png' : 'assets/-19.png',
                isLeftPage ? 'Welcome' : 'Nineteen',
                isLeftPage ? 'مرحبا' : 'تسعة عشر',
                screenHeight,
                screenWidth,
                'Welcome.mp3',
                'HelloA.mp3'),
                
          ),
          Positioned(
            top: screenHeight * 0.13,
            left: isLeftPage ? screenWidth * 0.07 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/-56.png' : 'assets/-30.png',
                isLeftPage ? 'Good afternoon' : 'Thirty',
                isLeftPage ? 'مساء الخير' : 'ثلاثون',
                screenHeight,
                screenWidth,
                'Good-afternoon.mp3',
                'Good-afternoonA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.42,
            left: isLeftPage ? screenWidth * 0.065 : null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-57.png' : 'assets/-27.png',
                isLeftPage ? 'Glad to meet you' : 'Twenty-seven',
                isLeftPage ? 'تشرفت بمعرفتك' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'Glad-to-meet-you.mp3',
                'Glad-to-meet-youA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.73,
            left: isLeftPage ? screenWidth * 0.6 : null,
            right: isLeftPage ? null : screenWidth * 0.23,
            child: animalColumn(
                isLeftPage ? 'assets/-58.png' : 'assets/-21.png',
                isLeftPage ? 'Nice to meet you' : 'Twenty-one',
                isLeftPage ? 'سعيد بلقائك' : 'واحد وعشرون',
                screenHeight,
                screenWidth,
                'Nice-to-meet-you.mp3',
                'Nice-to-meet-youA.mp3'),
          ),
        
        ],
      ),
    );
  }

  Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.015, // حجم النص بنسبة 3% من عرض الشاشة
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





class AnimalPage7 extends StatelessWidget {
  final String mainImage;
  final bool isLeftPage;

  AnimalPage7({required this.mainImage, required this.isLeftPage});
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
            top: screenHeight *
                0.02, 
            left: 0,
            right: 0,
            child: Container(
              color: Color.fromARGB(
                  255, 224, 238, 223), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                  'Basic questions  الاسئلة الاساسية',
                  style: TextStyle(
                    fontSize: screenWidth * 0.03,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'CreepsterCaps',
                    color: Colors.black, // يمكنك تعيين اللون الذي تريده هنا
                  ),
                ),
              ),
            ),
          ),
          Align(
            alignment:
                isLeftPage ? Alignment.centerRight : Alignment.centerLeft,
            child: Transform.translate(
              offset: Offset(
                  0,
                  -screenHeight *
                      0.07), // استخدم نسبة من ارتفاع الشاشة لتحريك الصورة لأعلى
              child: FractionallySizedBox(
                widthFactor: 2,
                child: Image.asset(
                  mainImage,
                  height: screenHeight * 0.6,
                ),
              ),
            ),
          ),
          Positioned(
            top: screenHeight * 0.6,
            left: isLeftPage ? screenWidth * 0.82: null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-59.png' : 'assets/-16.png',
                isLeftPage ? '?How about you' : 'Sixteen',
                isLeftPage ? 'ماذا عنك؟' : 'ستة عشر',
                screenHeight,
                screenWidth,
                'How-about-you.mp3','How-about-youA.mp3'),
                
          ),
          Positioned(
            top: screenHeight * 0.6,
            left: isLeftPage ? screenWidth * 0.06: null,
            right: isLeftPage ? null : screenWidth * 0.805,
            child: animalColumn(
                isLeftPage ? 'assets/-60.png' : 'assets/-27.png',
                isLeftPage ? '?Where are you from' : 'Twenty-seven',
                isLeftPage ? 'من أين أنت ؟ ' : 'سبعة وعشرون',
                screenHeight,
                screenWidth,
                'Where.mp3', 'WhereA.mp3'),
               
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: isLeftPage ? screenWidth * 0.06 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/-61.png' : 'assets/-19.png',
                isLeftPage ? 'What is your?name ' : 'Nineteen',
                isLeftPage ? 'ما اسمك؟' : 'تسعة عشر',
                screenHeight,
                screenWidth,
                'What.mp3','WhatA.mp3'),
                
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: isLeftPage ? screenWidth * 0.82 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/-62.png' : 'assets/-30.png',
                isLeftPage ? '?How old are you' : 'Thirty',
                isLeftPage ? 'كم عمرك ؟' : 'ثلاثون',
                screenHeight,
                screenWidth,
                'How.mp3','HowA.mp3'),
                
          ),
        ],
      ),
    );
  }

 Widget animalColumn(String imagePath, String englishName, String arabicName,
      double screenHeight, double screenWidth, String sound, String Asound) {
    return Column(
      children: [
        Container(
          child: Image.asset(imagePath, height: screenHeight * 0.16),
        ),
        GestureDetector(
          onTap: () => _playSound(sound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                englishName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.01, // حجم النص بنسبة 3% من عرض الشاشة
                  fontWeight: FontWeight.bold,
                ),
              ),
            ],
          ),
        ),
        GestureDetector(
          onTap: () => _playSound(Asound),
          child: Row(
            mainAxisSize: MainAxisSize.min,
            children: [
              Icon(
                Icons.volume_up,
                size: screenWidth * 0.02, // حجم الأيقونة بنسبة 4% من عرض الشاشة
              ),
              SizedBox(
                  width: screenWidth *
                      0.01), // مسافة بين الأيقونة والنص بنسبة 1% من عرض الشاشة
              Text(
                arabicName,
                style: TextStyle(
                  fontSize:
                      screenWidth * 0.015, // حجم النص بنسبة 3% من عرض الشاشة
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