import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';

class CheckoutItemWidget extends StatelessWidget {
  const CheckoutItemWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: double.infinity,
      height: 70.h,
      child: Padding(
        padding: EdgeInsets.only(bottom: 10.h),
        child: Row(
          children: [
            Container(
              color: kMainColor,
              child: Padding(
                padding: EdgeInsets.only(
                    right: 20.w, top: 10.h, bottom: 10.h, left: 10.w),
                child: Column(
                  children: [
                    Text(
                      'Quantity',
                      style: GoogleFonts.roboto(fontSize: 10.sp, color: kWhite),
                    ),
                    Text(
                      '50',
                      style: GoogleFonts.roboto(fontSize: 20.sp, color: kWhite),
                    ),
                  ],
                ),
              ),
            ),
            Transform.translate(
              offset: Offset(-10.w, 0),
              child: Container(
                width: 100.w,
                decoration: BoxDecoration(
                  color: kWhite,
                  borderRadius: const BorderRadius.all(
                    Radius.circular(15),
                  ),
                ),
                child: Image.asset(Assets.imagesApple),
              ),
            ),
            Expanded(
              child: Text(
                'Apple',
                style: GoogleFonts.roboto(fontSize: 20.sp),
              ),
            ),
            Text(
              '5.00\$ /K',
              style: GoogleFonts.roboto(color: kGrey),
            ),
            SizedBox(width: 10.w),
          ],
        ),
      ),
    );
  }
}
