import 'package:corona_fighter/src/components/call_card.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class CallView extends StatefulWidget {
  @override
  _CallViewState createState() => _CallViewState();
}

class _CallViewState extends State<CallView> {
  @override
  Widget build(BuildContext context) {
    return Container(
      child: ListView(
        physics: BouncingScrollPhysics(),
        children: <Widget>[
          CallCard(
            icon: FontAwesomeIcons.skullCrossbones,
            title: "مركز مكافحة التسمم",
            numberTocall: "08 01 00 01 80",
          ),
          CallCard(
            icon: FontAwesomeIcons.building,
            title: "المساعدة العالمية",
            numberTocall: "05 22 26 20 62",
          ),
          CallCard(
            icon: FontAwesomeIcons.vial,
            title: "ألو يقظة",
            numberTocall: "08 01 00 47 47",
          ),
          CallCard(
            icon: FontAwesomeIcons.briefcaseMedical,
            title: "أطباء المغرب SOS",
            numberTocall: "05 22 98 98 98",
          ),
          CallCard(
            icon: FontAwesomeIcons.exclamationCircle,
            title: "المساعدة الطبية الاستعجالية",
            numberTocall: "141",
          ),
          CallCard(
            icon: FontAwesomeIcons.fireExtinguisher,
            title: "الإطفاء",
            numberTocall: "150",
          ),
          CallCard(
            icon: FontAwesomeIcons.ambulance,
            title: "الإسعاف",
            numberTocall: "150",
          ),
          CallCard(
            icon: FontAwesomeIcons.info,
            title: "معلومات",
            numberTocall: "160",
          ),
          CallCard(
            icon: FontAwesomeIcons.userShield,
            title: "الدرك الملكي",
            numberTocall: "177",
          ),
          CallCard(
            icon: FontAwesomeIcons.userShield,
            title: "الشرطة",
            numberTocall: "190",
          ),
        ],
      ),
    );
  }
}
