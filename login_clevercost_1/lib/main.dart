//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_clevercost_1/diagrams/doughnut_diagram.dart';
import 'diagrams/stackedLine_diagram.dart';
import 'modules/signin/views/signin_view.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      initialRoute: '/',
      routes: {
        DonutChartScreen.routeName: (context) =>
            const DonutChartScreen(title: 'random title'),
        StackedLine.routeName: (context) =>
            const StackedLine(title: 'random title'),
      },
      home: LoginPage(),
    );
  }
}
