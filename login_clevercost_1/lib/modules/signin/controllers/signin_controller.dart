import 'dart:convert';


import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:get/get.dart';

class SigninController extends GetxController {
  final dio = Dio();

  //final logInFormkey = GlobalKey<FormBuilderState>().obs;





  
//   Future<void> loginUser(BuildContext context) async {
//     try {
//       OverlayServices.to.showOverlay(context);
//       final requestBody = json.encode({
//         "email": logInFormkey.value.currentState?.value["email"] ?? "",
//         "password": logInFormkey.value.currentState?.value["password"] ?? "",
//         "timezone": "Asia/Karachi",
//         "fcm_token": "abc",
//       });
//       final response = await dio.post(
//         AppUrls.login,
//         data: requestBody,
//         options: Options(),
//       );
//       if (response.statusCode == 200) {
//         Get.offAll(const HomeView());   --> Company Page
//       } else {
//         OverlayServices.to.showSnackBar(color: AppColor.appRed, message: 'Failed to log in');
//         throw Exception('Failed to log in');
//       }
//     } catch (error) {
//       OverlayServices.to.showSnackBar(color: AppColor.appRed, message: error.toString());
//       throw Exception('Failed to log in');
//     } finally {
//       OverlayServices.to.hideOverlay();
//     }
//   }
}
