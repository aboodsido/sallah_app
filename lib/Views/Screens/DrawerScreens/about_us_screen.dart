import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/constants/colors.dart';

import '../../../constants/app_images.dart';

class AboutUsScreen extends StatelessWidget {
  const AboutUsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: Colors.transparent,
      ),
      body: Stack(
        children: [
          Positioned(
            child: Image.asset(
              width: 380.w,
              Assets.imagesAboutUs,
              fit: BoxFit.cover,
            ),
          ),
          Expanded(
            child: SingleChildScrollView(
              child: Container(
                width: double.infinity,
                margin: EdgeInsets.only(top: 190.h),
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(20),
                    topRight: Radius.circular(180),
                  ),
                ),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 20.w, top: 30.h),
                      child: Text(
                        'About Us',
                        style: GoogleFonts.roboto(
                            fontSize: 30.sp, color: kMainColor),
                      ),
                    ),
                    SizedBox(
                      height: 20.h,
                    ),
                    Padding(
                      padding: const EdgeInsets.all(10.0),
                      child: Text(
                          style: GoogleFonts.roboto(
                            fontSize: 13.sp,
                            wordSpacing: 2,
                            letterSpacing: 0.5,
                          ),
                          'Contrary to popular belief, Lorem Ipsum is not simp text. It has roots in a piece of classical Latin literature from 45 BC, making \nContrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC,\nmaking it over 2000 years old. Richard McClintock, a Latin profess at Hampden-Sydney College in Virginia, looked up one of the more obscure\nLatin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature,\ndiscovered the undoubtable s. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n(The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32\n(The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32'),
                    ),
                    SizedBox(
                      height: 10.h,
                    )
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
