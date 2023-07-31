import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/custom_button.dart';
import '../../Widgets/custom_container.dart';
import 'InnerScreens/contact_done_screen.dart';

class ContactUsScreen extends StatefulWidget {
  const ContactUsScreen({super.key});

  @override
  State<ContactUsScreen> createState() => _ContactUsScreenState();
}

class _ContactUsScreenState extends State<ContactUsScreen> {
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _phoneNumController = TextEditingController();
  final TextEditingController _suggestionController = TextEditingController();
  final TextEditingController _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _phoneNumController.dispose();
    _suggestionController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'Contact Us'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                SizedBox(height: 30.h),
                Padding(
                  padding: const EdgeInsets.all(10.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Contact Info : ',
                        style: GoogleFonts.roboto(
                            fontSize: 20.sp, color: kMainColor),
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.email_outlined,
                                color: kMainColor,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                'Saudi Arabia @gmail.com',
                                style: GoogleFonts.roboto(
                                    color: kBlack,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              Icon(
                                Icons.phone,
                                color: kMainColor,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                '5215654856922',
                                style: GoogleFonts.roboto(
                                    color: kBlack,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                        ],
                      ),
                      SizedBox(
                        height: 10.h,
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Row(
                            children: [
                              Icon(
                                Icons.phone_android_rounded,
                                color: kMainColor,
                              ),
                              SizedBox(width: 5.w),
                              Text(
                                '5215654856922',
                                style: GoogleFonts.roboto(
                                    color: kBlack,
                                    fontWeight: FontWeight.w300,
                                    letterSpacing: 0.5),
                              )
                            ],
                          ),
                          Row(
                            children: [
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.facebook,
                                  color: kMainColor,
                                ),
                                onPressed: () {},
                              ),
                              // SizedBox(width: 5.w),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.instagram,
                                  color: kMainColor,
                                ),
                                onPressed: () {},
                              ),
                              // SizedBox(width: 5.w),
                              IconButton(
                                icon: FaIcon(
                                  FontAwesomeIcons.twitter,
                                  color: kMainColor,
                                ),
                                onPressed: () {},
                              ),
                            ],
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                Card(
                  margin:
                      const EdgeInsets.symmetric(vertical: 20, horizontal: 20),
                  shape: OutlineInputBorder(
                    borderSide: BorderSide(width: 0, color: kWhite),
                    borderRadius: const BorderRadius.all(
                      Radius.circular(20),
                    ),
                  ),
                  elevation: 0,
                  color: kWhite,
                  child: SizedBox(
                    width: double.infinity,
                    child: Expanded(
                      child: Padding(
                        padding:
                            const EdgeInsets.only(top: 20, left: 20, right: 20),
                        child: Column(
                          children: [
                            Text('Contact Form',
                                style: GoogleFonts.roboto(
                                    fontSize: 20.sp, color: kMainColor)),
                            SizedBox(
                              height: 20.h,
                            ),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                obscure: false,
                                keyboardType: TextInputType.name,
                                controller: _nameController,
                                hintText: 'Full Name',
                                icon: Icons.person,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                controller: _emailController,
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
                                controller: _phoneNumController,
                                hintText: 'Phone Number',
                                icon: Icons.phone_android,
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
                                controller: _suggestionController,
                                hintText: 'Suggestion',
                                icon: Icons.wb_incandescent_sharp,
                                keyboardType: TextInputType.text,
                                obscure: false,
                              ),
                            ),
                            SizedBox(height: 20.h),
                            CustomContainer(
                              width: double.infinity,
                              height: 40.h,
                              color: Colors.transparent,
                              child: buildTextFormField(
                                controller: _messageController,
                                hintText: 'Message',
                                icon: Icons.message,
                                keyboardType: TextInputType.text,
                                obscure: false,
                              ),
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
                                  'Send',
                                  style: GoogleFonts.roboto(
                                      color: kWhite, fontSize: 15.sp),
                                ),
                              ),
                              onTap: () {
                                Navigator.pushReplacement(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const ContactDoneScreen()));
                              },
                            ),
                            SizedBox(height: 20.h),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
              ],
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
