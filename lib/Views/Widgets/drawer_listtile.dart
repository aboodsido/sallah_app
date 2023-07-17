import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/colors.dart';

class DrawerListTile extends StatelessWidget {
  const DrawerListTile({
    required this.onTap,
    required this.icon,
    required this.title,
  });

  final VoidCallback onTap;
  final IconData icon;
  final String title;
  @override
  Widget build(BuildContext context) {
    return ListTile(
      onTap: onTap,
      leading: Icon(
        icon,
        size: 25,
        color: kMainColor,
      ),
      title: Text(
        title,
        style: GoogleFonts.roboto(fontSize: 18.sp),
      ),
      trailing: Icon(
        Icons.arrow_forward_ios_outlined,
        size: 20,
        color: kBlack,
      ),
    );
  }
}
