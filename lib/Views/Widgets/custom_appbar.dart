import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class CustomAppBar extends StatelessWidget {
  CustomAppBar({
    super.key,
    required this.appBarTitle,
    this.actionsWidget,
  });

  final String appBarTitle;
  final Widget? actionsWidget;

  @override
  Widget build(BuildContext context) {
    return AppBar(
      title: Text(
        appBarTitle,
        style: GoogleFonts.roboto(fontSize: 20.sp),
      ),
      centerTitle: true,
      backgroundColor: kMainColor,
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.only(
          bottomLeft: Radius.circular(25),
          bottomRight: Radius.circular(25),
        ),
      ),
      actions: [
        actionsWidget == null ? Container() : actionsWidget!,
      ],
    );
  }
}
