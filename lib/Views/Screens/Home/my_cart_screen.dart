import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/main_drawer.dart';
import 'InnerScreens/checkout_screen.dart';

class MyCartScreen extends StatefulWidget {
  MyCartScreen({super.key});

  int itemCount = 0;

  @override
  State<MyCartScreen> createState() => _MyCartScreenState();
}

class _MyCartScreenState extends State<MyCartScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          appBarTitle: 'My Cart',
          actionsWidget: Center(
            child: Text.rich(
              TextSpan(
                children: [
                  TextSpan(
                    text: 'Total: ',
                    style: GoogleFonts.roboto(
                      color: kWhite,
                      fontSize: 10.sp,
                    ),
                  ),
                  TextSpan(
                    text: '380\$  ',
                    style: GoogleFonts.roboto(
                      color: kWhite,
                      fontSize: 15.sp,
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          Column(
            children: [
              SizedBox(height: 10.h),
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 10),
                  child: ListView.builder(
                    itemCount: 6,
                    physics: const BouncingScrollPhysics(),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 300.w,
                        height: 100.h,
                        child: Card(
                          elevation: 3,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.only(
                              topRight: Radius.circular(25),
                              bottomLeft: Radius.circular(25),
                              bottomRight: Radius.circular(25),
                            ),
                          ),
                          child: Padding(
                            padding: const EdgeInsets.only(left: 10),
                            child: Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Row(
                                  children: [
                                    Image.asset(
                                      Assets.imagesApple,
                                    ),
                                    SizedBox(width: 20.w),
                                    Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      mainAxisAlignment:
                                          MainAxisAlignment.center,
                                      children: [
                                        const Text('Apple'),
                                        SizedBox(height: 10.h),
                                        Text(
                                          '5.00\$/K',
                                          style: GoogleFonts.roboto(
                                            color: kMainColor,
                                            fontSize: 18.sp,
                                          ),
                                        )
                                      ],
                                    ),
                                  ],
                                ),
                                Column(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  crossAxisAlignment: CrossAxisAlignment.end,
                                  children: [
                                    IconButton(
                                      onPressed: () {},
                                      icon: const Icon(
                                        Icons.close,
                                        color: Colors.red,
                                      ),
                                    ),
                                    Padding(
                                      padding: EdgeInsets.only(
                                          right: 12.w, bottom: 10),
                                      child: Row(
                                        children: [
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                --widget.itemCount;
                                              });
                                            },
                                            child: Container(
                                              width: 25.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(20),
                                                  topLeft: Radius.circular(2),
                                                  bottomLeft:
                                                      Radius.circular(2),
                                                  bottomRight:
                                                      Radius.circular(2),
                                                ),
                                                color: kMainColor,
                                              ),
                                              child: const Icon(
                                                Icons.remove,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          Text(
                                            widget.itemCount < 10
                                                ? '0${widget.itemCount}'
                                                : '${widget.itemCount}',
                                            style: GoogleFonts.roboto(
                                              fontSize: 15.sp,
                                              letterSpacing: 1,
                                            ),
                                          ),
                                          SizedBox(width: 5.w),
                                          GestureDetector(
                                            onTap: () {
                                              setState(() {
                                                ++widget.itemCount;
                                              });
                                            },
                                            child: Container(
                                              width: 25.w,
                                              height: 25.h,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.only(
                                                  topRight: Radius.circular(2),
                                                  topLeft: Radius.circular(20),
                                                  bottomLeft:
                                                      Radius.circular(2),
                                                  bottomRight:
                                                      Radius.circular(2),
                                                ),
                                                color: kMainColor,
                                              ),
                                              child: const Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ],
                                      ),
                                    )
                                  ],
                                )
                              ],
                            ),
                          ),
                        ),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 20.h,
            left: ScreenSize.getWidth(context) / 3.5,
            child: CustomButton(
              width: 170.w,
              height: 35.h,
              color: kMainColor,
              child: Text(
                'Checkout (${widget.itemCount})',
                style: GoogleFonts.roboto(color: kWhite, fontSize: 15.sp),
              ),
              onTap: () {
                Navigator.push(
                    context,
                    MaterialPageRoute(
                        builder: (context) => const CheckoutScreen()));
              },
            ),
          )
        ],
      ),
    );
  }
}
