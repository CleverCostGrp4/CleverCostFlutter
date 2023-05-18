import 'package:login_clevercost_1/services/overlay_services.dart';
import 'package:get/get.dart';

import '../../../routes/app_page.dart';

class SplashController extends GetxController {
  @override
  void onReady() {
    _nextscreen();
    super.onReady();
  }

  void _nextscreen() {
    Future.delayed(
      const Duration(seconds: 2),
      (() {
        Get.put(OverlayServices());
        Get.offNamed(Routes.signin);
      }),
    );
  }
}
