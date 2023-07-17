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
                DrawerListTile(
                  icon: Icons.language,
                  onTap: () {},
                  title: 'Change Languages',
                ),
                DrawerListTile(
                  icon: Icons.lock_reset_outlined,
                  onTap: () {},
                  title: 'Change Password',
                ),
                DrawerListTile(
                  icon: Icons.location_on_outlined,
                  onTap: () {},
                  title: 'Change Country',
                ),
                DrawerListTile(
                  icon: Icons.feedback_outlined,
                  onTap: () {},
                  title: 'About us',
                ),
                DrawerListTile(
                  icon: Icons.support_agent_outlined,
                  onTap: () {},
                  title: 'Contact us',
                ),
                DrawerListTile(
                  icon: Icons.share_sharp,
                  onTap: () {},
                  title: 'Share App',
                ),
                DrawerListTile(
                  icon: Icons.contact_support_outlined,
                  onTap: () {},
                  title: 'FQA',
                ),
                DrawerListTile(
                  icon: Icons.library_books_outlined,
                  onTap: () {},
                  title: 'Terms of use',
                ),
                DrawerListTile(
                  icon: Icons.privacy_tip_outlined,
                  onTap: () {},
                  title: 'Privacy Policy',
                ),
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
