import 'package:corona_fighter/src/components/cusom_expansion_tile.dart';
import 'package:corona_fighter/src/components/protect_card.dart';
import 'package:corona_fighter/src/utils/shadows.dart';
import 'package:corona_fighter/src/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:intent/action.dart' as action;
import 'package:intent/intent.dart' as intent;

class ProtectSelfView extends StatefulWidget {
  @override
  _ProtectSelfViewState createState() => _ProtectSelfViewState();
}

class _ProtectSelfViewState extends State<ProtectSelfView> {
  @override
  Widget build(BuildContext context) {
    return ListView(
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        CustomExpansionTile(
          key: Key("about"),
          icon: Icons.check,
          title: "كورونا و كوفيد19",
          children: <Widget>[
            SectionInfoContainer(
                title: "ما هو فيروس كورونا؟",
                description:
                    "فيروسات كورونا هي فصيلة كبيرة من الفيروسات التي قد تسبب المرض للحيوان والإنسان.  ومن المعروف أن عدداً من فيروسات كورونا تسبب لدى البشر حالات عدوى الجهاز التنفسي التي تتراوح حدتها من نزلات البرد الشائعة إلى الأمراض الأشد وخامة مثل متلازمة الشرق الأوسط التنفسية والمتلازمة التنفسية الحادة الوخيمة (السارس). ويسبب فيروس كورونا المُكتشف مؤخراً مرض فيروس كورونا كوفيد-19."),
            SectionInfoContainer(
                title: "ما هو مرض كوفيد-19؟",
                description:
                    "مرض كوفيد-19 هو مرض معد يسببه فيروس كورونا المُكتشف مؤخراً. ولم يكن هناك أي علم بوجود هذا الفيروس وهذا المرض المستجدين قبل اندلاع الفاشية في مدينة يوهان الصينية في كانون الأول/ ديسمبر 2019."),
          ],
        ),
        CustomExpansionTile(
          title: "الأعراض",
          key: Key("hadana"),
          icon: Icons.check,
          children: <Widget>[
            SectionInfoContainer(
            
              description:
                  "يمكن أن يصاب الأشخاص بعدوى مرض كوفيد-19 عن طريق الأشخاص الآخرين المصابين بالفيروس. ويمكن للمرض أن ينتقل من شخص إلى شخص عن طريق القُطيرات الصغيرة التي تتناثر من الأنف أو الفم عندما يسعل الشخص المصاب بمرض كوفيد-19 أو يعطس. وتتساقط هذه القُطيرات على الأشياء والأسطح المحيطة بالشخص. ويمكن حينها أن يصاب الأشخاص الآخرون بمرض كوفيد-19 عند ملامستهم لهذه الأشياء أو الأسطح ثم لمس عينيهم أو أنفهم أو فمهم. كما يمكن أن يصاب الأشخاص بمرض كوفيد-19 إذا تنفسوا القُطيرات التي تخرج من الشخص المصاب بالمرض مع سعاله أو زفيره. ولذا فمن الأهمية بمكان الابتعاد عن الشخص المريض بمسافة تزيد على متر واحد (3 أقدام).",
            )
          ],
        ),
        CustomExpansionTile(
          key: Key("fi2at"),
          icon: Icons.check,
          title: "الفئات الأكثر عرضة للخطر",
          children: <Widget>[
            SectionInfoContainer(
            
              description:
                  " المسنين والأشخاص المصابين بحالات طبية موجودة مسبقاً (مثل ارتفاع ضغط الدم وأمراض القلب وداء السكري) يصابون بمرض وخيم أكثر من غيرهم.",
            )
          ],
        ),
        CustomExpansionTile(
          key: Key("a3rad"),
          title: "فترة حضانة فيروس كورونا",
          icon: Icons.check,
          children: <Widget>[
            SectionInfoContainer(
            
              description:
                  "مصطلح فترة الحضانة يشير إلى المدة من الإصابة بالفيروس إلى بدء ظهور أعراض المرض. وتتراوح معظم تقديرات فترة حضانة مرض كوفيد-19 ما بين يوم واحد و14 يوماً، وعادة ما تستمر خمسة أيام.",
            ),
          ],
        ),
        CustomExpansionTile(
          key: Key("wi9aya"),
          icon: Icons.check,
          title: "سبل الوقاية",
          children: <Widget>[
             ProtectCard(
              icon: "assets/icon5.png",
              title: "الزم بيتك..أفضل السبل",
              description:
                  "نظرا لمدة الحضانة الطويلة لهذا الفيروس فإن أفضل حل للوقاية ولحماية أحبائك هي البقاء في البيت إلى حين السيطرة عليه",
            ),
            ProtectCard(
              icon: "assets/icon6.png",
              title: "قم بإلغاء السفر",
              description:
                  "تأجيل أو إلغاء السفر غير الضروري إلى المدن التي تأثرت بالوباء",
            ),
            ProtectCard(
              icon: "assets/icon7.png",
              title: "اغسل يديك بانتظام",
              description:
                  "اغسل يديك بانتظام بالماء والصابون أو المعقمات الكحولية لمدة 20 ثانية على الأقل سواء بعد السعال أو العطس أو قبل وبعد إعداد الطعام، وقبل الأكل وبعد استخدام دورات المياه، عند رعاية المرضى، بعد التعامل مع الحيوانات أو عندما تكون يديك متسختين.",
            ),
            ProtectCard(
              icon: "assets/icon13.png",
              title: "عند السعال أو العطس",
              description:
                  "عند السعال أو العطس قم بتغطية الفم والأنف بمنديل، أو استعمل باطن المرفق لمنع تطاير الرذاذ ثم تخلص من المنديل في سلة المهملات ثم اغسل يديك بالماء والصابون.\n إذا لم يكن لديك منديل احرص على استخدام الجزء العلوي من كمك وليس يديك",
            ),
            ProtectCard(
              icon: "assets/icon14.png",
              title: "أبعد يديك عن وجهك",
              description:
                  "تجنب لمس العين أو الأنف أو الفم بيديك",
            ),
            ProtectCard(
              icon: "assets/icon4.png",
              title: "ابتعد عن الأشخاص قدر الممكن",
              description:
                  "البقاء على مسافة كافية من الأشخاص الذين لديهم التهابات الجهاز التنفسي مثل الرشح والسعال وتجنب الاقتراب والمصافحة.",
            ),
          
            ProtectCard(
              icon: "assets/icon3.png",
              title: "قم بطهي الطعام جيدا",
              description:
                  " تأكد من طهي الطعام جيداً وخاصة اللحوم والبيض وتجنب تناول الطعام النيء",
            ),
            ProtectCard(
              icon: "assets/icon11.png",
              title: "استعمل الكمامة",
              description:
                  " إذا ظهرت عليك أعراض نزلة البرد أو الأنفلونزا استعمل الكمامة لتفادي إصابة الآخرين بالعدوى",
            ),
           
          ],
        ),
        CustomExpansionTile(
          key: Key("sites"),
          icon: Icons.check,
          title: "مواقع موثوقة",
          children: <Widget>[

            InkWell(
              onTap: (){
    intent.Intent()
      ..setAction(action.Action.ACTION_VIEW)
      ..setData(Uri(scheme: 'https', path: 'https://www.who.int/ar/emergencies/diseases/novel-coronavirus-2019'))
      ..startActivity().catchError((e) => print(e));
              },  

              child: Container(
                padding:EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                child: Text("منظمة الصحة العالمية- كوفيد19")),
            ),
                        InkWell(
              onTap: (){
    intent.Intent()
      ..setAction(action.Action.ACTION_VIEW)
      ..setData(Uri(scheme: 'https', path: 'https://www.sante.gov.ma/'))
      ..startActivity().catchError((e) => print(e));
              },  

              child: Container(
                padding:EdgeInsets.all(5),
                alignment: Alignment.centerRight,
                child: Text("موقع وزارة الصحة) المغرب")),
            ),
          ],
        ),
      ],
    );
  }
}

class SectionInfoContainer extends StatelessWidget {
  final String title;
  final String description;

  const SectionInfoContainer({Key key, this.title, this.description})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.start,
          children: <Widget>[
           title==null?Container() : Text(
              title,
              style: Styles.knowViewSectionTitle,
            ),
            Text(description),
          ],
        ),
      
    );
  }
}
