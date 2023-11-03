import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';
import '../controllers/sign_up_controller.dart';

class SignUpView extends GetView<SignUpController> {
  const SignUpView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(SignUpController());
    return Scaffold(
        backgroundColor: Colors.white.withOpacity(.95),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 350,
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
                      top: 20,
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
                      margin: const EdgeInsets.only(top: 110),
                      child: const Center(
                        child: Text(
                          "Sign Up",
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
                              height: 210,
                              // reverse: true,
                              // fit: BoxFit.cover,
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
                                        controller: controller.signUpemail,
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
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]!))),
                                      child: Obx(
                                        () => TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          obscureText:
                                              controller.passwordVisible.value
                                                  ? false
                                                  : true,
                                          validator: (value) {
                                            return controller
                                                .validatePass(value);
                                          },
                                          controller: controller.signUppass,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Container(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0, vertical: 3),
                                      decoration: BoxDecoration(
                                          border: Border(
                                              bottom: BorderSide(
                                                  color: Colors.grey[100]!))),
                                      child: Obx(
                                        () => TextFormField(
                                          autovalidateMode: AutovalidateMode
                                              .onUserInteraction,
                                          obscureText:
                                              controller.passwordVisible.value
                                                  ? false
                                                  : true,
                                          validator: (value) {
                                            return controller
                                                .validateConfirmPass(value);
                                          },
                                          controller: controller.confirmPass,
                                          decoration: InputDecoration(
                                            border: InputBorder.none,
                                            hintText: "Confirm Password",
                                            hintStyle: TextStyle(
                                                color: Colors.grey[400]),
                                          ),
                                        ),
                                      ),
                                    ),
                                    Obx(
                                      () => Row(
                                        children: [
                                          SizedBox(
                                            height: 35,
                                            width: 40,
                                            child: Checkbox(
                                              value: controller
                                                  .passwordVisible.value,
                                              onChanged: (bool? value) {
                                                controller.passwordVisible
                                                    .value = value!;
                                                print(value);
                                              },
                                            ),
                                          ),
                                          const Text(
                                            "Show password",
                                            style: TextStyle(fontSize: 13),
                                          ),
                                        ],
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
                          controller.signUpCLick();
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
                                      "Sign Up",
                                      style: TextStyle(
                                          color: Colors.white,
                                          fontWeight: FontWeight.bold),
                                    ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextButton(
                        onPressed: () {
                          Get.back();
                        },
                        child: const Text(
                          "You have an account ? Login",
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
