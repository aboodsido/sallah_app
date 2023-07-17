import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/screen_size.dart';
import '../Widgets/custom_button.dart';
import '../Widgets/custom_container.dart';

class ForgotPassScreen extends StatefulWidget {
  const ForgotPassScreen({super.key});

  @override
  State<ForgotPassScreen> createState() => _ForgotPassScreenState();
}

class _ForgotPassScreenState extends State<ForgotPassScreen> {
  final TextEditingController _passTextCotroller = TextEditingController();

  @override
  void dispose() {
    _passTextCotroller.dispose();
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
              Image.asset(
                Assets.imagesBground,
                fit: BoxFit.cover,
                width: MediaQuery.of(context).size.width,
                height: MediaQuery.of(context).size.height,
              ),
              SizedBox(
                width: MediaQuery.of(context).size.width,
                child: Image.asset(
                  Assets.imagesAppBarShape,
                  fit: BoxFit.fill,
                  width: double.infinity,
                  height: 244.h,
                ),
              ),
              Positioned(
                left: 10.w,
                top: 30.h,
                child: IconButton(
                  onPressed: () => Navigator.pop(context),
                  icon: Icon(
                    Icons.arrow_back_ios_new,
                    color: kWhite,
                  ),
                ),
              ),
              Container(
                margin: EdgeInsets.only(left: 20.w, right: 20.w),
                child: Center(
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
                      height: 400.h,
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
                            SizedBox(height: 20.h),
                            Text(
                              'Forgot Password',
                              style: GoogleFonts.roboto(
                                  color: kGrey, fontSize: 17.sp),
                            ),
                            SizedBox(height: 60.h),
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
                            SizedBox(height: 50.h),
                            CustomButton(
                              width: 150.w,
                              height: 40.h,
                              color: kMainColor,
                              child: Center(
                                child: Text(
                                  'Resend',
                                  style: GoogleFonts.roboto(
                                      color: kWhite, fontSize: 15.sp),
                                ),
                              ),
                              onTap: () {},
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
