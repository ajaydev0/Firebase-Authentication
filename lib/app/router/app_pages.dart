import 'package:get/get.dart';

import '../modules/homePage/bindings/home_page_binding.dart';
import '../modules/homePage/views/home_page_view.dart';
import '../modules/sign_Up/bindings/sign_up_binding.dart';
import '../modules/sign_Up/views/sign_up_view.dart';
import '../modules/sign_in/binding/sign_in_binding.dart';
import '../modules/sign_in/view/sign_in_view.dart';
import '../modules/splash_screen/binding/splash_binding.dart';
import '../modules/splash_screen/view/splash_view.dart';

part 'app_routes.dart';

class AppPages {
  static const initialPage = Routes.splashScreen;
  static final pages = [
    GetPage(
      name: _Path.splashScreen,
      page: () => const SplashView(),
      binding: SplashBinding(),
    ),
    GetPage(
      name: _Path.signInPage,
      page: () => const SignInView(),
      binding: SignInBinding(),
    ),
    GetPage(
      name: Routes.signUpPage,
      page: () => const SignUpView(),
      binding: SignUpBinding(),
    ),
    GetPage(
      name: Routes.homePage,
      page: () => const HomePageView(),
      binding: HomePageBinding(),
    ),
  ];
}
