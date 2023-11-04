import 'package:firebase_auth_project/app/router/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controller/sign_in_controller.dart';

class SignInView extends GetView<SignInController> {
  const SignInView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SignInController());
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.95),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 400,
                decoration: const BoxDecoration(
                    image: DecorationImage(
                        image: AssetImage('assets/background.png'),
                        fit: BoxFit.fill)),
                child: Stack(
                  children: [
                    Positioned(
                      left: 30,
                      width: 80,
                      height: 200,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-1.png'))),
                      ),
                    ),
                    Positioned(
                      left: 140,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/light-2.png'))),
                      ),
                    ),
                    Positioned(
                      right: 40,
                      top: 40,
                      width: 80,
                      height: 150,
                      child: Container(
                        decoration: const BoxDecoration(
                            image: DecorationImage(
                                image: AssetImage('assets/clock.png'))),
                      ),
                    ),
                    Positioned(
                        child: Container(
                      margin: const EdgeInsets.only(top: 50),
                      child: const Center(
                        child: Text(
                          "Login",
                          style: TextStyle(
                              color: Colors.white,
                              fontSize: 40,
                              fontWeight: FontWeight.bold),
                        ),
                      ),
                    )),
                  ],
                ),
              ),
              Obx(
                () => Padding(
                  padding: const EdgeInsets.all(30.0),
                  child: Column(
                    children: [
                      controller.isLoading.value
                          ? Lottie.asset(
                              "assets/lottie/loading.json",
                              height: 120,
                            )
                          : Container(
                              padding: const EdgeInsets.all(5),
                              decoration: BoxDecoration(
                                  color: Colors.white,
                                  borderRadius: BorderRadius.circular(10),
                                  boxShadow: const [
                                    BoxShadow(
                                        color:
                                            Color.fromRGBO(143, 148, 251, .2),
                                        blurRadius: 20.0,
                                        offset: Offset(0, 10))
                                  ]),
                              child: Form(
                                key: controller.formKey,
                                child: Column(
                                  children: [
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 3),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]!))),
                                      child: TextFormField(
                                        autovalidateMode:
                                            AutovalidateMode.onUserInteraction,
                                        validator: (value) {
                                          return controller
                                              .validateEmail(value);
                                        },
                                        controller: controller.logInemail,
                                        decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Email",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400])),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 3),
                                      child: Obx(
                                        () => TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          obscureText:
                                              controller.passwordVisible.value,
                                          validator: (value) {
                                            return controller
                                                .validatePass(value);
                                          },
                                          controller: controller.logInpass,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]),
                                            suffixIcon: IconButton(
                                              icon: Icon(controller
                                                      .passwordVisible.value
                                                  ? Icons.visibility_off
                                                  : Icons.visibility),
                                              onPressed: () {
                                                controller
                                                        .passwordVisible.value =
                                                    !controller
                                                        .passwordVisible.value;
                                                print(controller
                                                    .passwordVisible.value);
                                              },
                                            ),
                                          ),
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ),
                      const SizedBox(
                        height: 30,
                      ),
                      InkWell(
                        splashColor: Colors.black,
                        borderRadius: BorderRadius.circular(10),
                        onTap: () {
                          // Get.offAllNamed(Routes.homePage);
                          controller.logInClick();
                        },
                        child: Obx(
                          () => Container(
                            height: 50,
                            decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(10),
                                gradient: const LinearGradient(colors: [
                                  Color.fromRGBO(143, 148, 251, 1),
                                  Color.fromRGBO(143, 148, 251, .6),
                                ])),
                            child: Center(
                              child: controller.isLoading.value
                                  ? const CupertinoActivityIndicator(
                                      color: Colors.black,
                                    )
                                  : const Text(
                                      "Login",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: [
                          TextButton(
                            onPressed: () {},
                            child: const Text(
                              "Forgot Password?",
                              style: TextStyle(
                                  fontSize: 12,
                                  color: Color.fromRGBO(143, 148, 251, 1)),
                            ),
                          ),
                        ],
                      ),
                      TextButton(
                        onPressed: () {
                          Get.toNamed(Routes.signUpPage);
                        },
                        child: const Text(
                          "Don't have account ? Sign Up",
                          style: TextStyle(
                              color: Color.fromRGBO(143, 148, 251, 1)),
                        ),
                      ),
                    ],
                  ),
                ),
              )
            ],
          ),
        ));
  }
}
