import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';
import 'package:sallah_app/Views/Widgets/custom_button.dart';
import 'package:sallah_app/constants/app_images.dart';
import 'package:sallah_app/constants/colors.dart';

class ContactDoneScreen extends StatelessWidget {
  const ContactDoneScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          const BackgroundImage(),
          Center(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                Image.asset(Assets.imagesImage1),
                SizedBox(
                  height: 50.h,
                ),
                Text(
                  'Thank You',
                  style: GoogleFonts.roboto(fontSize: 25.sp, color: kMainColor),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  textAlign: TextAlign.center,
                  'I Will Reply To You The Fastest\nAvailable Time',
                  style: GoogleFonts.roboto(
                      fontSize: 15.sp,
                      color: kGrey,
                      wordSpacing: 1,
                      height: 1.5),
                ),
                SizedBox(
                  height: 50.h,
                ),
                CustomButton(
                  width: 150,
                  height: 40,
                  color: kMainColor,
                  child: Text(
                    'Ok',
                    style: GoogleFonts.roboto(color: kWhite, fontSize: 17.sp),
                  ),
                  onTap: () {
                    Navigator.pop(context);
                  },
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
