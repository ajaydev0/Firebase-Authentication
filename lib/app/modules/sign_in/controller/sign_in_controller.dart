import 'package:flutter/widgets.dart';
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
  TextEditingController logInemail = TextEditingController();
  TextEditingController logInpass = TextEditingController();

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

  logInClick() {
    // FirebaseAuth.instance
    //     .signInWithCredential(signInemail.text, signInpass.text);
    print("Login Click");
  }

  @override
  void onClose() {
    logInemail.dispose();
    logInpass.dispose();
    super.onClose();
  }
}
