import 'dart:async';
import 'package:chat_new/components/stories_components/progress_bar.dart';
import 'package:chat_new/screens/home.dart';
import 'package:chat_new/business_logic/data/shared_stories.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

class SingleStoryScreen extends StatefulWidget {
  SingleStoryScreen({Key? key, required this.users}) : super(key: key);
  var users = [];
  @override
  State<SingleStoryScreen> createState() => _SingleStoryScreenState();
}

class _SingleStoryScreenState extends State<SingleStoryScreen> {
  PageController _pageController = PageController();

  List<double> percentWatched = [];
  int currentStoryIndex = 0;
  int currentPageIndex = 0;
  List storyCount = [
    1,
    2,
    3,
  ];

  bool isLongePressed = false;

  @override
  void initState() {
    super.initState();
    for (var i = 0; i < storyCount.length; i++) {
      percentWatched.add(0);
    }
    _startWatching();
  }

  decreaseCurrentStoryIndex() {
    setState(() {
      currentStoryIndex--;
    });
    print("CurrentStoryIndex =  $currentStoryIndex");
  }

  increaseCurrentStoryIndex() {
    setState(() {
      currentStoryIndex++;
    });
    print("CurrentStoryIndex = $currentStoryIndex");
  }

  _startWatching() {
    int _durationNumber = 20;
    Timer.periodic(Duration(milliseconds: _durationNumber), (timer) {
      if (mounted) {
        setState(() {});
      }
      if (percentWatched[currentStoryIndex] + 0.01 < 1) {
        percentWatched[currentStoryIndex] += 0.01;
      } else {
        percentWatched[currentStoryIndex] = 1;
        if (currentStoryIndex < storyCount.length - 1) {
          currentStoryIndex++;
        } else {
          if (_pageController.hasClients) {
            _pageController.animateToPage(currentPageIndex + 1,
                duration: Duration(milliseconds: 1), curve: Curves.linear);
          }

          // Kendi kendine storyleri geçmesine izin verdiğimiz zaman.

          print("Current Story Index $currentStoryIndex");
        }
        if (currentPageIndex == sharedStories[currentPageIndex].length - 1 &&
            currentStoryIndex == sharedStories[currentPageIndex].length - 1 &&
            percentWatched[currentStoryIndex] == 1) {
          if (mounted) {
            Navigator.of(context).push(MaterialPageRoute(
              builder: (context) {
                return HomePage(
                  selectedIndex: 0,
                );
              },
            ));
            timer.cancel();
          }
        }
      }
      if (isLongePressed) {
        print("Uzun Basıldı");
        _durationNumber = 0;
        if (mounted) {
          setState(() {});
        }
      }
    });
  }

  _onTapDown(TapDownDetails details) {
    double screenWidth = MediaQuery.of(context).size.width;
    double dx = details.globalPosition
        .dx; // dx ekranda o anda tıklanılan yerin koordinatı. Soldan itibaren ölçmeye başlar. X eksenini temsil eder.
// Kullanıcı ekranın soluna tıkladığında.
    if (dx < screenWidth / 2) {
      if (currentStoryIndex > 0) {
        percentWatched[currentStoryIndex - 1] = 0;
        percentWatched[currentStoryIndex] = 0;

        // Bir önceki story'e git.

        decreaseCurrentStoryIndex();
      }
    } else if (currentStoryIndex < storyCount.length - 1) {
      percentWatched[currentStoryIndex] = 1;
      // Sonraki story'e atla.
      increaseCurrentStoryIndex();
    }
    // Kullanıcı ekranın sağına tıkladığında.
    // başka story kaldı mı?
  }

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onLongPressEnd: (details) {
        isLongePressed = false;
      },
      onLongPress: () => isLongePressed = true,
      onTapDown: (details) => _onTapDown(details),
      child: PageView.builder(
        onPageChanged: ((value) {
          currentPageIndex = value;
          currentStoryIndex = 0;
          for (var i = 0; i < 3; i++) {
            percentWatched[i] = 0;
          }

          print("CurrentPageIndex =  $currentPageIndex");
          print("CurrenStoryIndex = $currentStoryIndex");
        }),
        controller: _pageController,
        itemCount: sharedStories.length,
        itemBuilder: (context, index) {
          return Scaffold(
            body: Stack(fit: StackFit.passthrough, children: [
              SizedBox(
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
                // ****************** Gösterilen Story ************************
                child: Image.asset(
                  // index kullanıcı profilini, currentStoryİndex o profile ait storyleri temsil ediyor.
                  sharedStories[currentPageIndex][currentStoryIndex],
                  fit: BoxFit.cover,
                ),
              ),
              _components()
            ]),
          );
        },
      ),
    );
  }

  _components() {
    return Positioned(
      bottom: 50.h,
      child: Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          Padding(
            padding: EdgeInsets.only(bottom: 950.h),
            child: AllProgressBars(
              percentWatched: percentWatched,
            ),
          ),
          Container(
            padding: EdgeInsets.only(right: 250.w, bottom: 33.h),
            child: widget.users.isEmpty
                ? SizedBox()
                : Text(
                    widget.users[currentPageIndex]!.name.toString() +
                        widget.users[currentPageIndex]!.surname.toString(),
                    style: TextStyle(color: Colors.white, fontSize: 37),
                  ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Padding(
                padding: EdgeInsets.only(
                  right: 20.w,
                ),
                child: widget.users.isEmpty
                    ? SizedBox()
                    : Text(
                        widget.users[currentPageIndex]!.location.toString(),
                        style: TextStyle(color: Colors.white, fontSize: 30),
                      ),
              ),
              Container(
                  padding: EdgeInsets.only(
                    right: 270.w,
                  ),
                  child: widget.users.isEmpty
                      ? SizedBox(
                          height: 54.h,
                        )
                      : Image.asset("assets/locationiconn.png"))
            ],
          ),
        ],
      ),
    );
  }
}
