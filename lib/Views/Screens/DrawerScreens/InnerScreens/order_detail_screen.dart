import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';

import '../../../../constants/colors.dart';
import '../../../Widgets/checkout_item.dart';
import '../../../Widgets/custom_appbar.dart';

class OrderDetailScreen extends StatefulWidget {
  const OrderDetailScreen({super.key});

  @override
  State<OrderDetailScreen> createState() => _OrderDetailScreenState();
}

class _OrderDetailScreenState extends State<OrderDetailScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'Order Details'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              orderIdCard(),
              SizedBox(height: 20.h),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 30.w),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Phone Number : ',
                          style: GoogleFonts.roboto(fontSize: 17.sp),
                        ),
                        Text(
                          '+972 595935907',
                          style:
                              GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          'City : ',
                          style: GoogleFonts.roboto(fontSize: 17.sp),
                        ),
                        Text(
                          'Gaza',
                          style:
                              GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          'Address : ',
                          style: GoogleFonts.roboto(fontSize: 17.sp),
                        ),
                        SizedBox(height: 5.h),
                        Text(
                          'Al Thalathini Street - Al Noor Building - 2nd Floor',
                          maxLines: 2,
                          softWrap: true,
                          style:
                              GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                child: Text(
                  'Products :',
                  style: GoogleFonts.roboto(fontSize: 17.sp),
                ),
              ),
              ListView.builder(
                shrinkWrap: true,
                physics: const BouncingScrollPhysics(),
                itemBuilder: (context, index) {
                  return const CheckoutItemWidget();
                },
                itemCount: 3,
              ),
            ],
          ),
        ],
      ),
    );
  }

  Padding orderIdCard() {
    return Padding(
      padding: EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
      child: SizedBox(
        height: 92.h,
        child: Card(
          elevation: 0,
          color: const Color(0xffF0F5E0),
          shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
              topRight: Radius.circular(20),
              bottomLeft: Radius.circular(20),
              bottomRight: Radius.circular(20),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(20),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Column(
                  children: [
                    Row(
                      children: [
                        Text(
                          'Order ID : 12892222',
                          style: GoogleFonts.roboto(
                              color: kMainColor, fontSize: 17.sp),
                        ),
                      ],
                    ),
                    SizedBox(height: 10.h),
                    Row(
                      children: [
                        Text(
                          '12/2/2019',
                          style:
                              GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                        ),
                        SizedBox(width: 10.w),
                        Text(
                          'Total : 100\$',
                          style:
                              GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                        ),
                      ],
                    ),
                  ],
                ),
                Text(
                  'on Delivery',
                  style: GoogleFonts.roboto(fontSize: 12.sp, color: Colors.red),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
