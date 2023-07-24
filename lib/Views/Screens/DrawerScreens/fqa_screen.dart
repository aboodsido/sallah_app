import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:sallah_app/Views/Widgets/bground_image.dart';

import '../../Widgets/custom_appbar.dart';
import '../../Widgets/expansion_tile.dart';

class FQAScreen extends StatelessWidget {
  const FQAScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(50.h),
        child: CustomAppBar(appBarTitle: 'FQA'),
      ),
      body: const Stack(
        children: [
          BackgroundImage(),
          SingleChildScrollView(
            child: Column(
              children: [
                ExpansionTileWidget(),
                ExpansionTileWidget(),
                ExpansionTileWidget(),
                ExpansionTileWidget(),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
