import 'package:cizo/ui/theme/app_constants.dart';
import 'package:flutter/material.dart';

import 'onboarding_bottom.dart';

class OnboardingPage extends StatelessWidget {
  const OnboardingPage({
    Key? key,
    required this.title,
    required this.content,
    required this.buttonText,
    required this.rectangleImageUrl,
    required this.emojiUrl,
    this.isExtraEmojiAdded = false,
    required this.page,
    required this.controller,
  }) : super(key: key);
  final String title;
  final String content;
  final String buttonText;
  final String rectangleImageUrl;
  final String emojiUrl;
  final bool isExtraEmojiAdded;
  final int page;
  final PageController controller;
  @override
  Widget build(BuildContext context) {
    final mediaQuery = MediaQuery.of(context);
    final height = (mediaQuery.size.height - mediaQuery.padding.top);
    final textStyle = Theme.of(context).textTheme;
    return Container(
      decoration: BoxDecoration(color: Constants.screen),
      child: Column(
        children: [
          Expanded(
            child: Stack(
              alignment: Alignment.center,
              children: [
                Positioned(
                  bottom: height * 0.06,
                  width: mediaQuery.size.width * 0.866,
                  child: Image.asset(
                    rectangleImageUrl,
                    fit: BoxFit.contain,
                  ),
                ),
                Positioned(
                  bottom: height * 0.15,
                  child: Stack(
                    children: [
                      Image.asset(
                        emojiUrl,
                        fit: BoxFit.contain,
                      ),
                      if (isExtraEmojiAdded)
                        Positioned(
                          bottom: 150,
                          right: 45,
                          child: Image.asset(
                            Constants.extraEmoji,
                          ),
                        ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          OnboardingBottom(
            height: height,
            title: title,
            textStyle: textStyle,
            content: content,
            buttonText: buttonText,
            controller: controller,
            page: page,
          ),
        ],
      ),
    );
  }
}
