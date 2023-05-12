//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_clevercost_1/pages/vat_calculator.dart';
import 'package:login_clevercost_1/pages/navigation_dummy.dart';
import 'package:login_clevercost_1/pages/account_settings_dummy.dart';
import 'package:login_clevercost_1/diagrams/doughnut_diagram.dart';
import 'diagrams/stackedLine_diagram.dart';
import 'login_page.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      theme: ThemeData(
        primaryColor: Color.fromRGBO(67, 66, 93, 1),
        fontFamily: 'Lato',
        iconTheme: IconThemeData(color: Color.fromRGBO(67, 66, 93, 1)),
      ),
      initialRoute: '/',
      routes: {
        DonutChartScreen.routeName: (context) =>
            const DonutChartScreen(title: 'random title'),
        StackedLine.routeName: (context) =>
            const StackedLine(title: 'random title'),
            VatCalculatorPage.routeName: (context) =>
            const VatCalculatorPage(),
            NavigationPage.routeName: (context) =>
            const NavigationPage(),
            NavigationPageDos.routeName: (context) =>
            const NavigationPageDos(),
      },
      home: LoginPage(),
    );
  }
}
