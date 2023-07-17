import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'home_screen.dart';
import 'my_cart_screen.dart';
import 'offers_screen.dart';
import 'profile_screen.dart';
import '../../constants/colors.dart';

class CustomBottomNavigationBar extends StatefulWidget {
  @override
  _CustomBottomNavigationBarState createState() =>
      _CustomBottomNavigationBarState();
}

class _CustomBottomNavigationBarState extends State<CustomBottomNavigationBar> {
  int _selectedIndex = 0;

  final List<Widget> _pages = [
    HomeScreen(),
    ProfileScreen(),
    OffersScreen(),
    MyCartScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: _pages[_selectedIndex],
      bottomNavigationBar: BottomAppBar(
        child: SizedBox(
          height: 60.h,
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              _buildNavItem(0, Icons.home_outlined),
              _buildNavItem(1, Icons.person_2_outlined),
              _buildNavItem(2, Icons.discount_outlined),
              _buildFloatingNavItem(3, Icons.shopping_cart_outlined),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: SizedBox(
        height: 60,
        child: Column(
          children: [
            Stack(
              alignment: Alignment.topCenter,
              children: [
                Container(
                  width: 50.w,
                  height: 3.h,
                  color:
                      _selectedIndex == index ? kMainColor : Colors.transparent,
                ),
              ],
            ),
            const SizedBox(height: 10),
            Icon(
              icon,
              size: 30,
              color:
                  _selectedIndex == index ? kMainColor : kGrey.withOpacity(0.3),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildFloatingNavItem(int index, IconData icon) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedIndex = index;
        });
      },
      child: Transform.translate(
        offset: const Offset(0, -20),
        child: Stack(
          children: [
            Container(
              width: 50.w,
              height: 50.h,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.only(
                  topLeft: Radius.circular(140),
                  bottomLeft: Radius.circular(140),
                  bottomRight: Radius.circular(140),
                ),
                color: kMainColor,
              ),
              child: Icon(
                icon,
                color: Colors.white,
                size: 30,
              ),
            ),
            Visibility(
              visible: true,
              child: Positioned(
                right: 5,
                top: 5,
                child: Container(
                  width: 18.w,
                  height: 18.h,
                  decoration: const BoxDecoration(
                    shape: BoxShape.circle,
                    color: Colors.white,
                  ),
                  child: Padding(
                    padding: const EdgeInsets.all(2),
                    child: Center(
                      child: Text(
                        '5',
                        style: TextStyle(color: kMainColor, fontSize: 10.sp),
                      ),
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
