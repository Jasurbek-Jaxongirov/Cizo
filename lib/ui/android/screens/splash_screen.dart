import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_svg/flutter_svg.dart';
import '/ui/android/screens/screens.dart';
import '/ui/theme/app_constants.dart';

class SplashScreen extends StatefulWidget {
  static const String routeName = '/';
  const SplashScreen({Key? key}) : super(key: key);

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(Duration(seconds: 5), () {
      Navigator.of(context).pushReplacementNamed(OnboardingScreen.routeName);
    });
  }

  @override
  Widget build(BuildContext context) {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);

    return Scaffold(
      body: Container(
        width: double.infinity,
        height: double.infinity,
        decoration: BoxDecoration(color: Constants.primary),
        child: Center(
          child: Container(
            alignment: Alignment.center,
            padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 12),
            decoration: BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.all(Radius.circular(17))),
            width: 76,
            height: 76,
            child: SvgPicture.asset(
              'assets/icons/logo.svg',
              color: Constants.primary,
              fit: BoxFit.contain,
            ),
          ),
        ),
      ),
    );
  }
}
