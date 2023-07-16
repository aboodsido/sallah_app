import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sallah_app/constants/app_images.dart';
import 'package:sallah_app/constants/colors.dart';

class ImageProfileBorder extends StatelessWidget {
  const ImageProfileBorder({super.key, required this.isEditScreen});

  final bool? isEditScreen;

  @override
  Widget build(BuildContext context) {
    return Stack(
      alignment: Alignment.center,
      children: [
        Container(
          width: 200.w,
          height: 190.h,
          decoration: ShapeDecoration(
            shape: const OvalBorder(),
            color: const Color(0xffF8FCF7).withOpacity(0.5),
          ),
        ),
        Container(
          width: 175.w,
          height: 165.h,
          decoration: ShapeDecoration(
            shape: const OvalBorder(),
            color: const Color(0xffF8FCF7).withOpacity(0.7),
          ),
        ),
        Container(
          width: 150.w,
          height: 140.h,
          decoration: const ShapeDecoration(
            shape: OvalBorder(),
            image: DecorationImage(
              image: AssetImage(Assets.imagesMe),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Visibility(
          visible: isEditScreen!,
          child: Positioned(
            right: 10.w,
            top: 20.h,
            child: GestureDetector(
              onTap: () {
                print('hello from here');
              },
              child: Container(
                width: 30.w,
                height: 28.h,
                decoration: const ShapeDecoration(
                  shape: OvalBorder(),
                  color: Colors.white,
                ),
                child: Icon(
                  Icons.edit,
                  color: kMainColor,
                ),
              ),
            ),
          ),
        )
      ],
    );
  }
}
