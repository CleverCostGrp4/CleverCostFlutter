//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:login_clevercost_1/basic_buttom.dart';

import 'company_card.dart';
import 'diagrams/doughnut_diagram.dart';

class CompanyPage extends StatefulWidget {
  const CompanyPage({super.key});

  @override
  State<CompanyPage> createState() => _CompanyPageState();
}

class _CompanyPageState extends State<CompanyPage> {
  // var dashboardRoute = MaterialPageRoute(
  //   builder: (BuildContext context) => DonutChartScreen,
  // );

  //Continue to Dashboard
  continueToDash() {
    Navigator.pushNamed(
        context, DonutChartScreen.routeName); // Navigate to DonutChartScreen
  }

  continueToStacked() {
    Navigator.pushNamed(
        context, StackedLine.routeName); // Navigate to DonutChartScreen
  }

  bool rememberCompany = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Top Logo
              Image.asset('lib/images/clevercost_company_page.png'),

              SizedBox(height: 20),

              //Company Listings with press
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 30), //Spacing

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Container(
                  height: 80,
                  decoration: BoxDecoration(
                    color: Colors.white,
                    border: Border.all(color: Colors.grey),
                    borderRadius: BorderRadius.circular(6),
                  ),
                ),
              ),
              SizedBox(height: 30), //Spacing

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CompanyCard(
                  companyName: 'Clever Tech Group ApS',
                  companyCVR: 12345678,
                  companyIcon: FontAwesomeIcons.buildingUser,
                  onTap: () {},
                ),
              ),
              SizedBox(height: 30), //Spacing

              //Access this company by default when I log into my clevercost account
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: GestureDetector(
                  behavior: HitTestBehavior.opaque,
                  onTap: () {
                    setState(() {
                      rememberCompany = !rememberCompany;
                    });
                  },
                  child: Row(
                    children: [
                      Checkbox(
                        value: rememberCompany,
                        onChanged: (newValue) {
                          setState(() {
                            rememberCompany = newValue!;
                          });
                        },
                      ),
                      Text(
                        "Access this company by default \nwhen I log into my Clever Cost account.",
                        style: TextStyle(fontSize: 15),
                      ),
                    ],
                  ),
                ),
              ),

              SizedBox(height: 20), //Spacing

              //Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: BasicButton(
                  buttonTitle: 'Continue',
                  onTap: continueToDash,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
