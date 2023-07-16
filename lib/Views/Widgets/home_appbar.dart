import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class HomeAppBar extends StatelessWidget {
  const HomeAppBar({super.key});

  @override
  AppBar build(BuildContext context) {
    return AppBar(
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
    );
  }
}
