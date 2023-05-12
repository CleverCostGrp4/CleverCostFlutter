import 'package:flutter/material.dart';
import 'package:login_clevercost_1/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.onTap,
    required this.companyName,
    required this.companyCVR,
    this.selected = false,
  });

  final VoidCallback onTap;
  //Company Name
  final String companyName;
  //Company CVR Number
  final int companyCVR;
  //Selected Parameter
  final bool selected;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        height: 80,
        padding: const EdgeInsets.only(left: 10.0), // Add left padding
        decoration: BoxDecoration(
          color: selected ? kBluePrimary.withAlpha(100) : Colors.white,
          border: Border.all(color: Colors.grey),
          borderRadius: BorderRadius.circular(6),
        ),
        child: Row(
          mainAxisAlignment:
              MainAxisAlignment.start, // Change MainAxisAlignment
          children: <Widget>[
            SvgPicture.asset('lib/icons/Company.svg'),
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
