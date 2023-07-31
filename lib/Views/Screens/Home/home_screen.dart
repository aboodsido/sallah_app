import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Controllers/App/get_categories_controller.dart';

import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/main_drawer.dart';
import 'InnerScreens/search_screen.dart';

// ignore: must_be_immutable
class HomeScreen extends StatefulWidget {
  HomeScreen({
    super.key,
  });

  int itemCount = 0;

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int current = 0;
  int currentCardIndex = 0;

  bool isInCart = false;

  int selectedCategoryId = 1;


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
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
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => SearchScreen(),
                  ),
                );
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
                  child: FutureBuilder(
                    future: GetCategories.getCategories(),
                    builder: ((context, snapshot) {
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
                        final categoryModel = snapshot.data!;
                        if (categoryModel.categories == null ||
                            categoryModel.categories!.isEmpty) {
                          return const Center(
                            child: Text('No categories found.'),
                          );
                        } else {
                          return ListView.builder(
                            physics: const BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemCount: categoryModel.categories?.length ?? 0,
                            itemBuilder: (context, index) {
                              final category = categoryModel.categories![index];
                              return InkWell(
                                onTap: () {
                                  setState(() {
                                    current = index;
                                    selectedCategoryId = category.id!;
                                    print(
                                        "selectedCategoryId $selectedCategoryId");
                                  });
                                },
                                child: Card(
                                  color: current == index ? kMainColor : kWhite,
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
                                              Image.network(category.image!,
                                                  width: 40.w,
                                                  height: 40.h,
                                                  color: current == index
                                                      ? kWhite
                                                      : null),
                                              const SizedBox(width: 5),
                                              Text(
                                                category.name!,
                                                style: GoogleFonts.roboto(
                                                  fontSize: 15.sp,
                                                  color: current == index
                                                      ? kWhite
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
                          );
                        }
                      }
                    }),
                  ),
                ),
                SizedBox(height: 20.h),
                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 10),
                    child: FutureBuilder(
                      future: GetCategories.getProductByCategoryId(
                          selectedCategoryId),
                      builder: (context, snapshot) {
                        if (snapshot.connectionState ==
                            ConnectionState.waiting) {
                          return Center(
                            child: CircularProgressIndicator(
                              color: kMainColor,
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text('Error: ${snapshot.error}'),
                          );
                        } else {
                          final productModel = snapshot.data!;
                          final products = productModel.products;

                          if (products == null || products.isEmpty) {
                            return const Center(
                              child:
                                  Text('No products found for this category.'),
                            );
                          } else {
                            return GridView.builder(
                              itemCount: products.length,
                              physics: const BouncingScrollPhysics(),
                              gridDelegate:
                                  const SliverGridDelegateWithFixedCrossAxisCount(
                                crossAxisCount: 2,
                                childAspectRatio: 3 / 4,
                                crossAxisSpacing: 10,
                                mainAxisSpacing: 10,
                              ),
                              itemBuilder: (context, index) {
                                final product = products[index];
                                return SizedBox(
                                  width: 160.w,
                                  height: 200.h,
                                  child: itemCard(index,
                                      image: product.image,
                                      productName: product.name,
                                      productPrice: product.price),
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
      ),
    );
  }

  Card itemCard(
    int index, {
    required String image,
    required String productName,
    required double productPrice,
  }) {
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
          child: Column(
            children: [
              Image.network(
                image,
                width: 75.w,
                height: 75.h,
              ),
              SizedBox(height: 5.h),
              Text(
                productName,
                style: GoogleFonts.roboto(
                  fontSize: 13.sp,
                  color: kGrey,
                ),
              ),
              SizedBox(height: 5.h),
              Text(
                '$productPrice \$/K',
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
                          borderRadius: const BorderRadius.only(
                            topRight: Radius.circular(20),
                            topLeft: Radius.circular(2),
                            bottomLeft: Radius.circular(2),
                            bottomRight: Radius.circular(2),
                          ),
                          color: kMainColor,
                        ),
                        child: Icon(
                          Icons.remove,
                          color: kWhite,
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
                        style:
                            GoogleFonts.roboto(color: kWhite, fontSize: 10.sp),
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
                        child: Icon(
                          Icons.add,
                          color: kWhite,
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
    );
  }
}
