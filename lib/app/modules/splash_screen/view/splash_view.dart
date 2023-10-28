import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controller/splash_controller.dart';

class SplashView extends GetView<SplashController> {
  const SplashView({super.key});

  @override
  Widget build(BuildContext context) {
    Get.put(SplashController());

    return Scaffold(
      backgroundColor: Colors.white,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const SizedBox(height: 30),
            Container(
              height: 120,
              width: 120,
              decoration: const BoxDecoration(
                  shape: BoxShape.circle,
                  image: DecorationImage(
                      image: AssetImage("assets/firebase.png"))),
            ),
            const SizedBox(height: 10),
            const Text(
              "FireBase",
              style: TextStyle(fontSize: 20),
            ),
            const SizedBox(height: 15),
            const SizedBox(
                height: 25,
                width: 25,
                child: FittedBox(
                  child: CupertinoActivityIndicator(
                    color: Colors.black,
                  ),
                )),
          ],
        ),
      ),
    );
  }
}
