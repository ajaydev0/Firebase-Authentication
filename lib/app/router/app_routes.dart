part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const signInPage = _Path.signInPage;
  static const signUpPage = _Path.signUpPage;
  static const homePage = _Path.homePage;
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const signInPage = "/SignInPage";
  static const signUpPage = '/sign-up';
  static const homePage = '/home-page';
}
