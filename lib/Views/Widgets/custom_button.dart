// ignore_for_file: prefer_const_constructors_in_immutables
import 'package:flutter/material.dart';

import '../../constants/colors.dart';

class CustomButton extends StatelessWidget {
  // ignore: use_key_in_widget_constructors
  CustomButton(
      {required this.width,
      required this.height,
      required this.color,
      required this.child,
      required this.onTap});

  final double width;
  final double height;
  final Color color;
  final Widget child;
  final VoidCallback onTap;

  @override
  Widget build(BuildContext context) {
    return Material(
      elevation: 3,
      borderRadius: const BorderRadius.only(
          topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
      child: InkWell(
        onTap: onTap,
        child: Container(
          width: width,
          height: height,
          decoration: BoxDecoration(
            color: color,
            border: Border.all(color: kMainColor),
            borderRadius: const BorderRadius.only(
                topRight: Radius.circular(25), bottomLeft: Radius.circular(25)),
          ),
          child: Center(child: child),
        ),
      ),
    );
  }
}
