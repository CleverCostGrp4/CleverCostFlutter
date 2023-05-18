import 'dart:convert';
import 'package:login_clevercost_1/configs/app_theme.dart';
import 'package:login_clevercost_1/configs/font_size.dart';
import 'package:login_clevercost_1/utils/app_urls.dart';
import 'package:login_clevercost_1/modules/home/views/home_view.dart';
import 'package:login_clevercost_1/services/overlay_services.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';
import 'package:login_clevercost_1/data/models/login_response.dart';

class SigninController extends GetxController {
  final dio = Dio();

  final logInFormkey = GlobalKey<FormBuilderState>().obs;

  TextStyle textfeilhHeadingStyle = TextStyle(
      fontSize: Get.width * FontSizes.fourteen, fontWeight: FontWeight.bold);

  Future<void> loginUser(BuildContext context) async {
    try {
      OverlayServices.to.showOverlay(context);
      final requestBody = json.encode({
        "email": logInFormkey.value.currentState?.value["email"] ?? "",
        "password": logInFormkey.value.currentState?.value["password"] ?? "",
        "timezone": "Asia/Karachi",
        "fcm_token": "abc",
      });
      final response = await dio.post(
        AppUrls.login,
        data: requestBody,
        options: Options(),
      );

      final responseData = response.data;
      final loginResponse = LoginResponse.fromJson(responseData);

      print('Status Code: ${loginResponse.status}');

      if (loginResponse.status == 200) {
        Get.offAll(const HomeView());
      } else {
        OverlayServices.to
            .showSnackBar(color: AppColor.appRed, message: 'Failed to log in');
        throw Exception('Failed to log in');
      }
    } catch (error) {
      OverlayServices.to
          .showSnackBar(color: AppColor.appRed, message: error.toString());
      print('Exception: $error'); // Print the exception
      throw Exception('Failed to log in');
    } finally {
      OverlayServices.to.hideOverlay();
    }
  }
}
