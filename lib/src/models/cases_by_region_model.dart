import 'package:firebase_database/firebase_database.dart';

class CasesByRegionModel {
  String id;
  String region;
  int casesCount;
  int lowValue=0;

  CasesByRegionModel.fromSnapshot(DataSnapshot snapshot) {
    id=snapshot.key;
    // print(snapshot.value['region']);
    region = snapshot.value['region'];
    casesCount = snapshot.value['cases'];
  }
}
