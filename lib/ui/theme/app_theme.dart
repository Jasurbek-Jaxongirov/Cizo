import 'package:cizo/ui/theme/app_constants.dart';
import 'package:cizo/ui/theme/app_text_theme.dart';
import 'package:flutter/material.dart';

class AppTheme {
  static ThemeData themeData() {
    return ThemeData(
      textTheme: AppTextTheme.textTheme,
      fontFamily: 'NunitoSans',
      buttonColor: Constants.primary,
    );
  }
}
