import 'package:login_clevercost_1/widgets/custom_buttons.dart';
import 'package:login_clevercost_1/modules/signin/controllers/signin_controller.dart';
import 'package:login_clevercost_1/modules/signin/views/signin_view.dart';
import 'package:flutter/material.dart';

import 'package:get/get.dart';

import '../controllers/home_controller.dart';

class HomeView extends GetView<HomeController> {
  const HomeView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('HomeView'),
        centerTitle: true,
      ),
      body: Center(
          child: Padding(
        padding: const EdgeInsets.all(20.0),
        child: CustomButton(
          onPressed: () {
            Get.off(const SigninView());
            Get.put<SigninController>(SigninController());
          },
          buttonName: 'Back to SignIn',
          type: ButtonVariant.filled,
        ),
      )),
    );
  }
}
