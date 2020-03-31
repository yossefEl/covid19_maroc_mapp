import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';

class Radii {
  static const BorderRadiusGeometry k10pxRadius =
      BorderRadius.all(Radius.circular(10));
  static final globalContainerRadius = BorderRadius.only(
      bottomLeft: Radius.circular(35), bottomRight: Radius.circular(35));

      static final subAppsContainerRadius = BorderRadius.only(
      topLeft: Radius.circular(35), topRight: Radius.circular(35));

      static final profileImageRadius=BorderRadius.circular(10);
      
}
