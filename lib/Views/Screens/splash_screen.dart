import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/screen_size.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Future.delayed(
      const Duration(seconds: 3),
      () {
        Navigator.of(context).pushReplacementNamed('/cityScreen');
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SizedBox(
        height: ScreenSize.getHeight(context),
        width: ScreenSize.getWidth(context),
        child: Stack(
          children: [
            Image.asset(
              Assets.imagesBground,
              fit: BoxFit.cover,
              width: MediaQuery.of(context).size.width,
              height: MediaQuery.of(context).size.height,
            ),
            Positioned(
              bottom: -50.h,
              right: -40.w,
              child: Image.asset(
                Assets.imagesShape2,
              ),
            ),
            Positioned(
              bottom: -40.h,
              right: -70.w,
              child: Image.asset(
                Assets.imagesSplash,
                width: 530.w,
                height: 220.h,
              ),
            ),
            Padding(
              padding: EdgeInsets.only(
                top: MediaQuery.of(context).size.height / 6,
                left: MediaQuery.of(context).size.width / 10,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Image.asset(
                    Assets.imagesIcon1,
                    width: 180.w,
                    height: 55.h,
                  ),
                  SizedBox(height: 10.h),
                  SizedBox(
                    width: 225.w,
                    height: 44.h,
                    child: Text(
                      'It is a long established fact that a reader will be distracted layout.',
                      style: GoogleFonts.roboto(fontSize: 11.sp, color: kGrey),
                    ),
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
