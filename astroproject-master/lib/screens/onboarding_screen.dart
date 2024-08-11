import 'package:astroproject/screens/login_screen.dart';
import 'package:flutter/material.dart';
import 'package:astroproject/helpers/colorset.dart';
import 'package:astroproject/assets.dart';
import 'package:get/get.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:astroproject/components/button.dart';
class OnBoardingScreen extends StatefulWidget {
  const OnBoardingScreen({super.key});

  @override
  State<OnBoardingScreen> createState() => _OnBoardingScreenState();
}

class _OnBoardingScreenState extends State<OnBoardingScreen> {
  final PageController _pageController1 = PageController(initialPage: 0);
  int _currentIndex = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColor.kOnBoardingColor,
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Expanded(
            child: PageView.builder(
              controller: _pageController1,
              itemCount: onBoardinglist.length,
              onPageChanged: (int index) {
                setState(() {
                  _currentIndex = index;
                });
              },
              itemBuilder: (context, index) {
                return Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Image.asset(
                      onBoardinglist[index].image,
                      height: 370,
                      width: 370,
                      fit: BoxFit.contain,
                    ),
                    const SizedBox(height: 5),
                    Text(
                      onBoardinglist[index].title,
                      textAlign: TextAlign.center,
                      style: GoogleFonts.plusJakartaSans(
                        letterSpacing: 1.0,
                        fontSize: 28,  // Slightly larger for emphasis
                        fontWeight: FontWeight.bold,
                        color: AppColor.kPrimary,  // Set to kPrimary color
                      ),
                    ),
                    const SizedBox(height: 20),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 25),
                      child: Text(
                        onBoardinglist[index].description,
                        textAlign: TextAlign.center,
                        style: GoogleFonts.plusJakartaSans(
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                          color: Colors.black,
                          letterSpacing: 1.5

                        ),
                      ),
                    ),
                    const SizedBox(height: 16),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: List.generate(
                        onBoardinglist.length,
                            (index) => buildDot(index, context),
                      ),
                    ),
                  ],
                );
              },
            ),
          ),
          PrimaryButton(
            onTap: () {
              if (_currentIndex == onBoardinglist.length - 1) {
                Get.off(() => CreateAccountPage());
              } else {
                _pageController1.nextPage(
                  duration: const Duration(milliseconds: 500),
                  curve: Curves.fastOutSlowIn,
                );
              }
            },
            text: _currentIndex == onBoardinglist.length - 1
                ? 'Check My Horoscope'
                : 'Next',
            bgColor: AppColor.kPrimary,
            borderRadius: 25,
            height: 50,
            width: 370,
            textColor: AppColor.kWhite,
          ),
          const SizedBox(height: 100),
        ],
      ),
    );
  }

  Widget buildDot(int index, BuildContext context) {
    return Container(
      height: 5,
      width: _currentIndex == index ? 20 : 10,
      margin: const EdgeInsets.only(right: 5),
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(5),
        color: _currentIndex == index
            ? AppColor.kPrimary
            : AppColor.kGrayscale40,
      ),
    );
  }
}

class OnBoarding {
  final String title;
  final String description;
  final String image;

  OnBoarding({
    required this.title,
    required this.description,
    required this.image,
  });
}

List<OnBoarding> onBoardinglist = [
  OnBoarding(
    title: 'Cosmic Journey of Self-Discovery',
    image: ImagesPath.kOnboarding1,
    description:
    'Welcome to our horoscope app, where the stars align to guide you on a cosmic journey of self-discovery and enlightenment.',
  ),
  OnBoarding(
    title: 'Cosmic Journey of Self-Discovery',
    image: ImagesPath.kOnboarding1,
    description:
    'Welcome to our horoscope app, where the stars align to guide you on a cosmic journey of self-discovery and enlightenment.',
  ),
  OnBoarding(
    title: 'Cosmic Journey of Self-Discovery',
    image: ImagesPath.kOnboarding1,
    description:
    'Welcome to our horoscope app, where the stars align to guide you on a cosmic journey of self-discovery and enlightenment.',
  ),
  // Add more OnBoarding items as needed
];
