import 'package:cizo/ui/android/screens/login_screen.dart';
import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

class OnboardingBottom extends StatelessWidget {
  const OnboardingBottom({
    Key? key,
    required this.height,
    required this.title,
    required this.textStyle,
    required this.content,
    required this.buttonText,
    required this.page,
    required this.controller,
  }) : super(key: key);

  final double height;
  final String title;
  final TextTheme textStyle;
  final String content;
  final String buttonText;
  final int page;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    return Container(
      height: height * 0.44,
      decoration: BoxDecoration(
        color: Constants.white,
        borderRadius: BorderRadius.horizontal(
            left: Radius.circular(30), right: Radius.circular(30)),
      ),
      child: Padding(
        padding: EdgeInsets.only(
            bottom: height * 0.08,
            left: height * 0.031,
            right: height * 0.031,
            top: height * 0.040),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text(
              title,
              style: textStyle.headline2!.copyWith(
                color: Constants.dark,
              ),
              textAlign: TextAlign.center,
            ),
            SizedBox(
              height: height * 0.03,
            ),
            Text(
              content,
              style: textStyle.headline5!
                  .copyWith(color: Constants.dark.withOpacity(0.6)),
              textAlign: TextAlign.center,
            ),
            Spacer(),
            MaterialButton(
              shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.all(Radius.circular(20))),
              onPressed: () {
                page == 3
                    ? Navigator.of(context)
                        .pushReplacementNamed(LoginScreen.routeName)
                    : controller.animateToPage(
                        page,
                        duration: const Duration(seconds: 1),
                        curve: Curves.linear,
                      );
              },
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: height * 0.02),
                child: Text(
                  buttonText,
                  style: textStyle.button,
                ),
              ),
              color: Constants.primary,
              minWidth: double.infinity,
            ),
          ],
        ),
      ),
    );
  }
}
