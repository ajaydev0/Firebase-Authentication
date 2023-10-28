part of 'app_pages.dart';

abstract class Routes {
  Routes._();
  static const splashScreen = _Path.splashScreen;
  static const signInPage = _Path.signInPage;
  static const SIGN_UP = '/sign-up';
}

abstract class _Path {
  _Path._();
  static const splashScreen = "/";
  static const signInPage = "/SignInPage";
}
