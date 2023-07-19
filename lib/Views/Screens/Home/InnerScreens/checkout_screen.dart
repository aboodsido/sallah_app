import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';
import 'package:sallah_app/Views/Widgets/custom_appbar.dart';
import 'package:sallah_app/constants/colors.dart';

import '../../../Widgets/checkout_item.dart';
import '../../../Widgets/custom_container.dart';

class CheckoutScreen extends StatefulWidget {
  const CheckoutScreen({super.key});

  @override
  State<CheckoutScreen> createState() => _CheckoutScreenState();
}

class _CheckoutScreenState extends State<CheckoutScreen> {
  String? selectedItem;
  List<String> cities = [
    'Gaza',
    'Nusiratt',
    'Rafah',
    'Jabalia',
    'Khan Yunis',
    'Beit Hanoun',
    'Ramallah',
    'Al Qudis'
  ];

  final TextEditingController _addressController = TextEditingController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'Checkout'),
      ),
      body: Stack(
        children: [
          const BackgroundImage(),
          SingleChildScrollView(
            physics: const BouncingScrollPhysics(),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 30.h),
                  child: Text(
                    'Products :',
                    style: GoogleFonts.roboto(fontSize: 17.sp),
                  ),
                ),
                ListView.builder(
                  shrinkWrap: true,
                  physics: const BouncingScrollPhysics(),
                  itemBuilder: (context, index) {
                    return const CheckoutItemWidget();
                  },
                  itemCount: 5,
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(horizontal: 20.w, vertical: 15.h),
                  child: Row(
                    children: [
                      Text(
                        'Phone Number : ',
                        style:
                            GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                      ),
                      Text(
                        '+970 568843787',
                        style:
                            GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                      ),
                    ],
                  ),
                ),
                Padding(
                  padding: EdgeInsets.symmetric(horizontal: 20.w),
                  child: Text(
                    'Address :',
                    style: GoogleFonts.roboto(fontSize: 17.sp),
                  ),
                ),
                SizedBox(height: 20.h),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, bottom: 20.h),
                  child: InkWell(
                    onTap: showCitiesDialog,
                    child: CustomContainer(
                      width: 280.w,
                      height: 45.h,
                      color: Colors.transparent,
                      child: Padding(
                        padding: const EdgeInsets.symmetric(
                          vertical: 8,
                          horizontal: 20,
                        ),
                        child: Row(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          children: [
                            Row(
                              children: [
                                Icon(
                                  Icons.location_city,
                                  color: kMainColor,
                                ),
                                const SizedBox(width: 10),
                                Text(
                                  selectedItem ?? 'City',
                                  style: GoogleFonts.roboto(fontSize: 15.sp),
                                ),
                              ],
                            ),
                            Icon(
                              Icons.arrow_forward_ios_rounded,
                              color: kMainColor,
                              size: 15,
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),
                Padding(
                  padding: EdgeInsets.only(left: 40.w, bottom: 20.h),
                  child: CustomContainer(
                    width: 280.w,
                    height: 45.h,
                    color: Colors.transparent,
                    child: TextFormField(
                      controller: _addressController,
                      decoration: InputDecoration(
                        prefixIcon: Icon(Icons.location_on, color: kMainColor),
                        hintText: 'Address',
                        hintStyle:
                            GoogleFonts.roboto(fontSize: 16.sp, color: kBlack),
                        border: const UnderlineInputBorder(
                            borderSide: BorderSide.none),
                      ),
                    ),
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Future<void> showCitiesDialog() {
    return showDialog(
      context: context,
      builder: (context) {
        return AlertDialog(
          backgroundColor: const Color.fromARGB(255, 227, 236, 227),
          content: SizedBox(
            width: 50.w,
            height: 200.h,
            child: ListView.builder(
              itemCount: cities.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: const EdgeInsets.only(bottom: 15),
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedItem = cities[index];
                      });
                      Navigator.canPop(context) ? Navigator.pop(context) : null;
                    },
                    child: Text(
                      cities[index],
                    ),
                  ),
                );
              },
            ),
          ),
        );
      },
    );
  }
}
