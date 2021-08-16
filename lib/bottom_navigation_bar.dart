import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:animated_bottom_navigation_bar/screen/screen1.dart';
import 'package:animated_bottom_navigation_bar/screen/screen2.dart';
import 'package:animated_bottom_navigation_bar/screen/screen3.dart';
import 'package:animated_bottom_navigation_bar/screen/screen4.dart';
import 'package:animated_bottom_navigation_bar/screen/screen5.dart';

List<Widget> screens = [
  Screen1(),
  Screen2(),
  Screen3(),
  Screen4(),
  Screen5(),
];

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  CustomBottomNavigationBarState createState() =>
      CustomBottomNavigationBarState();
}

class CustomBottomNavigationBarState extends State<CustomBottomNavigationBar>
    with TickerProviderStateMixin {
  late AnimationController firstIconController;
  late Animation<double> firstIconAngle;
  late Animation<double> firstIconSize;

  late AnimationController secondIconController;
  late Animation<double> secondIconAngle;
  late Animation<double> secondIconSize;

  late AnimationController thirdIconController;
  late Animation<double> thirdIconAngle;
  late Animation<double> thirdIconSize;

  late AnimationController fourthIconController;
  late Animation<double> fourthIconAngle;
  late Animation<double> fourthIconSize;

  late AnimationController fifthIconController;
  late Animation<double> fifthIconAngle;
  late Animation<double> fifthIconSize;

  int currentIndex = 0;

  int beginningIconDuration = 1000;
  int reverseIconDuration = 200;

  double iconAngle = 0.4;

  double expandedIconSize = 50;
  double normalIconSize = 30;

  Curve forwardingCurve = Curves.elasticOut;
  Curve reversingCurve = Curves.easeIn;

  void onPageChanged(int page) {
    setState(() {
      this.pageIndex = page;
    });
  }

  void onTabTapped(int index) {
    this.pageController.animateToPage(
          index,
          duration: Duration(milliseconds: 1000),
          curve: Curves.fastLinearToSlowEaseIn,
        );
  }

  List<IconData> listOfIcons = [
    FontAwesomeIcons.gamepad,
    FontAwesomeIcons.searchengin,
    FontAwesomeIcons.plusSquare,
    FontAwesomeIcons.heartBroken,
    FontAwesomeIcons.userNinja,
  ];

  int pageIndex = 0;
  late PageController pageController;

  @override
  void initState() {
    pageController = PageController(initialPage: pageIndex);

    firstIconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: beginningIconDuration),
        reverseDuration: Duration(milliseconds: reverseIconDuration));

    firstIconAngle = Tween<double>(begin: 0, end: iconAngle).animate(
      CurvedAnimation(
          parent: firstIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
        setState(() {});
      });

    firstIconSize =
        Tween<double>(begin: normalIconSize, end: expandedIconSize).animate(
      CurvedAnimation(
          parent: firstIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
            setState(() {});
          });

    secondIconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: beginningIconDuration),
        reverseDuration: Duration(milliseconds: reverseIconDuration));

    secondIconAngle = Tween<double>(begin: 0, end: iconAngle).animate(
      CurvedAnimation(
          parent: secondIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
        setState(() {});
      });

    secondIconSize =
        Tween<double>(begin: normalIconSize, end: expandedIconSize).animate(
      CurvedAnimation(
          parent: secondIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
            setState(() {});
          });

    thirdIconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: beginningIconDuration),
        reverseDuration: Duration(milliseconds: reverseIconDuration));

    thirdIconAngle = Tween<double>(begin: 0, end: iconAngle).animate(
      CurvedAnimation(
          parent: thirdIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
        setState(() {});
      });

    thirdIconSize =
        Tween<double>(begin: normalIconSize, end: expandedIconSize).animate(
      CurvedAnimation(
          parent: thirdIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
            setState(() {});
          });

    fourthIconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: beginningIconDuration),
        reverseDuration: Duration(milliseconds: reverseIconDuration));

    fourthIconAngle = Tween<double>(begin: 0, end: iconAngle).animate(
      CurvedAnimation(
          parent: fourthIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
        setState(() {});
      });

    fourthIconSize =
        Tween<double>(begin: normalIconSize, end: expandedIconSize).animate(
      CurvedAnimation(
          parent: fourthIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
            setState(() {});
          });

    fifthIconController = AnimationController(
        vsync: this,
        duration: Duration(milliseconds: beginningIconDuration),
        reverseDuration: Duration(milliseconds: reverseIconDuration));

    fifthIconAngle = Tween<double>(begin: 0, end: iconAngle).animate(
      CurvedAnimation(
          parent: fifthIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
        setState(() {});
      });

    fifthIconSize =
        Tween<double>(begin: normalIconSize, end: expandedIconSize).animate(
      CurvedAnimation(
          parent: fifthIconController,
          curve: forwardingCurve,
          reverseCurve: reversingCurve),
    )..addListener(() {
            setState(() {});
          });

    firstIconController.forward();

    super.initState();
  }

  @override
  void dispose() {
    pageController.dispose();
    firstIconController.dispose();
    secondIconController.dispose();
    thirdIconController.dispose();
    fourthIconController.dispose();
    fifthIconController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    double screenWidth = MediaQuery.of(context).size.width;
    return Scaffold(
      backgroundColor: Color(0xff8655F9),
      body: Stack(
        children: [
          PageView(
            children: screens,
            onPageChanged: onPageChanged,
            controller: pageController,
          ),
          Align(
            alignment: Alignment.bottomCenter,
            child: Stack(
              alignment: Alignment.bottomCenter,
              children: [
                Container(
                  height: 60,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    boxShadow: [
                      BoxShadow(
                        color: Colors.black.withOpacity(.1),
                        blurRadius: 40,
                      )
                    ],
                    borderRadius: BorderRadius.vertical(
                      top: Radius.circular(20),
                    ),
                  ),
                ),
                Container(
                  height: 75,
                  color: Colors.transparent,
                  alignment: Alignment.topCenter,
                  child: ListView.builder(
                    itemCount: 5,
                    scrollDirection: Axis.horizontal,
                    padding: EdgeInsets.symmetric(
                      horizontal: screenWidth * .047,
                    ),
                    itemBuilder: (context, index) => InkWell(
                      onTap: () {
                        setState(() {
                          currentIndex = index;
                          HapticFeedback.lightImpact();
                        });

                        onTabTapped(index);
                        if (currentIndex == 0) {
                          firstIconController.forward();
                          secondIconController.reverse();
                          thirdIconController.reverse();
                          fourthIconController.reverse();
                          fifthIconController.reverse();
                        } else if (currentIndex == 1) {
                          firstIconController.reverse();
                          secondIconController.forward();
                          thirdIconController.reverse();
                          fourthIconController.reverse();
                          fifthIconController.reverse();
                        } else if (currentIndex == 2) {
                          firstIconController.reverse();
                          secondIconController.reverse();
                          thirdIconController.forward();
                          fourthIconController.reverse();
                          fifthIconController.reverse();
                        } else if (currentIndex == 3) {
                          firstIconController.reverse();
                          secondIconController.reverse();
                          thirdIconController.reverse();
                          fourthIconController.forward();
                          fifthIconController.reverse();
                        } else if (currentIndex == 4) {
                          firstIconController.reverse();
                          secondIconController.reverse();
                          thirdIconController.reverse();
                          fourthIconController.reverse();
                          fifthIconController.forward();
                        }
                      },
                      splashColor: Colors.transparent,
                      highlightColor: Colors.transparent,
                      child: AnimatedPadding(
                        padding: EdgeInsets.only(
                            top: index == currentIndex ? 0 : 30),
                        duration: Duration(milliseconds: 400),
                        curve: Curves.fastLinearToSlowEaseIn,
                        child: Container(
                          width: screenWidth * .18,
                          alignment: Alignment.topCenter,
                          child: Transform.rotate(
                            angle: index == 0
                                ? firstIconAngle.value
                                : index == 1
                                    ? secondIconAngle.value
                                    : index == 2
                                        ? thirdIconAngle.value
                                        : index == 3
                                            ? fourthIconAngle.value
                                            : index == 4
                                                ? fifthIconAngle.value
                                                : 0,
                            child: FaIcon(
                              listOfIcons[index],
                              size: index == 0
                                  ? firstIconSize.value
                                  : index == 1
                                      ? secondIconSize.value
                                      : index == 2
                                          ? thirdIconSize.value
                                          : index == 3
                                              ? fourthIconSize.value
                                              : index == 4
                                                  ? fifthIconSize.value
                                                  : 0,
                              color: index == currentIndex
                                  ? Color(0xffffb20a)
                                  : Colors.black26,
                            ),
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
