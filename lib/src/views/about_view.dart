import 'package:corona_fighter/src/utils/config_size.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:intent/intent.dart' as android_intent;
import 'package:intent/action.dart' as android_action;
import 'package:intent/extra.dart' as android_extra;

class AboutView extends StatefulWidget {
  @override
  _AboutViewState createState() => _AboutViewState();
}

class _AboutViewState extends State<AboutView> {
  @override
  Widget build(BuildContext context) {
    return Container(
        child: ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: ActionBox(
            title: "قيم التطبيق",
            icon: FontAwesomeIcons.starHalfAlt,
            action: () {
              android_intent.Intent()
                ..setAction(android_action.Action.ACTION_SHOW_APP_INFO)
                ..putExtra(android_extra.Extra.EXTRA_PACKAGE_NAME,
                    "cma.corona.fighters.morocco")
                ..startActivity().catchError((e) => print(e));
            },
          ),
        ),
        ActionBox(
            title: "شارك التطبيق..شارك في التوعية",
            icon: FontAwesomeIcons.shareAlt,
            action: () {
              android_intent.Intent()
                ..setAction(android_action.Action.ACTION_SEND)
                ..setType('text/plain')
                ..putExtra(android_extra.Extra.EXTRA_TEXT,
                    ' :كل ما يتعلق بكوفيد19 المغرب ...شارك التطبيق..شارك في التوعية play.google.com/?id=ma.corona.fighters.morocco')
                ..startActivity().catchError((e) => print(e));
            }),
        ActionBox(
            title: "حول التطبيق",
            icon: FontAwesomeIcons.infoCircle,
            action: () {
              showDialog(
                  context: context,
                  barrierDismissible: true,
                  builder: (context) => Dialog(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(10)),
                        child: Container(
                          height: ConfigSize.screenHeight * 0.6,
                          width: ConfigSize.screenWidth * 0.9,

                          decoration: BoxDecoration(
                            color: Colors.white,
                            borderRadius: BorderRadius.circular(10),
                          ),
                          child: ListView(
                            physics:BouncingScrollPhysics(),
                            shrinkWrap: true,
                            children: <Widget>[
                              Container(
                                child: ListView(
                                  shrinkWrap: true,
                                  physics: BouncingScrollPhysics(),
                                  padding: EdgeInsets.all(10),
                                  children: <Widget>[
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Icon(
                                        FontAwesomeIcons.info,
                                        size: 40,
                                        color: Colors.purpleAccent,
                                      ),
                                    ),
                                    Padding(
                                      padding: const EdgeInsets.all(8.0),
                                      child: Text(
                                        "حول التطبيق",
                                        style: TextStyle(
                                            fontWeight: FontWeight.bold,
                                            fontSize: 18),
                                        textAlign: TextAlign.center,
                                      ),
                                    ),
                                    Text(
                                      "تم تطوير هذا التطبيق للتوعية والتحسيس بمرض كوفيد19 بالإضافةإلى تسهيل الوصول للمعلومة وارقام الطوارئ\n المطور:يوسف المومن\n القائم على المحتوى: الحسين الحاج",
                                      textAlign: TextAlign.center,
                                    ),
                                    // Padding(
                                    //   padding: const EdgeInsets.all(8.0),
                                    //   child: InkWell(
                                        
                                    //     onTap: () {
                                    //       android_intent.Intent()
                                    //         ..setAction(
                                    //             android_action.Action.ACTION_VIEW)
                                    //         ..setData(Uri(
                                    //             scheme: "https",
                                    //             path: "github.com"))
                                    //         ..startActivity()
                                    //             .catchError((e) => print(e));
                                    //     },
                                    //     child: Row(
                                    //       mainAxisAlignment: MainAxisAlignment.center,
                                    //       children: <Widget>[
                                            
                                            
                                    //         // Text(
                                    //         //   " github التطبيق على",
                                    //         //   textAlign: TextAlign.center,
                                    //         // ),
                                    //         // SizedBox(width: 10,),
                                    //         // Icon(Icons.open_in_browser),
                                    //       ],
                                    //     ),
                                    //   ),
                                    // )
                                  ],
                                ),
                              ),
                              Align(
                                alignment: Alignment.bottomCenter,
                                child: FlatButton(
                                    shape: RoundedRectangleBorder(
                                        borderRadius:
                                            BorderRadiusDirectional.circular(
                                                15)),
                                    color: Colors.purple,
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: Text(
                                      "!حسنا",
                                      style: TextStyle(color: Colors.white),
                                    )),
                              )
                            ],
                          ),
                        ),
                      ));
            }),
        ActionBox(
            title: "راسلني",
            icon: FontAwesomeIcons.solidEnvelope,
            action: () {
              android_intent.Intent()
                ..setAction(android_action.Action.ACTION_VIEW)
                ..setData(Uri(
                    scheme: "mailto", path: "youssef.elmoumen.1999@gmail.com"))
                ..startActivity().catchError((e) => print(e));
            }),
      ],
    ));
  }
}

mixin BookManager {}

class Consumer<T> {}

class ActionBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final Function action;

  const ActionBox({Key key, this.icon, this.title, this.action})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: action,
      child: Container(
        margin: EdgeInsets.only(top: 5, bottom: 5, left: 8, right: 8),
        padding: EdgeInsets.all(16),
        height: 80,
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(15),
            color: Colors.white,
            boxShadow: [
              BoxShadow(
                color: Colors.black26.withOpacity(0.2),
                blurRadius: 5,
                offset: Offset(0, 3),
              ),
            ]),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
            Icon(
              icon,
              color: Colors.purple,
              size: 25,
            ),
            SizedBox(
              width: 10,
            ),
            Padding(
              padding: const EdgeInsets.only(left: 10),
              child: Text("$title"),
            ),
          ],
        ),
      ),
    );
  }
}
