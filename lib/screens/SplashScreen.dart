// Dart imports:
import 'dart:async';

// Flutter imports:
import 'package:flutter/material.dart';
import 'package:infixedu/controller/system_controller.dart';
import 'package:infixedu/utils/fontconstant/constant.dart';

// Package imports:
import 'package:shared_preferences/shared_preferences.dart';

// Project imports:
import 'package:infixedu/config/app_config.dart';
import 'package:infixedu/screens/Login.dart';
import 'package:infixedu/utils/FunctinsData.dart';
import 'package:infixedu/utils/Utils.dart';
import 'package:get/get.dart';
import 'package:infixedu/screens/main/DashboardScreen.dart';


class Splash extends StatefulWidget {
  @override
  _SplashState createState() => _SplashState();
}

class _SplashState extends State<Splash> with SingleTickerProviderStateMixin {
  Animation animation;
  AnimationController controller;

  @override
  void initState() {
    super.initState();

    controller =
        AnimationController(duration: Duration(seconds: 3), vsync: this);
    animation = Tween(begin: 60.0, end: 120.0).animate(controller);
    controller.forward();

    Route route;

    Future.delayed(Duration(seconds: 3), () {
      getBooleanValue('isLogged').then((value) {
        if (value) {
          final SystemController _systemController = Get.put(SystemController());
          _systemController.getSystemSettings();
          Utils.getStringValue('rule').then((rule) {
            Utils.getStringValue('zoom').then((zoom) {
              AppFunction.getFunctions(context, rule, zoom);
            });
          });
        } else {
          if (mounted) {
            // route = MaterialPageRoute(builder: (context) => LoginScreen());
            // Navigator.pushReplacement(context, route);
            route = MaterialPageRoute(builder: (context) => DashboardScreen(students, studentIcons, 2));
            Navigator.pushReplacement(context, route);
          }
        }
      });
    });
  }

  static var students = [
    'Homework',
    'Study Materials',
    'Timeline',
    'Attendance',
    'Wallet',
    'Examination',
    'Online Exam',
    'Lesson',
    'Leave',
    'Notice',
    'Subjects',
    'Teacher',
    'Library',
    'Transport',
    'Dormitory',
    'Settings',
  ];
  static var studentIcons = [
    'assets/images/homeworkstudent.png',
    'assets/images/downloads.png',
    'assets/images/timeline.png',
    'assets/images/attendance.png',
    'assets/images/fees_icon.png',
    'assets/images/examination.png',
    'assets/images/onlineexam.png',
    'assets/images/lesson.png',
    'assets/images/leave.png',
    'assets/images/notice.png',
    'assets/images/subjects.png',
    'assets/images/teacher.png',
    'assets/images/library.png',
    'assets/images/transport.png',
    'assets/images/dormitory.png',
    'assets/images/addhw.png',
  ];

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Scaffold(
        body: Stack(
          children: <Widget>[
            Positioned.fill(
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage(AppConfig.splashScreenBackground),
                    fit: BoxFit.cover,
                  ),
                ),
              ),
            ),
            Align(
              alignment: Alignment.topCenter,
              child: Container(
                height: MediaQuery.of(context).size.height / 2,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    Padding(
                      padding: const EdgeInsets.only(bottom: 20.0),
                      child: Text(
                        'Welcome to'.tr,
                        style: Get.textTheme.subtitle1.copyWith(
                          fontWeight: FontWeight.w600,
                          fontSize: 24,
                          color: Colors.grey,
                          fontFamily:sansBold
                        ),
                      ),
                    ),
                    AnimatedBuilder(
                      animation: animation,
                      builder: (context, child) {
                        return Container(
                          height: animation.value,
                          width: animation.value,
                          decoration: BoxDecoration(
                            image: DecorationImage(
                              image: ExactAssetImage(AppConfig.appLogo),
                            ),
                          ),
                        );
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(bottom: 60.0),
                      child: Text(
                        '${AppConfig.appName}',
                        style: Get.textTheme.subtitle1.copyWith(
                          fontSize: 24,
                          fontWeight: FontWeight.w600,
                          color: Color(0xffff3465),
                          fontFamily:sansBold
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Padding(
                padding:
                    const EdgeInsets.only(bottom: 80.0, left: 40, right: 40),
                child: Container(
                  alignment: Alignment.bottomCenter,
                  child: LinearProgressIndicator(
                    color: Color(0xffff3465),
                    backgroundColor: Colors.transparent,
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Future<bool> getBooleanValue(String key) async {
    final SharedPreferences prefs = await SharedPreferences.getInstance();
    return prefs.getBool(key) ?? false;
  }
}
