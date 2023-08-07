import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Controllers/App/get_offers_controller.dart';

import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/main_drawer.dart';

class OffersScreen extends StatefulWidget {
  int itemCount = 0;

  OffersScreen({super.key});

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
      drawer: const MainDrawer(),
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(
          appBarTitle: 'Offers',
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
                  child: FutureBuilder(
                    future: OffersController.getOffers(),
                    builder: (context, snapshot) {
                      if (snapshot.connectionState == ConnectionState.waiting) {
                        return Center(
                          child: CircularProgressIndicator(
                            color: kMainColor,
                          ),
                        );
                      } else if (snapshot.hasError) {
                        return Center(
                          child: Text('there is an error : ${snapshot.error}'),
                        );
                      } else {
                        final offersModel = snapshot.data!;
                        if (offersModel.offers == null ||
                            offersModel.offers!.isEmpty) {
                          return const Center(
                            child: Text('No offers found.'),
                          );
                        } else {
                          return GridView.builder(
                            itemCount: offersModel.offers?.length ?? 0,
                            physics: const BouncingScrollPhysics(),
                            gridDelegate:
                                const SliverGridDelegateWithFixedCrossAxisCount(
                              crossAxisCount: 2,
                              childAspectRatio: 3 / 4.5,
                              crossAxisSpacing: 10,
                              mainAxisSpacing: 10,
                            ),
                            itemBuilder: (context, index) {
                              final offer = offersModel.offers![index];
                              return SizedBox(
                                width: 160.w,
                                height: 200.h,
                                child: itemCard(index,
                                    image: offer.image!,
                                    name: offer.name!,
                                    discount: offer.discount!,
                                    price: offer.price!,
                                    priceOffer: offer.priceOffer!),
                              );
                            },
                          );
                        }
                      }
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

  Card itemCard(int index,
      {required String image,
      required String name,
      required int price,
      required double priceOffer,
      required int discount}) {
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
                      Image.network(
                        image,
                        width: 75.w,
                        height: 75.h,
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        name,
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: kGrey,
                        ),
                      ),
                      SizedBox(height: 10.h),
                      Text(
                        '$price \$/K',
                        style: GoogleFonts.roboto(
                          fontSize: 13.sp,
                          color: Colors.red,
                          decoration: TextDecoration.lineThrough,
                        ),
                      ),
                      SizedBox(height: 5.h),
                      Text(
                        '$priceOffer \$/K',
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
                  '$discount%',
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
