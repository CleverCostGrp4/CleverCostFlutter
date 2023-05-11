//ignore_for_file: prefer_const_constructors
import 'package:flutter/material.dart';
import 'package:login_clevercost_1/basic_buttom.dart';
import 'company_card.dart';
import 'constants.dart';
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
  continueToDashboard() {
    Navigator.pushNamed(
        context, DonutChartScreen.routeName); // Navigate to DonutChartScreen
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Center(
          child: Column(
            children: [
              //Top Logo
              //Clevercost Logo
              SizedBox(
                height: 150,
                width: double.infinity,
                child: AnimatedContainer(
                  duration: Duration(milliseconds: 300),
                  color: kBluePrimary,
                  child: Center(
                    child: Image.asset('lib/images/CleverCostLogo_v3.png'),
                  ),
                ),
              ),

              SizedBox(height: 30), //Spacing

              //Company Listings with press

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CompanyCard(
                  companyName: 'Le Buzz Denmark',
                  companyCVR: 12345678,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 30), //Spacing

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CompanyCard(
                  companyName: 'Clever Tech Group ApS',
                  companyCVR: 12345678,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 30), //Spacing

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: CompanyCard(
                  companyName: 'Damascus Smykker',
                  companyCVR: 12345678,
                  onTap: () {
                    setState(() {});
                  },
                ),
              ),
              SizedBox(height: 30), //Spacing

              //Continue Button
              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: BasicButton(
                  buttonTitle: 'Continue',
                  onTap: continueToDashboard,
                ),
              ),

              //Sign up

              SizedBox(height: 20),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 25.0),
                child: Row(
                  children: [
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10.0),
                      child: Text('or'),
                    ),
                    Expanded(
                      child: Divider(
                        thickness: 2,
                        color: Colors.grey[400],
                      ),
                    ),
                  ],
                ),
              ),

              SizedBox(height: 20),

              Text(
                'Back to sign in',
                style: TextStyle(
                  color: Colors.blue,
                  fontWeight: FontWeight.normal,
                  fontSize: 16,
                ),
              ),

              SizedBox(height: 100.0),
            ],
          ),
        ),
      ),
    );
  }
}
