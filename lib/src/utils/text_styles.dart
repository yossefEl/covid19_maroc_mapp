import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Styles {
  static final knowViewSectionTitle = GoogleFonts.tajawal()
      .copyWith(fontWeight: FontWeight.bold, color: Colors.redAccent);
  static final chartTileStyle = ChartTextStyle(
    color: Colors.purple,
    fontSize: 16,
    fontWeight: FontWeight.bold,
    fontFamily: GoogleFonts.tajawal().fontFamily,
  );
}
