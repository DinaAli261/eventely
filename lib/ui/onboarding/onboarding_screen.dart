import 'package:evently/utils/App_text_styles.dart';
import 'package:evently/utils/app_colors.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:introduction_screen/introduction_screen.dart';

import '../home/home_screen.dart';

class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  OnBoardingScreenState createState() => OnBoardingScreenState();
}

class OnBoardingScreenState extends State<OnBoardingScreen> {
  final introKey = GlobalKey<IntroductionScreenState>();

  void _onIntroEnd(BuildContext context) {
    Navigator.of(
      context,
    ).pushReplacement(MaterialPageRoute(builder: (_) => const HomeScreen()));
  }

  Widget _buildImage(String assetName, [double width = 350]) {
    return Image.asset('assets/images/$assetName.png', width: width);
  }

  @override
  Widget build(BuildContext context) {
    final isDark = Theme.of(context).brightness == Brightness.dark;
    final pageDecoration = PageDecoration(
      pageMargin: const EdgeInsets.only(top: 150),
      bodyPadding: const EdgeInsets.fromLTRB(0, 0.0, 16.0, 16.0),
      pageColor: (isDark) ? AppColors.darkBlue : Colors.white,
    );

    return IntroductionScreen(
      rtl: (Directionality.of(context) == TextDirection.rtl) ? true : false,
      key: introKey,
      globalBackgroundColor: (isDark) ? AppColors.darkBlue : AppColors.white,
      allowImplicitScrolling: true,
      autoScrollDuration: 3000,
      infiniteAutoScroll: true,
      globalHeader: Align(
        alignment: Alignment.center,
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.only(top: 16, right: 16),
            child: _buildImage('onboarding', 159),
          ),
        ),
      ),
      pages: [
        PageViewModel(
          titleWidget: createTitleWidget("Find Events That Inspire You"),
          bodyWidget: createBodyWidget(
            "Dive into a world of events crafted to fit your unique interests. Whether you're into live music, art workshops, professional networking, or simply discovering new experiences, we have something for everyone. Our curated recommendations will help you explore, connect, and make the most of every opportunity around you.",
            isDark,
          ),
          image: _buildImage((isDark) ? 'onboarding2_dark' : 'onboarding2'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: createTitleWidget("Effortless Event Planning"),
          bodyWidget: createBodyWidget(
            "Take the hassle out of organizing events with our all-in-one planning tools. From setting up invites and managing RSVPs to scheduling reminders and coordinating details, we’ve got you covered. Plan with ease and focus on what matters – creating an unforgettable experience for you and your guests.",
            isDark,
          ),
          image: _buildImage((isDark) ? 'onboarding3_dark' : 'onboarding3'),
          decoration: pageDecoration,
        ),
        PageViewModel(
          titleWidget: createTitleWidget(
            "Connect with Friends & Share Moments",
          ),
          bodyWidget: createBodyWidget(
            "Make every event memorable by sharing the experience with others. Our platform lets you invite friends, keep everyone in the loop, and celebrate moments together. Capture and share the excitement with your network, so you can relive the highlights and cherish the memories.",
            isDark,
          ),
          image: _buildImage((isDark) ? "onboarding4_dark" : "onboarding4"),
          decoration: pageDecoration,
        ),
      ],
      onDone: () => _onIntroEnd(context),
      onSkip: () => _onIntroEnd(context),
      // You can override onSkip callback
      showSkipButton: false,
      skipOrBackFlex: 0,
      nextFlex: 0,
      showBackButton: true,
      //rtl: true, // Display as right-to-left
      back: const Icon(
        Icons.arrow_circle_left_outlined,
        size: 37.6,
        color: AppColors.blue,
      ),
      //skip: const Text('Skip', style: TextStyle(fontWeight: FontWeight.w600)),
      next: const Icon(
        Icons.arrow_circle_right_outlined,
        size: 37.6,
        color: AppColors.blue,
      ),
      done: const Icon(
        Icons.arrow_circle_right_outlined,
        size: 37.6,
        color: AppColors.blue,
      ),
      curve: Curves.fastLinearToSlowEaseIn,
      controlsMargin: const EdgeInsets.all(16),
      controlsPadding: kIsWeb
          ? const EdgeInsets.all(12.0)
          : const EdgeInsets.fromLTRB(8.0, 4.0, 8.0, 4.0),
      dotsDecorator: DotsDecorator(
        activeColor: AppColors.blue,
        size: const Size(10.0, 10.0),
        color: (isDark) ? AppColors.white : AppColors.black,
        activeSize: const Size(22.0, 10.0),
        activeShape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(25.0)),
        ),
      ),
      dotsContainerDecorator: const ShapeDecoration(
        color: AppColors.transparent,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.all(Radius.circular(8.0)),
        ),
      ),
    );
  }
}

Widget createTitleWidget(String title) {
  return Align(
    alignment: AlignmentGeometry.centerLeft,
    child: Text(
      style: AppTextStyles.blue20Bold,
      title,
    ),
  );
}

Widget createBodyWidget(String body, bool isDark, {bool isFirst = false}) {
  return Column(
    children: [
      Align(
        child: Text(
          style: TextStyle(
            fontSize: 16.0,
            fontWeight: FontWeight.w500,
            color: (isDark) ? AppColors.white : AppColors.black,
          ),
          body,
        ),
      ), SizedBox(),
    ],
  );
}


