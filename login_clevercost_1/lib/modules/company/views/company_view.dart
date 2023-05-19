import 'package:login_clevercost_1/widgets/custom_buttons.dart';
import 'package:login_clevercost_1/modules/signin/controllers/signin_controller.dart';
import 'package:login_clevercost_1/modules/signin/views/signin_view.dart';
import 'package:flutter/material.dart';
import 'package:login_clevercost_1/data/models/company.dart';
import 'package:login_clevercost_1/data/models/access_token.dart';

import 'package:get/get.dart';

import '../../../constants.dart';
import '../../../widgets/basic_buttom.dart';
import '../../../widgets/company_card.dart';
import '../controllers/company_controller.dart';

class CompanyView extends GetView<CompanyController> {
  CompanyView({Key? key}) : super(key: key);

  final SigninController signinController = Get.find();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('CompanyView'),
        centerTitle: true,
      ),
      body: Center(
        child: Column(
          children: [
            //Top Logo
            //Clevercost Logo
            SizedBox(
              height: 150,
              width: double.infinity,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 300),
                color: kBluePrimary,
                child: Center(
                  child: Image.asset('lib/images/CleverCostLogo_v3.png'),
                ),
              ),
            ),

            // Obx(
            //   () => Text('${signinController.accessToken.value?.token}'),
            // ),

            const SizedBox(height: 30), //Spacing

            Obx(
              () {
                if (signinController.user.value == null ||
                    signinController.user.value!.companies.isEmpty) {
                  return Text(
                    'any company enjoyers?',
                    style: TextStyle(color: Colors.black),
                  );
                } else {
                  return ListView(
                    children:
                        signinController.user.value!.companies.map((company) {
                      return CompanyCard(
                        company: company,
                        onTap: () => {print('xdd')},
                      );
                    }).toList(),
                  );
                }
              },
            ),

            //Company Listings with press

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: CompanyCard(
            //     companyName: 'Le Buzz Denmark',
            //     companyCVR: 12345678,
            //     onTap: () {},
            //   ),
            // ),
            // const SizedBox(height: 30), //Spacing

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: CompanyCard(
            //     companyName: 'Clever Tech Group ApS',
            //     companyCVR: 12345678,
            //     onTap: () {},
            //   ),
            // ),
            // const SizedBox(height: 30), //Spacing

            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: CompanyCard(
            //     companyName: 'Damascus Smykker',
            //     companyCVR: 12345678,
            //     onTap: () {},
            //   ),
            // ),
            // const SizedBox(height: 30), //Spacing

            //Continue Button
            // Padding(
            //   padding: const EdgeInsets.symmetric(horizontal: 25.0),
            //   child: BasicButton(
            //     buttonTitle: 'Continue',
            //     onTap: continueToDashboard,
            //   ),
            // ),

            //Sign up

            const SizedBox(height: 20),

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
                  const Padding(
                    padding: EdgeInsets.symmetric(horizontal: 10.0),
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

            const SizedBox(height: 20),

            const Text(
              'Back to sign in',
              style: TextStyle(
                color: Colors.blue,
                fontWeight: FontWeight.normal,
                fontSize: 16,
              ),
            ),

            const SizedBox(height: 100.0),
          ],
        ),
      ),
    );
  }
}
