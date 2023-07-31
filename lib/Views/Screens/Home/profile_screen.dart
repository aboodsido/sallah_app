import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:shared_preferences/shared_preferences.dart';

import '../../../Models/profile_data.dart';
import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../Widgets/appbar_shape.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_container.dart';
import '../../Widgets/image_border.dart';
import '../../Widgets/main_drawer.dart';
import 'InnerScreens/edit_profile_screen.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  ProfileData? data;
  bool isLoading = true;

  @override
  void initState() {
    loadData();
    super.initState();
  }

  Future<void> loadData() async {
    final prefs = await SharedPreferences.getInstance();
    final profileJson = prefs.getString('profileData');
    if (profileJson != null) {
      final profileData = ProfileData.fromJson(jsonDecode(profileJson));
      setState(() {
        data = profileData;
        isLoading = false;
      });
    } else {
      setState(() {
        isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: const MainDrawer(),
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: isLoading
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : data != null
              ? SizedBox(
                  height: ScreenSize.getHeight(context),
                  width: ScreenSize.getWidth(context),
                  child: Stack(
                    children: [
                      const BackgroundImage(),
                      const AppbarShape(),
                      Positioned(
                        top: 110.h,
                        left: 90.w,
                        child: const Center(
                          child: ImageProfileBorder(isEditScreen: false),
                        ),
                      ),
                      Padding(
                        padding: EdgeInsets.symmetric(horizontal: 10.w),
                        child: Center(
                          child: Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              SizedBox(
                                  height: ScreenSize.getHeight(context) / 3),
                              Text(
                                data!.name,
                                style: GoogleFonts.roboto(
                                    color: kMainColor, fontSize: 25.sp),
                              ),
                              SizedBox(height: 30.h),
                              CustomContainer(
                                width: ScreenSize.getWidth(context),
                                height: 50.h,
                                color: kWhite,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.email,
                                            color: kMainColor,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Email',
                                            style: GoogleFonts.roboto(
                                              color: kMainColor,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        data!.email,
                                        style: GoogleFonts.roboto(
                                          fontSize: 13.sp,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 10.h),
                              CustomContainer(
                                width: ScreenSize.getWidth(context),
                                height: 50.h,
                                color: kWhite,
                                child: Padding(
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 8, horizontal: 20),
                                  child: Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Row(
                                        children: [
                                          Icon(
                                            Icons.phone,
                                            color: kMainColor,
                                          ),
                                          SizedBox(width: 10.w),
                                          Text(
                                            'Phone Number',
                                            style: GoogleFonts.roboto(
                                              color: kMainColor,
                                              fontSize: 15.sp,
                                            ),
                                          ),
                                        ],
                                      ),
                                      Text(
                                        '${data!.phoneNumber}',
                                        style: GoogleFonts.roboto(
                                          fontSize: 13.sp,
                                          color: Colors.black.withOpacity(0.5),
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                              SizedBox(height: 50.h),
                              CustomButton(
                                  width: 150.w,
                                  height: 40.h,
                                  color: kMainColor,
                                  child: Text(
                                    'Edit Profile',
                                    style: GoogleFonts.roboto(
                                        color: kWhite, fontSize: 15.sp),
                                  ),
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) =>
                                                EditProfileScreen()));
                                  })
                            ],
                          ),
                        ),
                      ),
                    ],
                  ),
                )
              : const Center(
                  child: Text('No data available. Please register first.'),
                ),
    );
  }
}
