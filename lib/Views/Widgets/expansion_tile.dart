import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class ExpansionTileWidget extends StatelessWidget {
  const ExpansionTileWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return ExpansionTile(
      tilePadding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 10.h),
      title: Text(
        'What is store ?',
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
                  'What is store ?',
                  style: GoogleFonts.roboto(color: kMainColor, fontSize: 17.sp),
                ),
                SizedBox(
                  height: 10.h,
                ),
                Text(
                    style: GoogleFonts.roboto(
                        color: kGrey, fontSize: 13.sp, height: 1.5),
                    'Contrary to popular belief, Lorem Ipsum is not simply rand text. It has roots in a piece of classical Latin literature from 45 BC, making .'),
              ],
            ),
          ),
        ),
      ],
    );
  }
}
