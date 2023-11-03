import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/app/router/app_pages.dart';
import 'package:get/get.dart';

class HomePageController extends GetxController {
  logOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAllNamed(Routes.signInPage);
    });
  }
}
