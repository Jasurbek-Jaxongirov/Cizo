import 'package:cizo/ui/android/components/onboarding_page.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';
import '/ui/theme/app_constants.dart';

class OnboardingScreen extends StatelessWidget {
  static const String routeName = '/onboarding';
  const OnboardingScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.dark);
    final controller = PageController(initialPage: 0);
    final pageView = PageView(
      controller: controller,
      children: [
        OnboardingPage(
          key: key,
          title: Constants.onboardingTitles[0],
          content: Constants.onboardingContent[0],
          buttonText: Constants.onboardingButton[0],
          rectangleImageUrl: Constants.onboardingRectangleImages[0],
          emojiUrl: Constants.onboardingEmoji[0],
          isExtraEmojiAdded: false,
          controller: controller,
          page: 1,
        ),
        OnboardingPage(
          key: key,
          title: Constants.onboardingTitles[1],
          content: Constants.onboardingContent[1],
          buttonText: Constants.onboardingButton[1],
          rectangleImageUrl: Constants.onboardingRectangleImages[0],
          emojiUrl: Constants.onboardingEmoji[1],
          isExtraEmojiAdded: true,
          controller: controller,
          page: 2,
        ),
        OnboardingPage(
          key: key,
          title: Constants.onboardingTitles[2],
          content: Constants.onboardingContent[2],
          buttonText: Constants.onboardingButton[2],
          rectangleImageUrl: Constants.onboardingRectangleImages[0],
          emojiUrl: Constants.onboardingEmoji[2],
          isExtraEmojiAdded: false,
          controller: controller,
          page: 3,
        ),
      ],
    );
    return Scaffold(
      body: SafeArea(
        child: Stack(
          children: [
            pageView,
            Positioned(
              bottom: size.height * 0.18,
              left: size.width * 0.38,
              child: SmoothPageIndicator(
                controller: controller,
                count: 3,
                effect: ExpandingDotsEffect(
                  expansionFactor: 4,
                  dotWidth: 9,
                  dotHeight: 9,
                  activeDotColor: Constants.primary,
                  dotColor: Color(0xFFA9A9A9).withOpacity(0.4),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
