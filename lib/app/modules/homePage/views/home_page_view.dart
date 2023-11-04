import 'package:flutter/material.dart';
import 'package:get/get.dart';
import '../controllers/home_page_controller.dart';
import 'logOut.dart';

class HomePageView extends GetView<HomePageController> {
  const HomePageView({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
    Get.put(HomePageController());
    return Scaffold(
        floatingActionButton: FloatingActionButton.extended(
            backgroundColor: const Color.fromRGBO(143, 148, 251, .6),
            onPressed: () => controller.addTodoClick(),
            label: const Text(
              "Add Todo",
              style: TextStyle(color: Colors.white),
            )),
        appBar: AppBar(
          backgroundColor: const Color.fromRGBO(143, 148, 251, .6),
          actions: [
            Padding(
              padding: const EdgeInsets.symmetric(horizontal: 20),
              child: IconButton(
                  onPressed: () {
                    logOutBox(context);
                  },
                  icon: const Icon(Icons.logout)),
            )
          ],
          title: const Text("HomePage"),
        ),
        backgroundColor: Colors.white.withOpacity(.95),
        body: Obx(() => controller.isEmpty.value
            ? const Center(
                child: Text(
                  "No Items Here",
                  style: TextStyle(fontSize: 25),
                ),
              )
            : Padding(
                padding: const EdgeInsets.only(top: 10),
                child: ListView.builder(
                  itemCount: 5,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding:
                          const EdgeInsets.only(left: 10, right: 10, top: 0),
                      child: Card(
                        child: ListTile(
                          onTap: () {},
                          leading: CircleAvatar(
                              backgroundColor:
                                  const Color.fromRGBO(143, 148, 251, .6),
                              child: Text(
                                "${index + 1}",
                                style: TextStyle(color: Colors.white),
                              )),
                          title: const Text(
                            "title",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          subtitle: const Text(
                            "description",
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                          trailing: PopupMenuButton(
                            onSelected: (value) {
                              if (value == "Edit") {
                                //Open Edit Page
                              } else if (value == "Delete") {
                                //Delete And Remove this Item
                              }
                            },
                            itemBuilder: (context) {
                              return [
                                const PopupMenuItem(
                                  value: "Edit",
                                  child: Text("Edit"),
                                ),
                                const PopupMenuItem(
                                  value: "Delete",
                                  child: Text("Delete"),
                                ),
                              ];
                            },
                          ),
                        ),
                      ),
                    );
                  },
                ),
              )));
  }
}
