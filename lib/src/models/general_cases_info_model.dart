import 'package:firebase_database/firebase_database.dart';

class GeneralCasesInfoModel {
  int totalCases = 0;
  int activeCases = 0;
  int deaths = 0;
  int recovered = 0;
  GeneralCasesInfoModel() {
    totalCases = 0;
    activeCases = 0;
    deaths = 0;
    recovered = 0;
  }
  GeneralCasesInfoModel.fromSnapShot(DataSnapshot snapshot) {
    totalCases = snapshot.value['total'];
    deaths = snapshot.value['deaths'];
    recovered = snapshot.value['recovered'];
    activeCases = totalCases-(deaths+recovered);
  }
}
