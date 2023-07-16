import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/screen_size.dart';
import '../Widgets/appbar_shape.dart';
import '../Widgets/bground_image.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_container.dart';

class SignUpScreen extends StatefulWidget {
  const SignUpScreen({super.key});

  @override
  State<SignUpScreen> createState() => _SignUpScreenState();
}

class _SignUpScreenState extends State<SignUpScreen> {
  final TextEditingController _emailTextCotroller = TextEditingController();
  final TextEditingController _passTextCotroller = TextEditingController();
  final TextEditingController _nameTextCotroller = TextEditingController();
  final TextEditingController _phoneNumTextCotroller = TextEditingController();
  bool isChecked = false;

  @override
  void dispose() {
    _emailTextCotroller.dispose();
    _passTextCotroller.dispose();
    _nameTextCotroller.dispose();
    _phoneNumTextCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSize.getHeight(context),
          width:  ScreenSize.getWidth(context),
          child: Stack(
            children: [
              const BackgroundImage(),
              const AppbarShape(),
              Positioned(
                left: 20.w,
                top: 80.h,
                child: Text(
                  'Sign Up',
                  style:
                      GoogleFonts.roboto(color: Colors.white, fontSize: 35.sp),
                ),
              ),
              Positioned(
                  left: 10.w,
                  top: 30.h,
                  child: IconButton(
                    onPressed: () => Navigator.pop(context),
                    icon: const Icon(
                      Icons.arrow_back_ios_new,
                      color: Colors.white,
                    ),
                  )),
              Positioned(
                right: 20.w,
                top: 45.h,
                child: Text(
                  'Skip',
                  style:
                      GoogleFonts.roboto(color: Colors.white, fontSize: 15.sp),
                ),
              ),
              Container(
                margin: EdgeInsets.only(top: 100.h, left: 20.w, right: 20.w),
                child: Center(
                  child: Card(
                    shape: const OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: Colors.white),
                      borderRadius: BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    elevation: 7,
                    color: Colors.white,
                    child: SizedBox(
                      width: double.infinity,
                      height: 500.h,
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 50, left: 20, right: 20),
                        child: Column(
                          children: [
                            Image.asset(
                              Assets.imagesIcon1,
                              width: 145.w,
                              height: 45.h,
                            ),
                            SizedBox(
                              height: MediaQuery.of(context).size.height / 16,
                            ),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.text,
                                controller: _nameTextCotroller,
                                hintText: 'User Name',
                                icon: Icons.person,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                controller: _emailTextCotroller,
                                hintText: 'Email',
                                icon: Icons.email,
                                keyboardType: TextInputType.emailAddress,
                                obscure: false,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                controller: _phoneNumTextCotroller,
                                hintText: 'Phone Number',
                                icon: Icons.call,
                                keyboardType: TextInputType.number,
                                obscure: false,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                controller: _passTextCotroller,
                                hintText: 'Password',
                                icon: Icons.key_rounded,
                                keyboardType: TextInputType.visiblePassword,
                                obscure: true,
                              ),
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.center,
                              children: [
                                Checkbox(
                                  activeColor: kMainColor,
                                  value: isChecked,
                                  onChanged: (val) {
                                    setState(
                                      () {
                                        isChecked = val!;
                                      },
                                    );
                                  },
                                ),
                                Text(
                                  'You agree to the Terms & Privacy Policy ',
                                  style: GoogleFonts.roboto(
                                    fontSize: 10.sp,
                                    color: kGrey,
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            CustomButton(
                              width: 150.w,
                              height: 40.h,
                              color: kMainColor,
                              child: Center(
                                child: Text(
                                  'Sign Up',
                                  style: GoogleFonts.roboto(
                                      color: Colors.white, fontSize: 15.sp),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushReplacementNamed(context, '/WelcomeScreen');
                              },
                            ),
                            SizedBox(height: 10.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              )
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
