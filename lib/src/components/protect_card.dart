import 'package:corona_fighter/src/utils/values.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class ProtectCard extends StatelessWidget {

  final String title;
  final String description;
  final String icon;

  const ProtectCard({
    Key key,
    this.title,
    
    this.icon, this.description,
  }) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(16),
      margin: EdgeInsets.all(8),
      decoration: BoxDecoration(
          color: Colors.white,
          borderRadius: BorderRadius.circular(15),
          boxShadow: [Shadows.cardShadow]),
      child: Column(
        children: <Widget>[
          Image.asset(
            icon,
            
            height: 90,
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Text(
              title,
              style: TextStyle(color: AppColors.darkPurple, fontSize: 18,fontWeight: FontWeight.bold),
            ),
          ),
          Text(
            description ?? "error occupurple",
            textAlign: TextAlign.center,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 18,
              
            ),
          ),
        ],
      ),
    );
  }
}
