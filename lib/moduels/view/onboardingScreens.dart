// ignore_for_file: file_names

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:get/get.dart';
import 'package:smooth_page_indicator/smooth_page_indicator.dart';

import '../widgets/bottomnavigator.dart';
import 'onBoarding_controller.dart';

class OnboardingScreens extends StatefulWidget {
  const OnboardingScreens({super.key});

  @override
  State<OnboardingScreens> createState() => _OnboardingScreensState();
}

class _OnboardingScreensState extends State<OnboardingScreens> {
  final controller = Get.put(OnBoardingController());

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          PageView(
            controller: controller.pageController,
            onPageChanged: controller.updatePageIndicator,
            children: const [
              OnboardingPage(
                  image: "assets/on1.png",
                  title: "Choose your product",
                  subtitle:
                      "Welcome to a World of Limitless Choicess - Your Perfect Product Awaits!"),
              OnboardingPage(
                  image: "assets/on2.png",
                  title: "Try Before Buy",
                  subtitle: "Get try before buy online without any effort !"),
              OnboardingPage(
                  image: "assets/on.png",
                  title: "Deliver at your door step",
                  subtitle:
                      "For Seamless Transactions Choose your payment Path -Your Convenience, Our Priority!"),
            ],
          ),
          Positioned(
              right: 20,
              top: 60,
              child: TextButton(
                  onPressed: () => Navigator.push(context,
                      MaterialPageRoute(builder: (context) => const Home1())),
                  child: const Text(
                    "Skip",
                    style: TextStyle(color: Colors.black),
                  ))),
          const Positioned(left: 20, bottom: 60, child: DotIndicator()),
          Positioned(
            right: 20,
            bottom: 40,
            child: ElevatedButton(
              onPressed: () => OnBoardingController.instance.nextPage(),
              style: ElevatedButton.styleFrom(
                  shape: const CircleBorder(), backgroundColor: Colors.black),
              child: const Icon(Icons.arrow_forward_ios),
            ),
          )
        ],
      ),
    );
  }
}

class DotIndicator extends StatelessWidget {
  const DotIndicator({
    super.key,
    this.isActive = false,
  });

  final bool isActive;

  @override
  Widget build(BuildContext context) {
    final controller = OnBoardingController.instance;
    return SmoothPageIndicator(
      controller: controller.pageController,
      onDotClicked: controller.dotNavigationClick,
      count: 3,
      effect:
          const ExpandingDotsEffect(activeDotColor: Colors.black, dotHeight: 6),
    );
  }
}

class OnboardingPage extends StatefulWidget {
  const OnboardingPage(
      {super.key,
      required this.image,
      required this.title,
      required this.subtitle});

  final String image, title, subtitle;

  @override
  State<OnboardingPage> createState() => _OnboardingPageState();
}

class _OnboardingPageState extends State<OnboardingPage> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Column(
        children: [
          SizedBox(
            height: 60.h,
          ),
          Image(height: 300.h, width: 400.w, image: AssetImage(widget.image)),
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.black,
              fontSize: 25.sp,
            ),
          ),
          SizedBox(
            height: 15.h,
          ),
          Text(
            widget.subtitle,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 20.sp,
            ),
            textAlign: TextAlign.center,
          ),
        ],
      ),
    );
  }
}
