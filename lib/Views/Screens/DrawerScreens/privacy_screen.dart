import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';
import 'package:sallah_app/constants/colors.dart';

import '../../Widgets/custom_appbar.dart';

class PrivacyScreen extends StatelessWidget {
  const PrivacyScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'Privacy Policy'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          Padding(
            padding: EdgeInsets.symmetric(vertical: 30.h, horizontal: 20.w),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Privacy Policy',
                  style: GoogleFonts.roboto(fontSize: 20.sp, color: kMainColor),
                ),
                SizedBox(
                  height: 20.h,
                ),
                Text(
                    style: GoogleFonts.roboto(
                      fontSize: 13.sp,
                      wordSpacing: 2,
                      letterSpacing: 0.2,
                      color: kBlack.withOpacity(0.6),
                    ),
                    'Contrary to popular belief, Lorem Ipsum is not simp text. It has roots in a piece of classical Latin literature from 45 BC, making \nContrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC,\nmaking it over 2000 years old. Richard McClintock, a Latin profess at Hampden-Sydney College in Virginia, looked up one of the more obscure\nLatin words, consectetur, from a Lorem Ipsum passage, and going through the cites of the word in classical literature,\ndiscovered the undoubtable s. Lorem Ipsum comes from sections 1.10.32 and 1.10.33 of "de Finibus Bonorum et Malorum" (The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32.\n(The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32\n(The Extremes of Good and Evil) by Cicero,\nwritten in 45 BC. This book is a treatise on the theory of ethics, very popular during the Renaissance. The first line of Lorem Ipsum, "Lorem ipsum dolor sit amet..", comes from a line in section 1.10.32')
              ],
            ),
          )
        ],
      ),
    );
  }
}
