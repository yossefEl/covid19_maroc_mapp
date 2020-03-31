import 'package:corona_fighter/src/home_page.dart';
import 'package:corona_fighter/src/splash_page.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',

      theme: ThemeData(
        textTheme: GoogleFonts.tajawalTextTheme(),
        primarySwatch: Colors.purple,
      ),
      home: SplashPage(),
    );
  }
}
