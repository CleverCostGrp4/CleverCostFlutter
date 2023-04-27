// ignore_for_this_file: prefer_const_constructors

// ignore_for_file: prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:syncfusion_flutter_charts/charts.dart';

class Dashboard extends StatefulWidget {
  const Dashboard({super.key});

  @override
  State<Dashboard> createState() => _DashboardState();
}

class _DashboardState extends State<Dashboard> {
  @override
  Widget build(BuildContext context) {
    return const MyHomePage(title: 'Diagrams');
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  late List<SupplierData> _chartData;
  late TooltipBehavior _tooltipBehavior;

  @override
  void initState() {
    _chartData = getChartData();
    _tooltipBehavior = TooltipBehavior(enable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(child: Scaffold());
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
