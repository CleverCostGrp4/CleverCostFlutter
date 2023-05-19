import 'package:get/get.dart';

import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../modules/company/views/company_view.dart';
import '../modules/company/bindings/company_binding.dart';

//part 'app_routes.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const splash = _Paths.splash;
  static const signin = _Paths.signin;
  static const company = _Paths.company;
}

abstract class _Paths {
  _Paths._();
  static const company = '/company';
  static const home = '/home';
  static const splash = '/splash';
  static const signin = '/signin';
}

class AppPages {
  AppPages._();

  static const initial = Routes.splash;

  static final routes = [
    GetPage(
      name: _Paths.home,
      page: () => const HomeView(),
      binding: HomeBinding(),
    ),
    GetPage(
      name: _Paths.splash,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Paths.signin,
      page: () => const SigninView(),
      binding: SigninBinding(),
    ),
    GetPage(
      name: _Paths.company,
      page: () => CompanyView(),
      binding: CompanyBinding(),
    )
  ];
}
