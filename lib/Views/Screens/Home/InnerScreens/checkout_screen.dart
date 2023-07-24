import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:flutter_svg/svg.dart';
import 'package:google_fonts/google_fonts.dart';
import '../../../Widgets/bground_image.dart';
import '../../../Widgets/custom_appbar.dart';
import '../../../Widgets/custom_button.dart';
import '../../../../constants/app_images.dart';
import '../../../../constants/colors.dart';

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
  final TextEditingController _discountController = TextEditingController();

  @override
  void dispose() {
    _addressController.dispose();
    _discountController.dispose();
    super.dispose();
  }

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
                  itemCount: 3,
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
                ),
                Padding(
                  padding:
                      EdgeInsets.symmetric(vertical: 10.h, horizontal: 20.w),
                  child: SizedBox(
                    height: 200.h,
                    child: Card(
                      elevation: 3,
                      color: const Color(0xffF0F5E0),
                      shape: const RoundedRectangleBorder(
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(20),
                          bottomLeft: Radius.circular(20),
                          bottomRight: Radius.circular(20),
                        ),
                      ),
                      child: Padding(
                        padding: const EdgeInsets.all(20),
                        child: Column(
                          children: [
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total : ',
                                  style: GoogleFonts.roboto(
                                      color: kGrey, fontSize: 14.sp),
                                ),
                                Text(
                                  '20\$',
                                  style: GoogleFonts.roboto(
                                      color: kMainColor, fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Discount : ',
                                  style: GoogleFonts.roboto(
                                      color: kGrey, fontSize: 14.sp),
                                ),
                                Text(
                                  '20\$',
                                  style: GoogleFonts.roboto(
                                      color: kMainColor, fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 10.h),
                            Divider(
                              thickness: 1,
                              color: kMainColor,
                            ),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceBetween,
                              children: [
                                Text(
                                  'Total : ',
                                  style: GoogleFonts.roboto(
                                      color: kGrey, fontSize: 14.sp),
                                ),
                                Text(
                                  '200\$',
                                  style: GoogleFonts.roboto(
                                      color: kMainColor, fontSize: 16.sp),
                                ),
                              ],
                            ),
                            SizedBox(height: 20.h),
                            Row(
                              mainAxisAlignment: MainAxisAlignment.spaceAround,
                              children: [
                                CustomButton(
                                  width: 120.w,
                                  height: 40.h,
                                  color: kMainColor,
                                  child: Text(
                                    'Order Now',
                                    style: GoogleFonts.roboto(
                                        color: kWhite, fontSize: 15.sp),
                                  ),
                                  onTap: () {
                                    showCustomDialog(
                                      context,
                                      buttonText: 'Go Home',
                                      desc:
                                          'Operation completed Order successfully',
                                      onTapButton: () {},
                                      image: Assets.imagesOrderDone,
                                    );
                                  },
                                ),
                                CustomButton(
                                  width: 120.w,
                                  height: 40.h,
                                  color: kMainColor,
                                  child: Text(
                                    'Discount',
                                    style: GoogleFonts.roboto(
                                        color: kWhite, fontSize: 15.sp),
                                  ),
                                  onTap: () {
                                    showCustomDialog(
                                      context,
                                      buttonText: 'Check',
                                      desc:
                                          'Please enter a valid code to get a discount .',
                                      onTapButton: () {
                                        showCustomDialog(context,
                                            desc:
                                                'The valid discount code will be 20% discount on total order',
                                            buttonText: 'Ok',
                                            onTapButton: () {},
                                            image: Assets.imagesDiscountDone);
                                      },
                                      title: 'Discount Code',
                                      discountField: CustomContainer(
                                        width: double.infinity,
                                        height: 40.h,
                                        color: Colors.transparent,
                                        child: TextFormField(
                                          controller: _discountController,
                                          decoration: InputDecoration(
                                            prefixIcon: Icon(
                                                Icons
                                                    .confirmation_number_outlined,
                                                color: kMainColor),
                                            hintText: 'Discount Code',
                                            hintStyle: GoogleFonts.roboto(
                                                fontSize: 16.sp, color: kBlack),
                                            border: const UnderlineInputBorder(
                                                borderSide: BorderSide.none),
                                          ),
                                        ),
                                      ),
                                    );
                                  },
                                ),
                              ],
                            ),
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

  void showCustomDialog(
    BuildContext context, {
    String? image,
    required String desc,
    Widget? discountField,
    required String buttonText,
    required VoidCallback onTapButton,
    String? title,
  }) {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          contentPadding: EdgeInsets.zero,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12.0),
          ),
          content: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(12.0),
            ),
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisSize: MainAxisSize.min,
              children: [
                if (title != null && title.isNotEmpty)
                  Padding(
                    padding: EdgeInsets.symmetric(vertical: 8.0.h),
                    child: Text(
                      title,
                      style: GoogleFonts.roboto(
                        fontSize: 20.sp,
                        color: const Color(0xffAECB1B),
                      ),
                    ),
                  ),
                if (image != null && image.isNotEmpty)
                  Padding(
                    padding: const EdgeInsets.symmetric(vertical: 16.0),
                    child: SvgPicture.asset(
                      image,
                      height: 80.h,
                      width: 80.w,
                    ),
                  ),
                Padding(
                  padding: EdgeInsets.symmetric(vertical: 8.0.h),
                  child: Text(
                    textAlign: TextAlign.center,
                    desc,
                    style: GoogleFonts.roboto(fontSize: 14.sp, color: kGrey),
                  ),
                ),
                const SizedBox(height: 16.0),
                discountField ?? Container(),
                const SizedBox(height: 16.0),
                CustomButton(
                  width: 120.w,
                  height: 35.h,
                  color: kMainColor,
                  onTap: onTapButton,
                  child: Text(
                    buttonText,
                    style: GoogleFonts.roboto(color: kWhite, fontSize: 15.sp),
                  ),
                ),
                const SizedBox(height: 16.0),
              ],
            ),
          ),
        );
      },
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
