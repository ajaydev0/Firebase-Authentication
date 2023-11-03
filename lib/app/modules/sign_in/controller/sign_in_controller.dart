import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/app/router/app_pages.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class SignInController extends GetxController {
  @override
  void onInit() {
    isLoading = false.obs;
    super.onInit();
  }

  late RxBool isLoading;
  RxBool passwordVisible = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController logInemail = TextEditingController();
  late final TextEditingController logInpass = TextEditingController();

  // Validation Email  TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }
    if (!value.trim().contains("@gmail.com")) {
      return "Email is not valid";
    }
    return null;
  }

  // Validation Password TextFormFeild
  validatePass(value) {
    if (value == null || value.trim().isEmpty) {
      return " Requied";
    } else if (value.trim().toString().length < 6) {
      return " Requied 6 character";
    }

    return null;
  }

  logInClick() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .signInWithEmailAndPassword(
                email: logInemail.text, password: logInpass.text);
        if (userCredential.user != null) {
          Get.offAllNamed(Routes.homePage);
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar("Error", "User Not Found",
            backgroundColor: Colors.white.withOpacity(.5));
        isLoading.value = false;
      }
    }
  }
}
