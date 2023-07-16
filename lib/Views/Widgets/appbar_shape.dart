import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';

import '../../constants/app_images.dart';

class AppbarShape extends StatelessWidget {
  const AppbarShape({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Image.asset(
        Assets.imagesAppBarShape,
        fit: BoxFit.fill,
        width: double.infinity,
        height: 244.h,
      ),
    );
  }
}
