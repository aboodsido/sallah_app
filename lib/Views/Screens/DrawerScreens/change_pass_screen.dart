import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/app_images.dart';
import '../../../constants/colors.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_container.dart';

class ChangePasswordScreen extends StatefulWidget {
  const ChangePasswordScreen({super.key});

  @override
  State<ChangePasswordScreen> createState() => _ChangePasswordScreenState();
}

class _ChangePasswordScreenState extends State<ChangePasswordScreen> {
  final TextEditingController _oldPassTextCotroller = TextEditingController();
  final TextEditingController _newPassTextCotroller = TextEditingController();
  final TextEditingController _confirmNewPassTextCotroller =
      TextEditingController();

  @override
  void dispose() {
    _oldPassTextCotroller.dispose();
    _newPassTextCotroller.dispose();
    _confirmNewPassTextCotroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'Change Password'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Card(
              margin: const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
              shape: OutlineInputBorder(
                borderSide: BorderSide(width: 0, color: kWhite),
                borderRadius: const BorderRadius.all(
                  Radius.circular(20),
                ),
              ),
              elevation: 5,
              color: kWhite,
              child: SizedBox(
                width: double.infinity,
                height: 425.h,
                child: Padding(
                  padding: const EdgeInsets.only(top: 50, left: 20, right: 20),
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
                          controller: _oldPassTextCotroller,
                          hintText: 'Old Password',
                          icon: Icons.lock_open_outlined,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomContainer(
                        width: double.infinity,
                        height: 40.h,
                        color: Colors.transparent,
                        child: buildTextFormField(
                          controller: _newPassTextCotroller,
                          hintText: 'New Password',
                          icon: Icons.lock_outline_rounded,
                          keyboardType: TextInputType.visiblePassword,
                          obscure: false,
                        ),
                      ),
                      SizedBox(height: 20.h),
                      CustomContainer(
                        width: double.infinity,
                        height: 40.h,
                        color: Colors.transparent,
                        child: buildTextFormField(
                          controller: _confirmNewPassTextCotroller,
                          hintText: 'Confirm Password',
                          icon: Icons.lock_reset_outlined,
                          keyboardType: TextInputType.visiblePassword,
                          obscure: false,
                        ),
                      ),
                      SizedBox(height: MediaQuery.of(context).size.height / 15),
                      CustomButton(
                        width: 150.w,
                        height: 40.h,
                        color: kMainColor,
                        child: Center(
                          child: Text(
                            'Change',
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
        ],
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
