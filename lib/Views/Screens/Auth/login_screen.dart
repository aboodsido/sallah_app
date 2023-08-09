// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../Controllers/Auth/login_controller.dart';
import '../../../app_preferences.dart';
import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../../constants/screen_size.dart';
import '../../Widgets/appbar_shape.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_container.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({super.key});

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final TextEditingController _emailTextCotroller = TextEditingController();
  final TextEditingController _passTextCotroller = TextEditingController();
  TapGestureRecognizer? _tapRecognizer;

  @override
  void initState() {
    super.initState();
    _tapRecognizer = TapGestureRecognizer()..onTap = _navigateToSignUp;
  }

  void _navigateToSignUp() {
    Navigator.pushNamed(context, '/SignUpScreen');
  }

  @override
  void dispose() {
    _emailTextCotroller.dispose();
    _passTextCotroller.dispose();
    _tapRecognizer!.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: SizedBox(
          height: ScreenSize.getHeight(context),
          width: ScreenSize.getWidth(context),
          child: Stack(
            children: [
              const BackgroundImage(),
              const AppbarShape(),
              Positioned(
                left: 20.w,
                top: 80.h,
                child: Text(
                  'Sign In',
                  style: GoogleFonts.roboto(color: kWhite, fontSize: 35.sp),
                ),
              ),
              Positioned(
                right: 20.w,
                top: 50.h,
                child: Text(
                  'Skip',
                  style: GoogleFonts.roboto(color: kWhite, fontSize: 15.sp),
                ),
              ),
              Center(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Card(
                    shape: OutlineInputBorder(
                      borderSide: BorderSide(width: 0, color: kWhite),
                      borderRadius: const BorderRadius.all(
                        Radius.circular(20),
                      ),
                    ),
                    elevation: 7,
                    color: kWhite,
                    child: SizedBox(
                      width: double.infinity,
                      height: 425.h,
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
                              height: MediaQuery.of(context).size.height / 12,
                            ),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.emailAddress,
                                controller: _emailTextCotroller,
                                hintText: 'Email',
                                icon: Icons.email,
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
                            SizedBox(height: 5.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.end,
                              children: [
                                TextButton(
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/ForgotPassScreen');
                                  },
                                  child: Text(
                                    'Forgot Password',
                                    style: GoogleFonts.roboto(
                                        fontSize: 11.sp, color: Colors.black),
                                  ),
                                ),
                              ],
                            ),
                            SizedBox(
                                height:
                                    MediaQuery.of(context).size.height / 15),
                            CustomButton(
                              width: 150.w,
                              height: 40.h,
                              color: kMainColor,
                              child: Center(
                                child: Text(
                                  'Sign In',
                                  style: GoogleFonts.roboto(
                                      color: kWhite, fontSize: 15.sp),
                                ),
                              ),
                              onTap: () {
                                try {
                                  LoginController.login(
                                      _emailTextCotroller.text,
                                      _passTextCotroller.text,
                                      context);
                                  AppPreferences.markLoggedIn();
                                } catch (e) {
                                  print(e);
                                }
                              },
                            ),
                            SizedBox(height: 10.h),
                            Text.rich(
                              TextSpan(
                                children: [
                                  TextSpan(
                                      text: "Don't have an account ?",
                                      style: GoogleFonts.roboto(
                                          fontSize: 10.sp,
                                          color: Colors.black)),
                                  TextSpan(
                                      recognizer: _tapRecognizer,
                                      text: " Sign Up",
                                      style: GoogleFonts.roboto(
                                          fontSize: 12.sp, color: kMainColor)),
                                ],
                              ),
                            ),
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
