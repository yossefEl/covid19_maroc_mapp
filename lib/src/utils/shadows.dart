import 'package:corona_fighter/src/utils/colors.dart';
import 'package:flutter/material.dart' show BoxShadow,Colors,Offset;


class Shadows {
  static final BoxShadow appBarShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  static final BoxShadow cardShadow = BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  static final bottomNavigationBarShadow=BoxShadow(
    color: Colors.black.withOpacity(0.1),
    offset: Offset(0, -3),
    blurRadius: 6,
  );
  static final  buttonShadow =BoxShadow(
    color: AppColors.lightPurple.withOpacity(0.2),
    offset: Offset(0, 3),
    blurRadius: 6,
  );
  
}