import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../constants/app_images.dart';
import '../../constants/colors.dart';
import '../../constants/screen_size.dart';
import 'drawer_listtile.dart';

class MainDrawer extends StatelessWidget {
  const MainDrawer({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Drawer(
      shape: const OutlineInputBorder(
        borderSide: BorderSide.none,
        borderRadius: BorderRadius.only(
          topRight: Radius.circular(20),
          bottomRight: Radius.circular(20),
        ),
      ),
      child: Stack(
        children: [
          SvgPicture.asset(
            Assets.imagesDrawerShape,
          ),
          Container(
            width: ScreenSize.getWidth(context),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 30.h),
                Text(
                  'Menu',
                  style: GoogleFonts.roboto(
                    color: kMainColor,
                    fontSize: 22.sp,
                  ),
                ),
                SizedBox(height: 10.h),
                DrawerListTile(
                  icon: Icons.shopping_bag_outlined,
                  onTap: () {},
                  title: 'My Orders',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.language,
                  onTap: () {},
                  title: 'Change Languages',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.lock_reset_outlined,
                  onTap: () {},
                  title: 'Change Password',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.location_on_outlined,
                  onTap: () {},
                  title: 'Change Country',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.feedback_outlined,
                  onTap: () {},
                  title: 'About us',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.support_agent_outlined,
                  onTap: () {},
                  title: 'Contact us',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.share_sharp,
                  onTap: () {},
                  title: 'Share App',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.contact_support_outlined,
                  onTap: () {},
                  title: 'FQA',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.library_books_outlined,
                  onTap: () {},
                  title: 'Terms of use',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                  title: 'Privacy Policy',
                ),
                SizedBox(height: 5.h),
                DrawerListTile(
                  icon: Icons.logout_rounded,
                  onTap: () {},
                  title: 'Logout',
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}