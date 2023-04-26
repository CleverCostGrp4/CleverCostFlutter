import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:login_clevercost_1/pages/vat_calculator.dart';

class DonutChartScreen extends StatefulWidget {
  const DonutChartScreen({super.key, required this.title});

  final String title;

  static const String routeName = '/peter-charts';

  @override
  State<DonutChartScreen> createState() => _DonutChartScreenState();
}

class _DonutChartScreenState extends State<DonutChartScreen> {
  late List<SupplierData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  Legend buildLegend() {
    return Legend(
      isVisible: true,
      overflowMode: LegendItemOverflowMode.wrap,
      position: LegendPosition.bottom,
      offset: const Offset(0, 0),
      legendItemBuilder:
          (String name, dynamic series, dynamic point, int index) {
        return buildLegendItemWidget(point.color, _chartData[index].amountName);
      },
    );
  }

  Widget buildLegendItemWidget(Color pointColor, String amountName) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Spacer(),
        Expanded(
          flex: 2,
          child: Row(
            children: [
              Container(
                width: 10,
                height: 10,
                decoration: BoxDecoration(
                  color: pointColor,
                  shape: BoxShape.rectangle,
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 5),
                child: Text(amountName),
              ),
            ],
          ),
        ),
        const Spacer(),
      ],
    );
  }

  ChartTitle buildChartTitle() {
    return ChartTitle(
        text: 'Top Suppliers in millions', alignment: ChartAlignment.center);
  }

  getChartSeries() {
    return DoughnutSeries<SupplierData, String>(
      dataSource: _chartData,
      xValueMapper: (SupplierData data, _) => data.name,
      yValueMapper: (SupplierData data, _) => data.amount,
      dataLabelSettings: const DataLabelSettings(isVisible: true),
      enableTooltip: true,
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        // Wrappede body med en Column. Fordi uden Column, så prøver body at fylde hele skærmen
        body: Column(
          children: [
            // SizedBox som angiver hvor meget chart skal fylde
            SizedBox(
              width: double.infinity,
              height: 500,
              child: SfCircularChart(
                  title: buildChartTitle(),
                  tooltipBehavior: _tooltipBehavior,
                  series: <CircularSeries>[getChartSeries()],
                  legend: buildLegend()),
            ),
            //Dummy nav for convenience
            FloatingActionButton(
              onPressed: () {
                Navigator.pushNamed(context, VatCalculatorPage.routeName);
              },
              tooltip: 'Go to Vat Calc',
              child: const Icon(Icons.calculate),
            ),
          ],
        ),
      ),
    );
  }

  List<SupplierData> getChartData() {
    final List<SupplierData> chartData = [
      SupplierData("ABC Corporation", 10000),
      SupplierData("XYZ Company", 15000),
      SupplierData("Acme Industries", 8000),
      SupplierData("Globex Corporation", 12000),
      SupplierData("Widget Inc.", 6000),
      SupplierData("Initech Corporation", 9000),
    ];

    return chartData;
  }
}

class SupplierData {
  SupplierData(this.name, this.amount) {
    amountName = '$name ${amount.toString()}';
  }
  final String name;
  final int amount;
  late String amountName;
}
