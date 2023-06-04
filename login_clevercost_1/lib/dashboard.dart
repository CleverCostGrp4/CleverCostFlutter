// ignore_for_this_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';
import 'package:get/get.dart';

import 'pages/vat_calculator.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const DiagramPage(title: 'Diagrams');
  }
}

class DiagramPage extends StatefulWidget {
  const DiagramPage({super.key, required this.title});

  final String title;

  @override
  State<DiagramPage> createState() => _DiagramPageState();
}

class _DiagramPageState extends State<DiagramPage> {
  // ignore: unused_field
  late List<SupplierData> _chartData;
  // ignore: unused_field
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
        child: Scaffold(
      body: Container(
        child: ListView(
          scrollDirection: Axis.horizontal,
          children: <Widget>[
            SfCircularChart(
              title: ChartTitle(
                  text: 'Top Suppliers in millions',
                  alignment: ChartAlignment.center),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<SupplierData, String>(
                  dataSource: _chartData,
                  xValueMapper: (SupplierData data, _) => data.amountName,
                  yValueMapper: (SupplierData data, _) => data.amount,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
              ],
              legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  offset: const Offset(0, -70)),
            ),
            const SizedBox(height: 20),
            SfCircularChart(
              title: ChartTitle(
                  text: 'Top Suppliers in millions',
                  alignment: ChartAlignment.center),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<SupplierData, String>(
                  dataSource: _chartData,
                  xValueMapper: (SupplierData data, _) => data.amountName,
                  yValueMapper: (SupplierData data, _) => data.amount,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
              ],
              legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  offset: const Offset(0, -70)),
            ),
            const SizedBox(height: 20),
            SfCircularChart(
              title: ChartTitle(
                  text: 'Top Suppliers in millions',
                  alignment: ChartAlignment.center),
              tooltipBehavior: _tooltipBehavior,
              series: <CircularSeries>[
                DoughnutSeries<SupplierData, String>(
                  dataSource: _chartData,
                  xValueMapper: (SupplierData data, _) => data.amountName,
                  yValueMapper: (SupplierData data, _) => data.amount,
                  dataLabelSettings: const DataLabelSettings(isVisible: true),
                  enableTooltip: true,
                ),
              ],
              legend: Legend(
                  isVisible: true,
                  overflowMode: LegendItemOverflowMode.wrap,
                  position: LegendPosition.bottom,
                  offset: const Offset(0, -70)),
            ),
            //Dummy nav for convenience
            FloatingActionButton(
              onPressed: () => Get.to(VatCalculatorPage()),
              tooltip: 'Go to Vat Calc',
              child: const Icon(Icons.calculate),
            ),
          ],
        ),
      ),
    ));
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
