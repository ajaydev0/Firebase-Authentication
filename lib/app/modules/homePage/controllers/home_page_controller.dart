import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:firebase_auth_project/app/router/app_pages.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:lottie/lottie.dart';

class HomePageController extends GetxController {
  @override
  void onInit() {
    userData = FirebaseFirestore.instance
        .collection(FirebaseAuth.instance.currentUser!.uid);
    super.onInit();
  }

  late CollectionReference userData;
  dynamic titledata;
  // dynamic description;
  getData() async {
    titledata =
        await FirebaseFirestore.instance.collection("title").doc().get();
    // description =  await FirebaseFirestore.instance.collection("description").doc().get();
  }

  submit() async {
    isLoading.value = true;
    await userData.doc().set({
      "title": titleController.text,
      "description": descriptionController.text
    }).then((value) {
      Get.back();
      titleController.clear();
      descriptionController.clear();
      isLoading.value = false;
    });
  }

  GlobalKey<FormState> fromKey = GlobalKey<FormState>();
  //Controller
  late final TextEditingController titleController = TextEditingController();
  late final TextEditingController descriptionController =
      TextEditingController();
  RxBool isEmpty = false.obs;
  RxBool isLoading = false.obs;
  addTodoClick() {
    Get.dialog(Dialog(
      child: Form(
          key: fromKey,
          child: SizedBox(
            height: 282,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: Obx(
                () => Column(
                  children: [
                    isLoading.value
                        ? Lottie.asset(
                            "assets/lottie/loading.json",
                            height: 129,
                          )
                        : Container(
                            child: Column(
                              children: [
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return " Required";
                                    }
                                    return null;
                                  },
                                  controller: titleController,
                                  decoration:
                                      const InputDecoration(hintText: "Title"),
                                ),
                                TextFormField(
                                  autovalidateMode:
                                      AutovalidateMode.onUserInteraction,
                                  validator: (value) {
                                    if (value == null || value.trim().isEmpty) {
                                      return " Required";
                                    }
                                    return null;
                                  },
                                  controller: descriptionController,
                                  decoration: const InputDecoration(
                                    hintText: "Description",
                                  ),
                                  keyboardType: TextInputType.multiline,
                                  minLines: 3,
                                  maxLines: 3,
                                ),
                              ],
                            ),
                          ),
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                backgroundColor:
                                    const Color.fromARGB(153, 208, 209, 225)),
                            onPressed: () {
                              titleController.clear();
                              descriptionController.clear();
                            },
                            child: const Padding(
                              padding: EdgeInsets.all(15),
                              child: Text("Reset"),
                            )),
                        ElevatedButton(
                          style: ElevatedButton.styleFrom(
                              backgroundColor:
                                  const Color.fromRGBO(143, 148, 251, .6)),
                          onPressed: () {
                            if (fromKey.currentState!.validate()) {
                              submit();
                            }
                          },
                          child: Padding(
                            padding: const EdgeInsets.all(15),
                            child: isLoading.value
                                ? const SizedBox(
                                    height: 16,
                                    width: 45,
                                    child: FittedBox(
                                        child: CupertinoActivityIndicator()))
                                : const Text("Submit"),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ),
          )),
    ));
  }

  logOut() async {
    await FirebaseAuth.instance.signOut().then((value) {
      Get.offAllNamed(Routes.signInPage);
    });
  }
}
// isLoading.value
//                                   ? const CupertinoActivityIndicator()
//                                   : 