import 'package:flutter/material.dart';
import 'package:login_clevercost_1/constants.dart';

class CompanyCards extends StatefulWidget {
  const CompanyCards({super.key});

  @override
  State<CompanyCards> createState() => _CompanyCardsState();
}

class _CompanyCardsState extends State<CompanyCards> {
  // ignore: unused_field
  final int _selectedValue = 0;

  @override
  Widget build(BuildContext context) {
    return const Placeholder();
  }
}

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.onTap,
    required this.companyIcon,
    required this.companyName,
    required this.companyCVR,
  });

  final VoidCallback onTap;
  //Company Icon
  final IconData companyIcon;
  //Company Name
  final String companyName;
  //Company CVR Number
  final int companyCVR;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        decoration: BoxDecoration(
          color: Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Icon(companyIcon),
            const SizedBox(width: 15.0),
            Text(
              companyName,
              style: kCompanyNameStyle,
            ),
            const SizedBox(width: 10.0),
            Text(companyCVR.toString()),
          ],
        ),
      ),
    );
  }
}
