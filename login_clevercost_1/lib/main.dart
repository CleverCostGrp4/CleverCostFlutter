import 'package:login_clevercost_1/modules/splash/bindings/splash_binding.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:login_clevercost_1/routes/app_page.dart';

void main() {
  runApp(
    GetMaterialApp(
      debugShowCheckedModeBanner: false,
      title: "Application",
      initialRoute: AppPages.initial,
      initialBinding: SplashBinding(),
      getPages: AppPages.routes,
    ),
  );
}
