import 'package:flutter/material.dart';

class ScreenSize {
  static getWidth(context) {
    return MediaQuery.of(context).size.width;
  }

  static getHeight(context) {
    return MediaQuery.of(context).size.height;
  }
}
