import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

import '../../../router/app_pages.dart';

class SignUpController extends GetxController {
  @override
  void onInit() {
    isLoading = false.obs;
    super.onInit();
  }

  late RxBool isLoading;

  RxBool passwordVisible = true.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  TextEditingController signUpemail = TextEditingController();
  TextEditingController signUppass = TextEditingController();
  @override
  void onClose() {
    signUpemail.dispose();
    signUppass.dispose();
    super.onClose();
  }

  // Validation Email  TextFormFeild
  validateEmail(value) {
    if (value == null || value.trim().isEmpty) {
      return " Required";
    }
    if (!value.trim().contains("@gmail.com") && !value.trim().contains(".")) {
      return "Email is not valid";
    }
    return null;
  }

  // Validation Password TextFormFeild
  validatePass(value) {
    if (value == null || value.trim().isEmpty) {
      return " Requied";
    }

    return null;
  }
//

  Future<void> signUpCLick() async {
    Future.delayed(const Duration(seconds: 2));
    FirebaseAuth.instance
        .createUserWithEmailAndPassword(
            email: signUpemail.text, password: signUppass.text)
        .then((value) {
      isLoading = false.obs;
      Get.offAllNamed(Routes.signInPage);
      Get.snackbar("Success", "User Added SuccessFul");
    });
  }
}
