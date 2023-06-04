import 'package:get/get.dart';

import '../company_page.dart';
import '../dashboard.dart';
import '../modules/home/bindings/home_binding.dart';
import '../modules/home/views/home_view.dart';
import '../modules/signin/bindings/signin_binding.dart';
import '../modules/signin/views/signin_view.dart';
import '../modules/splash/bindings/splash_binding.dart';
import '../modules/splash/views/splash_view.dart';
import '../pages/account_settings_dummy.dart';
import '../pages/navigation_dummy.dart';
import '../pages/vat_calculator.dart';

//part 'app_routes.dart';

abstract class Routes {
  Routes._();
  static const home = _Paths.home;
  static const splash = _Paths.splash;
  static const signin = _Paths.signin;
  static const companyPage = _Paths.companyPage;
  static const dashboard = _Paths.dashboard;
  static const vatCalc = _Paths.vatCalc;
  static const dummyPage1 = _Paths.vatCalc;
  static const dummyPage2 = _Paths.vatCalc;
}

abstract class _Paths {
  _Paths._();
  static const home = '/home';
  static const splash = '/splash';
  static const signin = '/signin';
  static const companyPage = '/companyPage';
  static const dashboard = '/dashboard';
  static const vatCalc = '/vatCalc';
  static const dummyPage1 = '/dummyPage1';
  static const dummyPage2 = '/dummyPage2';
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
    GetPage(name: _Paths.companyPage, page: () => const CompanyPage()),
    GetPage(name: _Paths.dashboard, page: () => const Dashboard()),
    GetPage(name: _Paths.vatCalc, page: () => const VatCalculatorPage()),
    GetPage(name: _Paths.dummyPage1, page: () => const NavigationPage()),
    GetPage(name: _Paths.dummyPage2, page: () => const NavigationPageDos()),
  ];
}
