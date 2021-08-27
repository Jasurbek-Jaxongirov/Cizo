import 'dart:io';

import 'package:cizo/ui/theme/app_theme.dart';
import 'package:flutter/material.dart';

class Constants {
  // Cizo Kit Color
  static const Color primary = Color(0xFF14C1FA);
  static const Color dark = Color(0xFF323438);
  static const Color grey = Color(0xFFA9A9A9);
  static const Color success = Color(0xFF16D76F);
  static const Color error = Color(0xFFF31629);
  static const Color white = Color(0xFFFFFFFF);
  static const Color screen = Color(0xFFFAFAFA);
  static const Color yellow = Color(0xFFFFB72B);

  // Cizo Kit Onboarding texts
  static List<String> onboardingTitles = [
    'Welcome to Cizo!',
    'Trusted by Teachers',
    'Get Ready, be a Superstar!',
  ];

  // Cizo Kit Onboarding images and emojies
  static List<String> onboardingContent = [
    'Thank you for downloading our app! Enjoy all of Cizo features directly in your hands!',
    'Cizo is trusted by the teachers worldwide to maintain the student learning progress.',
    'Gather all the poins as much as you can, be a superstar in your class with Cizo!',
  ];

  static List<String> onboardingButton = [
    'Next',
    'Next',
    'Start the Journey!',
  ];

  static List<String> onboardingRectangleImages = [
    'assets/icons/onboarding_rectangle_1.png'
  ];

  static List<String> onboardingEmoji = [
    'assets/icons/onboarding_emoji_1.png',
    'assets/icons/onboarding_emoji_2.png',
    'assets/icons/onboarding_emoji_3.png',
  ];

  static String extraEmoji = 'assets/icons/student_pack.png';

  // LoginPage variables

  static var hintStyle = AppTheme.themeData()
      .textTheme
      .headline5!
      .copyWith(color: Constants.grey, fontWeight: FontWeight.w400);

  static var isLoginPasswordHidden = true;
  static var isLoginActivated = false;

  static inputDecoration(IconData icon, String hintText, [Widget? suffixIcon]) {
    return InputDecoration(
      prefixIcon: Icon(
        icon,
        color:
            Constants.isLoginActivated ? Constants.primary : Color(0XFFA9A9A9),
      ),
      suffixIcon: suffixIcon,
      hintText: hintText,
      hintStyle: hintStyle,
      filled: !Constants.isLoginActivated,
      fillColor: Constants.grey.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: Constants.isLoginActivated ? 1 : 0,
          color: Constants.isLoginActivated
              ? Constants.primary
              : Colors.transparent,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Constants.error,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  // Signup variables

  static var isSignupPasswordHidden = true;
  static var isSignupActivated = false;
  static inputSignUpDecoration({
    required String fullname,
    required IconData prefixIcon,
    Widget? suffix,
  }) {
    return InputDecoration(
      prefixIcon: Icon(
        prefixIcon,
        color:
            Constants.isSignupActivated ? Constants.primary : Color(0XFFA9A9A9),
      ),
      suffixIcon: suffix,
      hintText: fullname,
      hintStyle: hintStyle,
      filled: !Constants.isSignupActivated,
      fillColor: Constants.grey.withOpacity(0.1),
      contentPadding: const EdgeInsets.symmetric(vertical: 10),
      border: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      enabledBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: Constants.isSignupActivated ? 1 : 0,
          color: Constants.isSignupActivated
              ? Constants.primary
              : Colors.transparent,
          style: BorderStyle.solid,
        ),
      ),
      errorBorder: OutlineInputBorder(
        borderRadius: BorderRadius.circular(20),
        borderSide: BorderSide(
          width: 1,
          color: Constants.error,
          style: BorderStyle.solid,
        ),
      ),
    );
  }

  // Variables for HomePage

  static var isProfile = false;
  static File? imageFile;
}
