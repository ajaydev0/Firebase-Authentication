import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/foundation.dart';
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

  RxBool passwordVisible = false.obs;
  GlobalKey<FormState> formKey = GlobalKey<FormState>();
  late final TextEditingController signUpemail = TextEditingController();
  late final TextEditingController signUppass = TextEditingController();
  late final TextEditingController confirmPass = TextEditingController();

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
      return " Required";
    } else if (value.trim().toString().length < 6) {
      return " Requied 6 character";
    }

    return null;
  }

  // Validation confirm Password TextFormFeild
  validateConfirmPass(value) {
    if (value == null || value.trim().isEmpty) return " Required";
    if (value != signUppass.text) return "Password not match";
    return null;
  }

  signUpCLick() async {
    if (formKey.currentState!.validate()) {
      try {
        isLoading.value = true;
        UserCredential userCredential = await FirebaseAuth.instance
            .createUserWithEmailAndPassword(
                email: signUpemail.text, password: signUppass.text);
        if (userCredential.user != null) {
          Get.offAllNamed(Routes.signInPage);
          Get.snackbar("Success", "User Added SuccessFul",
              backgroundColor: Colors.white.withOpacity(.5));
        }
        isLoading.value = false;
      } on FirebaseAuthException catch (e) {
        if (kDebugMode) {
          print(e);
        }
        Get.snackbar(
            "Error", "User already have an Account ! \nTry another Email",
            backgroundColor: Colors.white.withOpacity(.5));
        isLoading.value = false;
      }
    }
  }
}
