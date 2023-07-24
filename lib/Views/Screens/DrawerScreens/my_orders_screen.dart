import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';

import '../../../constants/colors.dart';
import '../../Widgets/bground_image.dart';
import '../../Widgets/custom_appbar.dart';
import '../../Widgets/order_card.dart';

class MyOrdersScreen extends StatefulWidget {
  const MyOrdersScreen({super.key});

  @override
  State<MyOrdersScreen> createState() => _MyOrdersScreenState();
}

class _MyOrdersScreenState extends State<MyOrdersScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'My Orders'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          DefaultTabController(
            length: 2,
            child: Padding(
              padding: EdgeInsets.symmetric(horizontal: 20.w),
              child: Column(
                children: [
                  SizedBox(height: 10.h),
                  Container(
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(30.0),
                      boxShadow: [
                        BoxShadow(
                          color: Colors.grey.withOpacity(0.5),
                          spreadRadius: 0,
                          blurRadius: 2,
                          offset: const Offset(2, 3),
                        ),
                      ],
                      color: kWhite,
                    ),
                    child: TabBar(
                      labelStyle: GoogleFonts.roboto(fontSize: 15.sp),
                      labelColor: kWhite,
                      unselectedLabelColor: kMainColor,
                      indicator: BoxDecoration(
                        borderRadius: BorderRadius.circular(30.0),
                        boxShadow: [
                          BoxShadow(
                            color: Colors.grey.withOpacity(.2),
                            spreadRadius: 0,
                            blurRadius: 2,
                            offset: const Offset(2, 3),
                          ),
                        ],
                        color: kMainColor,
                      ),
                      tabs: const [
                        Tab(
                          child: Center(
                            child: Text(
                              'Open Orders',
                            ),
                          ),
                        ),
                        Tab(
                          child: Center(
                            child: Text(
                              'Completed Orders',
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  SizedBox(height: 10.h),
                  Expanded(
                    child: TabBarView(
                      physics: const BouncingScrollPhysics(),
                      children: [
                        ListView.builder(
                          physics: const BouncingScrollPhysics(),
                          itemCount: 10,
                          itemBuilder: (context, index) {
                            return const OrderCardWidget();
                          },
                        ),
                        const Center(
                          child: Text('Completed Orders Content'),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
