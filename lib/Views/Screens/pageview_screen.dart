import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/screen_size.dart';
import '../Widgets/custom_button.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';

class PageViewScreen extends StatefulWidget {
  const PageViewScreen({super.key});

  @override
  State<PageViewScreen> createState() => _PageViewScreenState();
}

class _PageViewScreenState extends State<PageViewScreen> {
  final PageController _pageController = PageController();
  int _currentPage = 0;

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  void _onPageChanged(int index) {
    setState(() {
      _currentPage = index;
    });
  }

  void _skipPage() async {
    await _pageController.animateToPage(
      2,
      duration: const Duration(seconds: 1),
      curve: Curves.easeIn,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: kWhite,
      body: SizedBox(
        width: ScreenSize.getWidth(context),
        height: ScreenSize.getHeight(context),
        child: PageView(
          controller: _pageController,
          onPageChanged: _onPageChanged,
          children: [
            buildPage(
              title: 'Page 1',
              image: Assets.imagesPview1,
              subTitle: 'This is page 1',
              bColor: const Color.fromARGB(255, 199, 231, 197),
              textButton: TextButton(
                onPressed: _skipPage,
                child: Text(
                  'Skip',
                  style: GoogleFonts.roboto(color: kMainColor, fontSize: 17.sp),
                ),
              ),
            ),
            buildPage(
              title: 'Page 2',
              bColor: const Color(0xFFF8F3D5),
              image: Assets.imagesPview2,
              subTitle: 'This is page 2',
              textButton: TextButton(
                onPressed: _skipPage,
                child: Text(
                  'Skip',
                  style: GoogleFonts.roboto(color: kMainColor, fontSize: 17.sp),
                ),
              ),
            ),
            buildPage(
              title: 'Page 3',
              image: Assets.imagesPview3,
              subTitle: 'This is page 3',
              bColor: const Color.fromARGB(255, 199, 231, 197),
              textButton: CustomButton(
                onTap: () {
                  Navigator.pushNamed(context, '/LoginScreen');
                },
                width: 130.w,
                height: 35.h,
                color: kMainColor,
                child: Center(
                  child: Text(
                    'Get Started',
                    style: GoogleFonts.roboto(color: kWhite, fontSize: 14.sp),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget buildPage({
    required String title,
    required String image,
    required String subTitle,
    required Color bColor,
    required Widget textButton,
  }) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      color: bColor,
      child: Stack(
        children: [
          Positioned(
            right: -60,
            left: 100,
            child: Image.asset(
              image,
              width: 400.w,
              height: 650.h,
            ),
          ),
          Positioned(
            left: 30.w,
            bottom: 20.h,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  title,
                  style: GoogleFonts.roboto(
                      fontSize: 50.sp,
                      color: kMainColor,
                      fontWeight: FontWeight.bold),
                ),
                SizedBox(height: 20.h),
                Text(
                  subTitle,
                  style: GoogleFonts.roboto(fontSize: 13.sp, color: kGrey),
                ),
                SizedBox(height: 40.h),
                textButton,
              ],
            ),
          ),
          Positioned(
            bottom: 30.h,
            right: 30.w,
            child: Row(
              children: [
                for (int i = 0; i < 3; i++)
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 4),
                    width: 12,
                    height: 12,
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: _currentPage == i ? kMainColor : kWhite,
                    ),
                  ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
