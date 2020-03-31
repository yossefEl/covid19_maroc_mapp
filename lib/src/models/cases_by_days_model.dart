import 'package:firebase_database/firebase_database.dart';

class CasesByDaysModel {
  String id;
  String dayMonth;
  int casesCount;

  CasesByDaysModel.fromSnapshot(DataSnapshot snapshot) {
    id = snapshot.key;
    dayMonth = snapshot.value['daymt'];
    casesCount = snapshot.value['cases'];
  }
}
