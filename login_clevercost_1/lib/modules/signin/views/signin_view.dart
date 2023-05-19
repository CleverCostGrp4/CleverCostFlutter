import 'package:login_clevercost_1/configs/app_theme.dart';
import 'package:login_clevercost_1/utils/static_assets.dart';
import 'package:login_clevercost_1/widgets/custom_buttons.dart';
import 'package:login_clevercost_1/widgets/custom_text_field.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:flutter_svg/svg.dart';

import 'package:get/get.dart';

import '../controllers/signin_controller.dart';

class SigninView extends GetView<SigninController> {
  const SigninView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        resizeToAvoidBottomInset: true,
        backgroundColor: AppColor.primaryBackgroundColor,
        appBar: AppBar(
          elevation: 0,
          backgroundColor: AppColor.primaryBackgroundColor,
          toolbarHeight: Get.height * 0.3,
          title: SvgPicture.asset(StaticAssets.appLogo2),
          centerTitle: true,
        ),
        body: FormBuilder(
          key: controller.logInFormkey.value,
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'E-mail',
                  style: controller.textfeilhHeadingStyle,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextField(
                  onChangeFtn: (value) {
                    controller.logInFormkey.value.currentState?.save();
                    return null;
                  },
                  name: 'email',
                  hint: 'Enter your email',
                  textInputType: TextInputType.emailAddress,
                ),
                const SizedBox(
                  height: 15,
                ),
                Text(
                  'Password',
                  style: controller.textfeilhHeadingStyle,
                ),
                const SizedBox(
                  height: 6,
                ),
                CustomTextField(
                  isPass: true,
                  onChangeFtn: (value) {
                    controller.logInFormkey.value.currentState?.save();
                    return null;
                  },
                  name: 'password',
                  hint: 'Enter your password',
                  textInputType: TextInputType.visiblePassword,
                ),
                const Spacer(),
                SafeArea(
                  child: CustomButton(
                    onPressed: () {
                      controller.loginUser(context);
                    },
                    buttonName: 'Sign In',
                    type: ButtonVariant.filled,
                  ),
                )
              ],
            ),
          ),
        ));
  }
}
