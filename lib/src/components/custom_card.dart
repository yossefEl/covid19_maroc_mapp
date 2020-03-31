import 'package:corona_fighter/src/utils/values.dart';
import 'package:flutter/material.dart';

class StatisticsCard extends StatelessWidget {
  final Widget child;


  const StatisticsCard({Key key, this.child,}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      child: Container(
        padding: EdgeInsets.all(8),
        margin: EdgeInsets.all(8),
        decoration: BoxDecoration(
            color: Colors.white,
            borderRadius: BorderRadius.circular(15),
            boxShadow: [Shadows.cardShadow]),
            child: child
      ),
      
    );
  }
}
