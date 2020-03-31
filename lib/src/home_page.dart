import 'dart:async';
import 'package:corona_fighter/src/models/cases_by_days_model.dart';
import 'package:corona_fighter/src/models/cases_by_region_model.dart';
import 'package:corona_fighter/src/models/general_cases_info_model.dart';
import 'package:corona_fighter/src/utils/values.dart';
import 'package:corona_fighter/src/views/about_view.dart';
import 'package:corona_fighter/src/views/analyse_view.dart';
import 'package:corona_fighter/src/views/call_view.dart';
import 'package:corona_fighter/src/views/know_view.dart';
import 'package:corona_fighter/src/views/news_view.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_messaging/firebase_messaging.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:google_fonts/google_fonts.dart';
import 'models/news_model.dart';

class CoronaFightersHomePage extends StatefulWidget {
  @override
  _CoronaFightersHomePageState createState() => _CoronaFightersHomePageState();
}

class _CoronaFightersHomePageState extends State<CoronaFightersHomePage>
    with TickerProviderStateMixin {
  TabController tabController;
  int currentIndex = 0;
  StreamSubscription<Event> _onNewsAddedSubscription;
  StreamSubscription<Event> _onNewsChangedSubscription;
  //general info
  StreamSubscription<Event> _onGeneralInfoAddedSubscription;
  StreamSubscription<Event> _onGeneralInfoChangedSubscription;

  //cases by days
  StreamSubscription<Event> _onCasesByDaysAddedSubscription;
  StreamSubscription<Event> _onCasesByDaysChangedSubscription;

  //cases by regions
  StreamSubscription<Event> _onCasesByRegionsAddedSubscription;
  StreamSubscription<Event> _onCasesByRegionsChangedSubscription;

  List<NewsModel> news = List<NewsModel>();
  List<CasesByDaysModel> casesByDays = List<CasesByDaysModel>();
  List<GeneralCasesInfoModel> generalInfos = List<GeneralCasesInfoModel>();
  List<CasesByRegionModel> casesByRegions = List<CasesByRegionModel>();
  final newsReference = FirebaseDatabase.instance.reference().child('news');
  final casesByDaysReference =
      FirebaseDatabase.instance.reference().child('CasesByDays');
  final casesByRegionsReference =
      FirebaseDatabase.instance.reference().child('CasesbyRegions');
  final generalInfoReference =
      FirebaseDatabase.instance.reference().child('CasesGeneralInfo');

  //firebase messaging init
  final FirebaseMessaging _firebaseMessaging = FirebaseMessaging();
  bool _initialized = false;

  @override
  void initState() {
    super.initState();
    tabController = TabController(length: 5, vsync: this);

    try {
      _onNewsAddedSubscription =
          newsReference.onChildAdded.listen(_onNewsAdded);
      _onNewsChangedSubscription =
          newsReference.onChildChanged.listen(_onNewsUpdated);
    } catch (e) {
      print(e.toString());
    }

    //general info
    try {
      _onGeneralInfoAddedSubscription =
          generalInfoReference.onChildAdded.listen(_onGeneralInfoAdded);
      _onGeneralInfoChangedSubscription =
          generalInfoReference.onChildChanged.listen(_onGeneralInfoChanged);
    } catch (e) {
      print(e.toString());
    }

    //casesByDays
    try {
      _onCasesByDaysAddedSubscription =
          casesByDaysReference.onChildAdded.listen(_onCasesByDaysAdded);
      _onCasesByDaysChangedSubscription =
          casesByDaysReference.onChildChanged.listen(_onCasesByDaysUpdated);
    } catch (e) {
      print(e.toString());
    }
    //cases by regions
    try {
      _onCasesByRegionsAddedSubscription =
          casesByRegionsReference.onChildAdded.listen(_onCasesByRegionsAdded);
      _onCasesByRegionsChangedSubscription = casesByRegionsReference
          .onChildChanged
          .listen(_onCasesByRegionsUpdated);
    } catch (e) {
      print(e.toString());
    }



    
  }

  // firebase messaging
  Future<void> init() async {
    if (!_initialized) {
      // For iOS request permission first.
      _firebaseMessaging.requestNotificationPermissions();
      _firebaseMessaging.configure();

      // For testing purposes print the Firebase Messaging token
      String token = await _firebaseMessaging.getToken();
      print("FirebaseMessaging token: $token");
      
      _initialized = true;
    }
  }

  //news

  void _onNewsAdded(Event event) {
  
    setState(() {
    
      news.add(NewsModel.fromSnapShot(event.snapshot));
    });
  }

  void _onNewsUpdated(Event event) {
    var oldNewsValue =
        news.singleWhere((news) => news.getID == event.snapshot.key);
    setState(() {
      news[news.indexOf(oldNewsValue)] = NewsModel.fromSnapShot(event.snapshot);
    });
  }

  //generalInfo
  void _onGeneralInfoAdded(Event event) {
    setState(() {
      generalInfos.add(GeneralCasesInfoModel.fromSnapShot(event.snapshot));
    });
  }

  void _onGeneralInfoChanged(Event event) {
    setState(() {
      generalInfos[0] = GeneralCasesInfoModel.fromSnapShot(event.snapshot);
    });
  }

  //cases by days

  void _onCasesByDaysAdded(Event event) {
   setState(() {
     
      casesByDays.add(CasesByDaysModel.fromSnapshot(event.snapshot));
   });
  }

  void _onCasesByDaysUpdated(Event event) {
    var oldCasesByDayValue =
        casesByDays.singleWhere((cd) => cd.id == event.snapshot.key);
    setState(() {
      casesByDays[casesByDays.indexOf(oldCasesByDayValue)] =
          CasesByDaysModel.fromSnapshot(event.snapshot);
    });
  }

  //cases by regions

  void _onCasesByRegionsAdded(Event event) {
    print("region ${event.snapshot.value['region']} :\t ${event.snapshot.value['cases']}");
    setState(() {
      casesByRegions.add(CasesByRegionModel.fromSnapshot(event.snapshot));
    });
  }

  void _onCasesByRegionsUpdated(Event event) {
    var oldCasesByRegionValue =
        casesByRegions.singleWhere((cr) => cr.id == event.snapshot.key);
    setState(() {
      casesByRegions[casesByRegions.indexOf(oldCasesByRegionValue)] =
          CasesByRegionModel.fromSnapshot(event.snapshot);
    });
  }

  @override
  Widget build(BuildContext context) {
    print(casesByRegions.length);
    return Directionality(
      textDirection: TextDirection.rtl,
      child: Scaffold(
        backgroundColor: AppColors.lightGrey,
        appBar: AppBar(
          backgroundColor: Colors.white,
          centerTitle: true,
          title: Text("#معا ضد كوفيد19",
              style: GoogleFonts.tajawal()
                  .copyWith(color: Colors.purple, fontWeight: FontWeight.bold)),
        ),
        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Colors.white,
          elevation: 40,
          type: BottomNavigationBarType.fixed,
          currentIndex: currentIndex,
          unselectedItemColor: Colors.purple
          // .purple.withOpacity(0.4)
          ,
          selectedItemColor: AppColors.lightPurple,
          onTap: (index) {
            setState(() {
              currentIndex = index;
              tabController.animateTo(currentIndex);
            });
          },
          selectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          unselectedLabelStyle: TextStyle(fontWeight: FontWeight.bold),
          items: [
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.chartPie,
                  size: 20,
                ),
                title: Text(
                  "إحصائيات",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.newspaper,
                  size: 20,
                ),
                title: Text(
                  "مستجدات",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.phoneAlt,
                  size: 20,
                ),
                title: Text(
                  "أرقام",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.brain,
                  size: 20,
                ),
                title: Text(
                  "اعرف",
                )),
            BottomNavigationBarItem(
                icon: Icon(
                  FontAwesomeIcons.infoCircle,
                  size: 20,
                ),
                title: Text(
                  "حول",
                )),
          ],
        ),
        body: TabBarView(
            physics: NeverScrollableScrollPhysics(),
            controller: tabController,
            children: [
              AnalyticsView(
                casesByRegions: casesByRegions,
                casesBysDays: casesByDays,
                generalCasesInfoModel: generalInfos,
              ),
              NewsView(news: news),
              CallView(),
              ProtectSelfView(),
              AboutView()
            ]),
      ),
    );
  }
}
