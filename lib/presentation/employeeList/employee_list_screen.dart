import 'package:employeeapp/core/utils/skelton_loader.dart';
import 'package:employeeapp/data/data_resource/auth_local_data_resource.dart';
import 'package:employeeapp/presentation/employeeList/controller/employee_list_controller.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:employeeapp/widgets_common/image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class HomeScreen extends GetWidget<EmployeeListController> {
  const HomeScreen({super.key});

  @override
  Widget build(BuildContext context) {
    controller.refreshData();
    AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();

    ScrollController scrollController = ScrollController();
    void onScroll() {
      double maxscroll = scrollController.position.maxScrollExtent;
      double currentscroll = scrollController.position.pixels;
      if (maxscroll == currentscroll && controller.hasmore.value) {
        controller.getEmployee();
      }
    }

    scrollController.addListener(onScroll);

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 160, 180, 195),
        title: const Text("Employee "),
        actions: [
          Padding(
            padding: const EdgeInsets.all(20),
            child: InkWell(
                onTap: () {
                  showDialog<bool>(
                      context: context,
                      builder: (context) {
                        return AlertDialog(
                          content: const Text('Are you sure you want to exit?'),
                          actions: <Widget>[
                            ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(10),
                                child: Text('No'),
                              ),
                              onPressed: () {
                                Get.back();
                              },
                            ),
                            ElevatedButton(
                              child: const Padding(
                                padding: EdgeInsets.all(8.0),
                                child: Text('Yes'),
                              ),
                              onPressed: () {
                                authenticationLocalDataSource.deleteUser();
                                Get.offAllNamed(RouteList.login);
                              },
                            ),
                          ],
                        );
                      });
                },
                child: const Text("Log Out")),
          )
        ],
      ),
      body: Column(
        children: [
          Obx(
            () => Expanded(
              child: controller.isloading.value
                  ? ListView.builder(
                      shrinkWrap: true,
                      itemCount: 10,
                      itemBuilder: (context, index) {
                        return Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: 12, vertical: 5),
                          child: Skelton(
                            width: MediaQuery.of(context).size.width - 24,
                            height: 90,
                          ),
                        );
                      })
                  : RefreshIndicator(
                      onRefresh: () {
                        return controller.refreshData();
                      },
                      child: controller.epmloyeelist.isEmpty
                          ? ElevatedButton(
                              onPressed: () {
                                controller.refreshData();
                              },
                              child: const Center(child: Text("Refresh")))
                          : ListView.builder(
                              controller: scrollController,
                              itemCount: controller.hasmore.value
                                  ? controller.epmloyeelist.length + 1
                                  : controller.epmloyeelist.length,
                              shrinkWrap: true,
                              itemBuilder: (context, index) {
                                if (index < controller.epmloyeelist.length) {
                                  return Padding(
                                    padding: const EdgeInsets.only(bottom: 20),
                                    child: ListTile(
                                      onTap: () {
                                        Get.toNamed(RouteList.employeedetails,
                                            arguments: [
                                              controller.epmloyeelist[index]
                                                  .profileImage,
                                              controller.epmloyeelist[index]
                                                  .firstName,
                                              controller
                                                  .epmloyeelist[index].mobile
                                                  .toString(),
                                              controller
                                                  .epmloyeelist[index].email,
                                              controller.epmloyeelist[index]
                                                  .dateOfBirth,
                                              controller
                                                  .epmloyeelist[index].gender,
                                              controller.epmloyeelist[index]
                                                  .presentAddress,
                                            ]);
                                      },
                                      leading: CustomImageView(
                                        imagePath: controller
                                                    .epmloyeelist[index]
                                                    .profileImage ==
                                                ""
                                            ? "assets/img/userimage_empty.svg"
                                            : controller.epmloyeelist[index]
                                                .profileImage,
                                        height: 60,
                                        width: 60,
                                        fit: BoxFit.cover,
                                        radius: BorderRadius.circular(
                                          30,
                                        ),
                                        margin: const EdgeInsets.only(left: 2),
                                      ),
                                      title: Text(
                                        controller
                                            .epmloyeelist[index].firstName,
                                        style: Theme.of(context)
                                            .textTheme
                                            .headlineSmall,
                                      ),
                                      subtitle: Text(
                                          controller.epmloyeelist[index].mobile
                                              .toString(),
                                          style: Theme.of(context)
                                              .textTheme
                                              .headlineSmall!
                                              .copyWith(
                                                  color: Colors.grey,
                                                  fontSize: 15)),
                                    ),
                                  );
                                } else {
                                  const Center(
                                      child: CircularProgressIndicator());
                                }
                                return null;
                              }),
                    ),
            ),
          )
        ],
      ),
      floatingActionButton: FloatingActionButton(
        backgroundColor: Colors.blue,
        onPressed: () {
          Get.toNamed(RouteList.addemployee);
        },
        child: const Icon(
          Icons.add,
          color: Colors.white,
          size: 29,
        ),
      ),
    );
  }
}
