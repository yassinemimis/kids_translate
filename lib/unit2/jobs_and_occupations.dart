import 'package:firdaws/unit1/intro1.dart';
import 'package:firdaws/unit2/intro2.dart';
import 'package:flutter/material.dart';
import 'package:page_flip/page_flip.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:flutter/services.dart';

class jobs_and_occupations extends StatefulWidget {
  @override
  _FlipBookState createState() => _FlipBookState();
}

class _FlipBookState extends State<jobs_and_occupations> {
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
          backgroundColor: Color.fromARGB(
                  255, 254, 232, 209),
         lastPage: Container(
  color: Color.fromARGB(255, 254, 232, 209),
  child: Center(
    child: LayoutBuilder(
      builder: (context, constraints) {
        return Text(
          'End of unit',
          style: TextStyle(
            fontSize: constraints.maxWidth * 0.08, // حجم النص بناءً على عرض الشاشة
            fontWeight: FontWeight.bold,
            fontFamily: 'CreepsterCaps', // تأكد من أن الخط موجود في مشروعك
            color: Color.fromRGBO(110, 104, 175, 1), // اللون البنفسجي
          ),
        );
      },
    ),
  ),
),
          children: [
            intro2(),
            AnimalPage(mainImage: 'assets/311.png', isLeftPage: true),
            AnimalPage(mainImage: 'assets/311.png', isLeftPage: false),
            AnimalPage1(mainImage: 'assets/312.png', isLeftPage: true),
            AnimalPage1(mainImage: 'assets/313.png', isLeftPage: false),
            AnimalPage2(mainImage: 'assets/315.png', isLeftPage: false),
            AnimalPage2(mainImage: 'assets/314.png', isLeftPage: true),
            AnimalPage3(mainImage: 'assets/316.png', isLeftPage: true),
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
                  255, 254, 232, 209), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                   isLeftPage ? "Occupations المهن":" Jobs الوظائف",
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
            left: isLeftPage ? screenWidth * 0.81 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/71.png' : 'assets/70.png',
                isLeftPage ? 'Painter' : 'Vet',
                isLeftPage ? 'دهان' : 'بيطري(ة)',
                screenHeight,
                screenWidth,
                'apple.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.02,
            left: isLeftPage ? screenWidth * 0.13 : null,
            right: isLeftPage ? null : screenWidth * 0.12,
            child: animalColumn(
                isLeftPage ? 'assets/72.png' : 'assets/73.png',
                isLeftPage ? 'Baker' : 'Pilot',
                isLeftPage ? 'خبّاز' : 'طيار',
                screenHeight,
                screenWidth,
                'apple.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.26,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 2,
            child: animalColumn(
                isLeftPage ? 'assets/74.png' : 'assets/0.png',
                isLeftPage ? 'Gardener' : '',
                isLeftPage ? 'بستاني' : '',
                screenHeight,
                screenWidth,
                'apple.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.115 : null,
            right: isLeftPage ? null : screenWidth * 0.455,
            child: animalColumn(
                isLeftPage ? 'assets/81.png' : 'assets/82.png',
                isLeftPage ? 'Cook' : 'Dentist',
                isLeftPage ? 'طبّاخ (ة)' : 'طبيب(ة) أسنان',
                screenHeight,
                screenWidth,
                'apple.mp3',
                'GrandmotherA.mp3'),
          ),

          Positioned(
            top: screenHeight * 0.26,
            left: isLeftPage ? screenWidth * 0.816 : null,
            right: isLeftPage ? null : screenWidth * 2,
            child: animalColumn(
                isLeftPage ? 'assets/84.png' : 'assets/0.png',
                isLeftPage ? 'Farmer' : '',
                isLeftPage ? 'فلاّح' : '',
                screenHeight,
                screenWidth,
                'bus.mp3',
                'GrandmotherA.mp3'),
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
            left: isLeftPage ? screenWidth * 0.40 : null,
            right: isLeftPage ? null : screenWidth * 0.6,
            child: animalColumn(
                isLeftPage ? 'assets/85.png' : 'assets/75.png',
                isLeftPage ? 'Tailor' : 'Nurse',
                isLeftPage ? 'خياط (ة)' : 'ممرض (ة)',
                screenHeight,
                screenWidth,
                'Grandmother.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.53 : null,
            right: isLeftPage ? null : screenWidth * 0.72,
            child: animalColumn(
                isLeftPage ? 'assets/88.png' : 'assets/76.png',
                isLeftPage ? 'driver' : 'Fireman',
                isLeftPage ? 'سائق' : 'رجل إطفاء',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.66 : null,
            right: isLeftPage ? null : screenWidth * 0.33,
            child: animalColumn(
                isLeftPage ? 'assets/87.png' : 'assets/77.png',
                isLeftPage ? 'Bus driver' : 'Doctor',
                isLeftPage ? 'سائق الحافلة' : 'طبيب(ة)',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.81 : null,
            right: isLeftPage ? null : screenWidth * 2,
            child: animalColumn(
                isLeftPage ? 'assets/89.png' : 'assets/0.png',
                isLeftPage ? 'Taxi driver' : '',
                isLeftPage ? 'سائق الطاكسي' : '',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.26 : null,
            right: isLeftPage ? null : screenWidth * 0.19,
            child: animalColumn(
                isLeftPage ? 'assets/86.png' : 'assets/78.png',
                isLeftPage ? 'Housewife' : 'Architect',
                isLeftPage ? 'ربة بيت' : 'مهندس (ة) معماري',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.11 : null,
            right: isLeftPage ? null : screenWidth * 0.82,
            child: animalColumn(
                isLeftPage ? 'assets/96.png' : 'assets/79.png',
                isLeftPage ? 'Carpenter' : 'Teacher',
                isLeftPage ? 'نجّار' : 'مدرس(ة)',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.813 : null,
            right: isLeftPage ? null : screenWidth * 0.1,
            child: animalColumn(
                isLeftPage ? 'assets/97.png' : 'assets/80.png',
                isLeftPage ? 'Singer' : 'Policeman',
                isLeftPage ? 'مغني (ة)' : 'شرطي(ة)',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
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
              // padding: EdgeInsets.all(4.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
              color: Color.fromARGB(
                  255, 254, 232, 209), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                   isLeftPage ? "Workplace مكان العمل":"Verbs الأفعال",
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
            top: screenHeight * 0.18,
            left: isLeftPage ? screenWidth * 0.09 : null,
            right: isLeftPage ? null : screenWidth * 0.085,
            child: animalColumn(
                isLeftPage ? 'assets/320.png' : 'assets/327.png',
                isLeftPage ? 'Hospital' : '(to work)',
                isLeftPage ? 'مستشفى' : 'يعمل',
                screenHeight,
                screenWidth,
                'apple.mp3',
                'GrandmotherA.mp3'),
          ),
         

          Positioned(
            top: screenHeight * 0.18,
            left: isLeftPage ? screenWidth * 0.795 : null,
            right: isLeftPage ? null : screenWidth *  0.805,
            child: animalColumn(
                isLeftPage ? 'assets/326.png' : 'assets/328.png',
                isLeftPage ? '‏Clinic' : '(to cook)',
                isLeftPage ? 'عيادة طبية' : 'يطبخ',
                screenHeight,
                screenWidth,
                'bus.mp3',
                'GrandmotherA.mp3'),
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
            left: isLeftPage ? screenWidth * 0.46 : null,
            right: isLeftPage ? null : screenWidth * 0.65,
            child: animalColumn(
                isLeftPage ? 'assets/323.png' : 'assets/329.png',
                isLeftPage ? 'School' : '(to give )',
                isLeftPage ? 'مدرسة' : 'يعطي',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.67 : null,
            right: isLeftPage ? null : screenWidth * 2,
            child: animalColumn(
                isLeftPage ? 'assets/324.png' : 'assets/330.png',
                isLeftPage ? 'Farm' : 'Doctor',
                isLeftPage ? 'مزرعة' : 'طبيب(ة)',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
         
          Positioned(
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.2 : null,
            right: isLeftPage ? null : screenWidth * 0.25,
            child: animalColumn(
                isLeftPage ? 'assets/322.png' : 'assets/331.png',
                isLeftPage ? 'Workshop' : '(to love)',
                isLeftPage ? 'ورشة العمل' : 'يحب',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.07 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/321.png' : 'assets/332.png',
                isLeftPage ? 'Restaurant' : '(to raise animals)',
                isLeftPage ? 'مطعم' : 'يربي الحيوانات',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.5,
            left: isLeftPage ? screenWidth * 0.813 : null,
            right: isLeftPage ? null : screenWidth * 0.1,
            child: animalColumn(
                isLeftPage ? 'assets/325.png' : 'assets/330.png',
                isLeftPage ? 'Police station' : '(to make )',
                isLeftPage ? 'مركز الشرطة' : 'يصنع',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
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
              // padding: EdgeInsets.all(4.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
              color: Color.fromARGB(
                  255, 254, 232, 209), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                   isLeftPage ? "Pronouns الضمائر":"Work tools أدوات العمل",
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
            top: screenHeight * 0.75,
            left: isLeftPage ? screenWidth * 0.46 : null,
            right: isLeftPage ? null : screenWidth * 0.4,
            child: animalColumn(
                isLeftPage ? 'assets/333.png' : 'assets/337.png',
                isLeftPage ? 'His' : 'Saw',
                isLeftPage ? 'خاصته' : 'منشار',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
       
         
         
          Positioned(
            top: screenHeight * 0.35,
            left: isLeftPage ? screenWidth * 0.12 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/334.png' : 'assets/336.png',
                isLeftPage ? 'Her' : '‏Stethoscope',
                isLeftPage ? 'خاصتها' : 'سماعات طبية',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.35,
            left: isLeftPage ? screenWidth * 0.813 : null,
            right: isLeftPage ? null : screenWidth * 0.14,
            child: animalColumn(
                isLeftPage ? 'assets/335.png' : 'assets/338.png',
                isLeftPage ? 'That' : 'Syringe',
                isLeftPage ? 'الذي /التي' : 'حقنة',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
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
              // padding: EdgeInsets.all(4.0), // أضف مسافة داخلية لتجنب التصاق النص بحواف الشاشة
              color: Color.fromARGB(
                  255, 254, 232, 209), // يمكنك ضبط لون الخلفية ودرجة الشفافية
              child: Center(
                child: Text(
                   isLeftPage ? "Basic question سؤال أساسي":"Work tools أدوات العمل",
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
            top: screenHeight * 0.2,
            left: isLeftPage ? screenWidth * 0.06 : null,
            right: isLeftPage ? null : screenWidth * 0.8,
            child: animalColumn(
                isLeftPage ? 'assets/339.png' : 'assets/336.png',
                isLeftPage ? 'What is your job ?' : '‏Stethoscope',
                isLeftPage ? 'ما هي وظيفتك ؟' : 'سماعات طبية',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
          ),
          Positioned(
            top: screenHeight * 0.2,
            left: isLeftPage ? screenWidth * 0.813 : null,
            right: isLeftPage ? null : screenWidth * 0.14,
            child: animalColumn(
                isLeftPage ? 'assets/340.png' : 'assets/338.png',
                isLeftPage ? 'I am a teacher' : 'Syringe',
                isLeftPage ? 'انا مدرسة' : 'حقنة',
                screenHeight,
                screenWidth,
                'ball.mp3',
                'GrandmotherA.mp3'),
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
          child: Image.asset(imagePath, height: screenHeight * 0.4),
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