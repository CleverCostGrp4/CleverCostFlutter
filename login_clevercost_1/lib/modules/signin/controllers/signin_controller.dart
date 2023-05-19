// ignore_for_file: avoid_print

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
import 'package:login_clevercost_1/data/models/user.dart';
import 'package:login_clevercost_1/data/models/access_token.dart';
import 'package:login_clevercost_1/modules/company/views/company_view.dart';

class SigninController extends GetxController {
  final dio = Dio();

  final logInFormkey = GlobalKey<FormBuilderState>().obs;

  TextStyle textfeilhHeadingStyle = TextStyle(
      fontSize: Get.width * FontSizes.fourteen, fontWeight: FontWeight.bold);

  Rx<User?> user = Rx<User?>(null);
  Rx<AccessToken?> accessToken = Rx<AccessToken?>(null);

  void setUser(User? user) {
    this.user.value = user;
  }

  void setAccessToken(AccessToken? token) {
    accessToken.value = token;
  }

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
      print('DEBUG: Response data: ${response.data}');
      final loginResponse = LoginResponse.fromJson(responseData);

      // print('Status Code: ${loginResponse.status.toString()}');

      if ((loginResponse.status ?? 0) == 200) {
        setUser(loginResponse.result?.user);
        setAccessToken(loginResponse.result?.accessToken);
        Get.offAll(CompanyView());
      } else {
        OverlayServices.to
            .showSnackBar(color: AppColor.appRed, message: 'Failed to log in');
      }
    } catch (e) {
      if (e is DioError) {
        if (e.response?.statusCode == 302) {
          // Handle your 302 error here
          print('Received 302 error');
          OverlayServices.to.showSnackBar(
              color: AppColor.appRed,
              message:
                  'Received a 302 redirect error. Please check your API endpoint.');
        } else {
          // Handle other DioError type of errors here
          OverlayServices.to
              .showSnackBar(color: AppColor.appRed, message: e.toString());
          print('DioError Exception: ${e.toString()}');
        }
      } else {
        // Handle all other errors here
        OverlayServices.to
            .showSnackBar(color: AppColor.appRed, message: e.toString());
        print('General Exception: ${e.toString()}');
      }

      // throw Exception('Failed to log in'); Commenting out this line, because you may not want to throw error after you've handled it already.
    } finally {
      OverlayServices.to.hideOverlay();
    }
  }
}
