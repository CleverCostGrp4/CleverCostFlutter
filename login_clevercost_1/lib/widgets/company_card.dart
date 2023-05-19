import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clevercost_1/constants.dart';
import 'package:flutter_svg/flutter_svg.dart';
import 'package:login_clevercost_1/data/models/company.dart';

class CompanyCard extends StatelessWidget {
  const CompanyCard({
    super.key,
    required this.company,
    required this.onTap,
    this.selected = false,
  });

  //Company object
  final Company company;
  // OnTap
  final VoidCallback onTap;
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
            Obx(
              () => Text(
                company.name,
                style: kCompanyNameStyle,
              ),
            ),
            const SizedBox(width: 10.0),
            Obx(
              () => Text(
                company.cvrNumber,
                style: kCompanyNameStyle,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
