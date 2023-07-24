import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../Screens/DrawerScreens/InnerScreens/order_detail_screen.dart';

class OrderCardWidget extends StatelessWidget {
  const OrderCardWidget({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () {
        Navigator.push(context,
            MaterialPageRoute(builder: (context) => const OrderDetailScreen()));
      },
      child: Container(
        margin: EdgeInsets.symmetric(vertical: 5.h),
        width: double.infinity,
        height: 75.h,
        decoration: BoxDecoration(
          color: kWhite,
          borderRadius: const BorderRadius.only(
            topRight: Radius.circular(20),
            bottomLeft: Radius.circular(20),
            bottomRight: Radius.circular(20),
          ),
        ),
        child: Padding(
          padding:
              EdgeInsets.only(left: 20.w, top: 10.h, bottom: 10.h, right: 5.w),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  SvgPicture.asset(Assets.imagesDeliveryTruck),
                  SizedBox(width: 10.w),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        'Order ID : 12892222',
                        style: GoogleFonts.roboto(fontSize: 12.sp),
                      ),
                      SizedBox(height: 5.h),
                      Row(
                        children: [
                          Text(
                            '12/2/2019',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp, color: kGrey),
                          ),
                          SizedBox(width: 7.w),
                          Text(
                            'Total : 100\$',
                            style: GoogleFonts.roboto(
                                fontSize: 12.sp, color: kGrey),
                          ),
                        ],
                      ),
                    ],
                  ),
                ],
              ),
              Row(
                children: [
                  Text(
                    'on Delivery',
                    style:
                        GoogleFonts.roboto(fontSize: 12.sp, color: Colors.red),
                  ),
                  SizedBox(
                    width: 5.w,
                  ),
                  Icon(
                    Icons.arrow_forward_ios,
                    color: kGrey,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
