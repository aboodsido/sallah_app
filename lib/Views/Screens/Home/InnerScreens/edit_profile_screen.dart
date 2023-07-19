import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/custom_button.dart';
import 'package:sallah_app/Views/Widgets/custom_container.dart';
import 'package:sallah_app/constants/colors.dart';

import '../../../../constants/screen_size.dart';
import '../../../Widgets/appbar_shape.dart';
import '../../../Widgets/bground_image.dart';
import '../../../Widgets/image_border.dart';

class EditProfileScreen extends StatefulWidget {
  @override
  State<EditProfileScreen> createState() => _EditProfileScreenState();
}

class _EditProfileScreenState extends State<EditProfileScreen> {
  final TextEditingController _nameTextCotroller = TextEditingController();
  final TextEditingController _emailTextCotroller = TextEditingController();
  final TextEditingController _phoneNumberTextCotroller =
      TextEditingController();

  @override
  void dispose() {
    _emailTextCotroller.dispose();
    _nameTextCotroller.dispose();
    _phoneNumberTextCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
      ),
      body: SingleChildScrollView(
        child: SizedBox(
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
                  child: ImageProfileBorder(isEditScreen: true),
                ),
              ),
              Padding(
                padding: EdgeInsets.symmetric(horizontal: 10.w),
                child: Center(
                  child: Card(
                    elevation: 0,
                    margin: EdgeInsets.only(top: 300.h, bottom: 20.h),
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: kWhite),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    child: Padding(
                      padding: EdgeInsets.symmetric(horizontal: 20.w),
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.start,
                        children: [
                          SizedBox(height: ScreenSize.getHeight(context) / 15),
                          Text(
                            'Edit Profile',
                            style: GoogleFonts.roboto(
                                color: kMainColor, fontSize: 25.sp),
                          ),
                          SizedBox(height: 30.h),
                          CustomContainer(
                            width: ScreenSize.getHeight(context),
                            height: 40.h,
                            color: Colors.transparent,
                            child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.name,
                                controller: _nameTextCotroller,
                                hintText: 'User Name',
                                icon: Icons.person),
                          ),
                          SizedBox(height: 10.h),
                          CustomContainer(
                            width: ScreenSize.getHeight(context),
                            height: 40.h,
                            color: Colors.transparent,
                            child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextCotroller,
                                hintText: 'Email',
                                icon: Icons.email),
                          ),
                          SizedBox(height: 10.h),
                          CustomContainer(
                            width: ScreenSize.getHeight(context),
                            height: 40.h,
                            color: Colors.transparent,
                            child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.number,
                                controller: _phoneNumberTextCotroller,
                                hintText: 'Phone Number',
                                icon: Icons.phone),
                          ),
                          SizedBox(height: 40.h),
                          CustomButton(
                              width: 150.w,
                              height: 40.h,
                              color: kMainColor,
                              child: Text(
                                'Save',
                                style: GoogleFonts.roboto(
                                    color: kWhite, fontSize: 15.sp),
                              ),
                              onTap: () {})
                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  TextFormField buildTextFormField({
    required bool obscure,
    required TextInputType keyboardType,
    required TextEditingController controller,
    required String hintText,
    required IconData icon,
  }) {
    return TextFormField(
      onTapOutside: (event) => FocusScope.of(context).unfocus(),
      obscureText: obscure,
      keyboardType: keyboardType,
      controller: controller,
      decoration: InputDecoration(
        hintText: hintText,
        hintStyle: TextStyle(
          color: Colors.black.withOpacity(0.3),
        ),
        prefixIcon: Icon(
          icon,
          color: kMainColor,
        ),
        border: const UnderlineInputBorder(borderSide: BorderSide.none),
      ),
    );
  }
}
