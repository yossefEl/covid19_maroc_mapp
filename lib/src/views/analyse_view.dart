import 'package:corona_fighter/src/components/custom_card.dart';
import 'package:corona_fighter/src/models/cases_by_days_model.dart';
import 'package:corona_fighter/src/models/cases_by_region_model.dart';
import 'package:corona_fighter/src/models/general_cases_info_model.dart';
import 'package:corona_fighter/src/utils/colors.dart';
import 'package:corona_fighter/src/utils/text_styles.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class AnalyticsView extends StatefulWidget {
  final List<CasesByDaysModel> casesBysDays;
  final List<CasesByRegionModel> casesByRegions;
  final List<GeneralCasesInfoModel> generalCasesInfoModel;

  const AnalyticsView(
      {Key key,
      this.casesBysDays,
      this.casesByRegions,
      this.generalCasesInfoModel})
      : super(key: key);

  @override
  _AnalyticsViewState createState() => _AnalyticsViewState();
}

class _AnalyticsViewState extends State<AnalyticsView> {
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    print(widget.casesByRegions.length);
    return ListView(
      shrinkWrap: true,
      physics: BouncingScrollPhysics(),
      children: <Widget>[
        StatisticsCard(
            child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: <Widget>[
              Text(
                "Morocco 🇲🇦",
                style: TextStyle(
                    color: AppColors.darkPurple,
                    fontWeight: FontWeight.bold,
                    fontSize: 20),
              ),
              Text(
                "\n المطور:يوسف المومن\n القائم على المحتوى: الحسين الحاج",
                textAlign: TextAlign.center,
              ),

                Text(
                "لدعم التطبيق راسلنا على\n youssef.elmoumen.1999@gmail.com",
                textAlign: TextAlign.center,
              ),

            ],
          ),
        )),
        // StatisticsCard(child: Image.asset(imageUrl),),
        StatisticsCard(
          child: widget.generalCasesInfoModel?.length == 0
              ? Container(
                  padding: EdgeInsets.all(16),
                  alignment: Alignment.center,
                  child: CircularProgressIndicator(),
                )
              : Container(
                  alignment: Alignment.center,
                  child: Column(
                    children: <Widget>[
                      DataBox(
                        icon: FontAwesomeIcons.userAlt,
                        info: widget.generalCasesInfoModel[0]?.totalCases
                            .toString(),
                        color: Colors.purple,
                        title: "مجموع الحالات",
                      ),
                      DataBox(
                        icon: FontAwesomeIcons.creativeCommonsSamplingPlus,
                        info: widget.generalCasesInfoModel[0]?.activeCases
                            .toString(),
                        color: Colors.blue,
                        title: "الحالات  النشطة",
                      ),
                      DataBox(
                        icon: FontAwesomeIcons.solidDizzy,
                        info:
                            widget.generalCasesInfoModel[0]?.deaths.toString(),
                        color: Colors.red,
                        title: "الوفايات",
                      ),
                      DataBox(
                        icon: FontAwesomeIcons.check,
                        info: widget.generalCasesInfoModel[0]?.recovered
                            .toString(),
                        color: Colors.green,
                        title: "الحالات التي شفيت",
                      ),
                    ],
                  ),

                ),
        ),

        Directionality(
            textDirection: TextDirection.ltr,
            child: StatisticsCard(
              child: SfCartesianChart(
                  title: ChartTitle(
                    text: 'تطور عدد الحالات المؤكدة بدلالة الزمن',
                    alignment: ChartAlignment.center,
                    textStyle: Styles.chartTileStyle,
                  ),
                  // Initialize category axis
                  tooltipBehavior: TooltipBehavior(enable: true),
                  primaryXAxis: CategoryAxis(),
                  series: <SplineSeries<CasesByDaysModel, String>>[
                    SplineSeries<CasesByDaysModel, String>(
                        dataLabelSettings: DataLabelSettings(isVisible: true),
                        color: Colors.purple,
                        animationDuration: 300,

                        // Bind data source
                        dataSource: widget.casesBysDays,
                        xValueMapper: (CasesByDaysModel cases, _) =>
                            cases.dayMonth,
                        yValueMapper: (CasesByDaysModel cases, _) =>
                            cases.casesCount),
                  ]),
            )),
        Directionality(
            textDirection: TextDirection.ltr,
            child: StatisticsCard(
                child: SfCartesianChart(
                    title: ChartTitle(
                      text: 'عدد الحالات المؤكدة حسب الجهات',
                      alignment: ChartAlignment.center,
                      textStyle: Styles.chartTileStyle,
                    ),
                    primaryXAxis: CategoryAxis(),
                    tooltipBehavior: TooltipBehavior(enable: true),
                    series: <ChartSeries>[
                  BarSeries<CasesByRegionModel, String>(
                      dataLabelSettings: DataLabelSettings(isVisible: true),
                      color: Colors.purple,
                      dataSource: widget.casesByRegions,
                      xValueMapper: (CasesByRegionModel cases, _) =>
                          cases.region,
                      // lowValueMapper: (CasesByRegionModel cases, _) => 0,
                      yValueMapper: (CasesByRegionModel cases, _) =>
                          cases.casesCount)
                ]))),
      ],
    );
  }
}

class ChartData {
  ChartData(this.x, this.high, this.low);
  final String x;
  final double high;
  final double low;
}

class DataBox extends StatelessWidget {
  final IconData icon;
  final String title;
  final String info;
  final Color color;

  const DataBox({Key key, this.icon, this.title, this.info, this.color})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Widget>[
        Row(
          children: <Widget>[
            Icon(icon, color: color),
            Padding(
              padding: EdgeInsets.all(10),
              child: Text(
                title,
                style: Styles.knowViewSectionTitle.copyWith(color: color),
              ),
            ),
          ],
        ),
        Padding(
          padding: EdgeInsets.all(10),
          child: Text(
            info,
            style: Styles.knowViewSectionTitle.copyWith(color: color),
          ),
        )
      ],
    );
  }
}
