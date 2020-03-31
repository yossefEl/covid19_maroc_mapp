import 'package:corona_fighter/src/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:intent/action.dart' as action;
import 'package:intent/intent.dart' as intent;
// import 'package:url_launcher/url_launcher./dart';

class CallCard extends StatelessWidget {
  // final Widget child;
  final String title;
  final String numberTocall;
  final IconData icon;

  const CallCard({
    Key key,
    this.title,
    this.numberTocall,
    this.icon,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      borderRadius: BorderRadius.circular(15),
      onTap: () {
         callNumber(numberTocall);
      },
      child: Container(
        padding: EdgeInsets.all(16),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [Shadows.cardShadow]),
        child: Column(
          children: <Widget>[
            Icon(
              icon,
              color: Colors.purple,
              size: 45,
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Text(
                title,
                style: TextStyle(color: AppColors.darkPurple, fontSize: 18),
              ),
            ),
            Directionality(
              textDirection: TextDirection.ltr,
              child: Text(
                numberTocall ?? "error occupurple",
                style: TextStyle(
                  color: AppColors.lightPurple,
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }

  callNumber(String number) {
    intent.Intent()
      ..setAction(action.Action.ACTION_DIAL)
      ..setData(Uri(scheme: 'tel', path: number ?? '08 01 00 47 47'))
      ..startActivity().catchError((e) => print(e));
  }
}
