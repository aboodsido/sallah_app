import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/custom_container.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../Widgets/custom_button.dart';

class CityScreen extends StatefulWidget {
  const CityScreen({super.key});

  @override
  State<CityScreen> createState() => _CityScreenState();
}

class _CityScreenState extends State<CityScreen> {
  String? selectedItem;
  List<String> cities = [
    'Gaza',
    'Nusiratt',
    'Rafah',
    'Jabalia',
    'Khan Yunis',
    'Beit Hanoun',
    'Ramallah',
    'Al Qudis'
  ];

  @override
  Widget build(BuildContext context) {
    double screenHeight = MediaQuery.of(context).size.height;
    double screenWidth = MediaQuery.of(context).size.width;

    return Scaffold(
      body: Container(
        width: screenWidth,
        height: screenHeight,
        decoration: const BoxDecoration(
          image: DecorationImage(
              image: AssetImage(Assets.imagesBground), fit: BoxFit.cover),
        ),
        child: Stack(
          children: [
            Positioned(
              top: -110.h,
              left: -50.w,
              child: Image.asset(
                Assets.imagesVegeImage,
                width: 556.w,
                height: 331.h,
              ),
            ),
            Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Image.asset(
                    Assets.imagesIcon1,
                    width: 150.w,
                    height: 50.h,
                  ),
                  SizedBox(height: 20.h),
                  Text(
                    'Choose the city',
                    style: GoogleFonts.roboto(color: kGrey, fontSize: 20.sp),
                  ),
                  SizedBox(height: 10.h),
                  Text(
                    'Choose the city that you are in to create your account',
                    style: GoogleFonts.roboto(color: kGrey, fontSize: 11.sp),
                  ),
                  SizedBox(height: 80.h),
                  InkWell(
                    onTap: showCitiesDialog,
                    child: CustomContainer(
                      width: 280.w,
                      height: 45.h,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                            vertical: 8, horizontal: 20),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_on_sharp,
                                  color: kMainColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  selectedItem ?? 'City',
                                  style: GoogleFonts.roboto(fontSize: 15.sp),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kMainColor,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                  SizedBox(height: 40.h),
                  CustomButton(
                      onTap: () {
                        Navigator.pushReplacementNamed(context, '/AdsScreen');
                      },
                      width: 130.w,
                      height: 35.h,
                      color: kMainColor,
                      child: Center(
                        child: Text(
                          'Ok',
                          style: GoogleFonts.roboto(
                              fontSize: 20.sp, color: Colors.white),
                        ),
                      ))
                ],
              ),
            )
          ],
        ),
      ),
    );
  }

  Future<void> showCitiesDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 227, 236, 227),
          content: SizedBox(
            width: 50.w,
            height: 200.h,
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = cities[index];
                      });
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    },
                    child: Text(
                      cities[index],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
