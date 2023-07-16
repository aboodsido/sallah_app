import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';
import 'package:sallah_app/Views/Widgets/custom_button.dart';
import 'package:sallah_app/constants/app_images.dart';
import 'package:sallah_app/constants/colors.dart';
import 'package:sallah_app/constants/screen_size.dart';

class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  int itemCount = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  List<String> tabs = ['Vegetables', 'Fruits', 'Meat', 'Papers'];

  int current = 0;
  int currentCardIndex = 0;

  bool isInCart = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(),
      extendBodyBehindAppBar: false,
      appBar: AppBar(
        iconTheme: IconThemeData(color: kMainColor, size: 25.sp),
        title: Text(
          'Home',
          style: GoogleFonts.roboto(color: kMainColor, fontSize: 20.sp),
        ),
        centerTitle: true,
        backgroundColor: const Color(0xffF8FCF7),
        elevation: 0,
        toolbarHeight: 40.h,
        actions: [
          Padding(
            padding: EdgeInsets.only(right: 10.w),
            child: InkWell(
              onTap: () {
                //todo: Navigate to search screen
              },
              child: Container(
                width: 80.w,
                decoration: const BoxDecoration(
                  borderRadius: BorderRadius.all(Radius.circular(50)),
                  color: Color(0xffEDEFED),
                ),
                child: const Padding(
                  padding: EdgeInsets.only(left: 40),
                  child: Icon(
                    Icons.search_rounded,
                    size: 35,
                  ),
                ),
              ),
            ),
          ),
        ],
      ),
      body: SizedBox(
        width: ScreenSize.getWidth(context),
        height: ScreenSize.getHeight(context),
        child: Stack(
          children: [
            const BackgroundImage(),
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(height: 10.h),
                SizedBox(
                  height: 50.h,
                  width: ScreenSize.getWidth(context),
                  child: ListView.builder(
                    physics: const BouncingScrollPhysics(),
                    scrollDirection: Axis.horizontal,
                    itemCount: tabs.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                        onTap: () {
                          setState(() {
                            current = index;
                          });
                        },
                        child: Card(
                          color: current == index ? kMainColor : Colors.white,
                          shape: const RoundedRectangleBorder(
                            borderRadius: BorderRadius.all(
                              Radius.circular(35),
                            ),
                          ),
                          elevation: 2,
                          child: Column(
                            children: [
                              Expanded(
                                child: Padding(
                                  padding: const EdgeInsets.only(
                                    left: 20,
                                    right: 20,
                                  ),
                                  child: Row(
                                    children: [
                                      const Icon(Icons.zoom_out_rounded),
                                      const SizedBox(width: 5),
                                      Text(
                                        tabs[index],
                                        style: GoogleFonts.roboto(
                                          fontSize: 15.sp,
                                          color: current == index
                                              ? Colors.white
                                              : kMainColor,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      );
                    },
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: GridView.builder(
                      itemCount: 6,
                      physics: const BouncingScrollPhysics(),
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        childAspectRatio: 3 / 4,
                        crossAxisSpacing: 10,
                        mainAxisSpacing: 10,
                      ),
                      itemBuilder: (context, index) {
                        return SizedBox(
                          width: 160.w,
                          height: 200.h,
                          child: Card(
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
                                child: Column(
                                  children: [
                                    Image.asset(
                                      Assets.imagesImage1,
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
                                    SizedBox(height: 5.h),
                                    Text(
                                      '5.00 \$/K',
                                      style: GoogleFonts.roboto(
                                        fontSize: 18.sp,
                                        color: kMainColor,
                                      ),
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
                                                  color: Colors.white,
                                                  fontSize: 10.sp),
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
                                              child: Icon(
                                                Icons.add,
                                                color: Colors.white,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ],
                                    )
                                  ],
                                ),
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
          ],
        ),
      ),
      
    );
  }
}