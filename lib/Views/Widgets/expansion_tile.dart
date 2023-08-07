import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  final String question;
  final String answer;
  const ExpansionTileWidget({
    super.key,
    required this.question,
    required this.answer,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      title: Text(
        question,
        style: GoogleFonts.roboto(color: kBlack, fontSize: 17.sp),
      ),
      children: [
        Container(
          padding: const EdgeInsets.all(20),
          color: const Color(0xffF0F5E0),
          child: Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  question,
                  style: GoogleFonts.roboto(color: kMainColor, fontSize: 17.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                  answer,
                  style: GoogleFonts.roboto(
                      color: kGrey, fontSize: 13.sp, height: 1.5),
                ),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
