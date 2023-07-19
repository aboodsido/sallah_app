import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';
import 'package:sallah_app/Views/Widgets/custom_button.dart';
import 'package:sallah_app/constants/app_images.dart';
import 'package:sallah_app/constants/colors.dart';

import '../../constants/screen_size.dart';
import 'navigator_screen.dart';

class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenSize.getHeight(context),
        width: ScreenSize.getWidth(context),
        child: Stack(
          children: [
            const BackgroundImage(),
            Positioned(
              bottom: 0,
              left: -85.w,
              child: Image.asset(
                Assets.imagesImage2,
                width: 510.w,
                height: 370.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.symmetric(vertical: 100.h),
              child: Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Column(
                      children: [
                        Text(
                          'Welcome',
                          style: GoogleFonts.roboto(
                              letterSpacing: 2,
                              fontSize: 25.sp,
                              color: Colors.cyan),
                        ),
                        SizedBox(height: 10.h),
                        Text(
                          'Thank You For Registering With\nThe Express Application',
                          textAlign: TextAlign.center,
                          style: GoogleFonts.roboto(
                              wordSpacing: 3, fontSize: 15.sp, color: kGrey),
                        ),
                      ],
                    ),
                    CustomButton(
                      width: 150.w,
                      height: 40.h,
                      color: kMainColor,
                      child: Text(
                        'Home',
                        style: GoogleFonts.roboto(
                          fontSize: 20.sp,
                          color: kWhite,
                          letterSpacing: 2,
                        ),
                      ),
                      onTap: () {
                        Navigator.pushReplacement(
                          context,
                          MaterialPageRoute(
                            builder: (context) => CustomBottomNavigationBar(),
                          ),
                        );
                      },
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
