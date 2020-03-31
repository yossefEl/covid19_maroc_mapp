import 'package:corona_fighter/src/home_page.dart';
import 'package:corona_fighter/src/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class SplashPage extends StatefulWidget {
  @override
  _SplashPageState createState() => _SplashPageState();
}

class _SplashPageState extends State<SplashPage> {
  @override
  void initState() {
    goHome();
  }

  void goHome() {
    Future.delayed(Duration(seconds: 2), () {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (_) =>  Directionality(
              textDirection: TextDirection.ltr,child: CoronaFightersHomePage())));
    });
  }

  @override
  Widget build(BuildContext context) {
    ConfigSize.init(context);
    return Scaffold(
      body: Container(
        alignment: Alignment.center,
        color: Colors.white,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: <Widget>[
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Image.asset(
                "assets/splash_icon.png",
                height: 100,
              ),
            ),
            Text("Built with 💓\n By Youssef ELMOUMEN",textAlign: TextAlign.center,style:GoogleFonts.montserrat().copyWith(fontSize:16,fontWeight:FontWeight.bold))
          ],
        ),
      ),
    );
  }
}
