import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';
import '../../constants/app_images.dart';
import '../Widgets/bground_image.dart';
import '../Widgets/custom_button.dart';

class OffersScreen extends StatefulWidget {
  int itemCount = 0;

  @override
  State<OffersScreen> createState() => _OffersScreenState();
}

class _OffersScreenState extends State<OffersScreen> {
  int current = 0;
  int currentCardIndex = 0;

  bool isInCart = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      appBar: AppBar(
        title: Text(
          'Offers',
          style: GoogleFonts.roboto(fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: kMainColor,
        toolbarHeight: 50.h,
        shape: const RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(25),
            bottomRight: Radius.circular(25),
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
                  child: GridView.builder(
                    itemCount: 6,
                    physics: const BouncingScrollPhysics(),
                    gridDelegate:
                        const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 3 / 4.5,
                      crossAxisSpacing: 10,
                      mainAxisSpacing: 10,
                    ),
                    itemBuilder: (context, index) {
                      return SizedBox(
                        width: 160.w,
                        height: 200.h,
                        child: itemCard(index),
                      );
                    },
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }

  Card itemCard(int index) {
    return Card(
      elevation: 3,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomLeft: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Center(
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Column(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  Column(
                    children: [
                      Image.asset(
                        Assets.imagesApple,
                        width: 75.w,
                        height: 75.h,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        'Data',
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: kGrey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '5.00 \$/K',
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '5.00 \$/K',
                        style: GoogleFonts.roboto(
                          fontSize: 18.sp,
                          color: kMainColor,
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 20.h),
                  Row(
                    children: [
                      Visibility(
                        visible: isInCart &&
                            widget.itemCount > 0 &&
                            currentCardIndex == index,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              --widget.itemCount;
                            });
                          },
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(20),
                                topLeft: Radius.circular(2),
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                              ),
                              color: kMainColor,
                            ),
                            child: const Icon(
                              Icons.remove,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Expanded(
                        child: CustomButton(
                          width: double.infinity,
                          height: 30.h,
                          color: kMainColor,
                          child: Text(
                            isInCart &&
                                    widget.itemCount > 0 &&
                                    currentCardIndex == index
                                ? 'Count in Cart (${widget.itemCount})'
                                : 'Add to cart',
                            style: GoogleFonts.roboto(
                                color: Colors.white, fontSize: 10.sp),
                          ),
                          onTap: () {
                            setState(() {
                              currentCardIndex = index;
                              isInCart = true;
                              widget.itemCount = 1;
                            });
                          },
                        ),
                      ),
                      SizedBox(width: 3.w),
                      Visibility(
                        visible: isInCart &&
                            widget.itemCount > 0 &&
                            currentCardIndex == index,
                        child: GestureDetector(
                          onTap: () {
                            setState(() {
                              ++widget.itemCount;
                            });
                          },
                          child: Container(
                            width: 25.w,
                            height: 25.h,
                            decoration: BoxDecoration(
                              borderRadius: const BorderRadius.only(
                                topRight: Radius.circular(2),
                                topLeft: Radius.circular(20),
                                bottomLeft: Radius.circular(2),
                                bottomRight: Radius.circular(2),
                              ),
                              color: kMainColor,
                            ),
                            child: const Icon(
                              Icons.add,
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ),
                    ],
                  ),
                  SizedBox(height: 10.h),
                ],
              ),
              SvgPicture.asset(Assets.imagesSvg1),
              Positioned(
                right: 5.w,
                top: 6.h,
                child: Text(
                  '12%',
                  style: GoogleFonts.roboto(color: Colors.white),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
