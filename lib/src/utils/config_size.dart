import 'package:flutter/material.dart';

class ConfigSize {
  static MediaQueryData mediaQueryData;
  static double screenWidth;
  static double screenHeight;
  static BuildContext context;

  ConfigSize.init(BuildContext _context) {
    context=_context;
    mediaQueryData = MediaQuery.of(_context);
    screenHeight = mediaQueryData.size.height;
    screenWidth = mediaQueryData.size.width;
  }
}
