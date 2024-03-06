import 'package:employeeapp/presentation/employee_details/controller/employee_details_controller.dart';
import 'package:employeeapp/theme/app_decoration.dart';
import 'package:employeeapp/theme/theme.dart';
import 'package:employeeapp/widgets_common/image_view.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class EmployeeDetailsScreen extends GetWidget<EmployeeDetailsController> {
  const EmployeeDetailsScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 252, 252, 252),
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 160, 180, 195),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios_new)),
        title: Text(
          controller.arg[1],
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            defaultSpacerVerticalLarge,
            Center(
              child: CustomImageView(
                imagePath: controller.arg[0] == ""
                    ? "assets/img/userimage_empty.svg"
                    : controller.arg[0],
                height: 90,
                width: 90,
                fit: BoxFit.fill,
                radius: BorderRadius.circular(
                  50,
                ),
                margin: const EdgeInsets.only(left: 2),
              ),
            ),
            defaultSpacerVerticalMedium,
            Text(
              controller.arg[1],
              style: Theme.of(context).textTheme.headlineSmall,
            ),
            defaultSpacerVerticalSmall,
            Text(
              controller.arg[2],
              style: Theme.of(context)
                  .textTheme
                  .headlineSmall!
                  .copyWith(color: Colors.grey, fontSize: 15),
            ),
            defaultSpacerVerticalMedium,
            Container(
              padding: const EdgeInsets.all(20),
              margin: const EdgeInsets.symmetric(horizontal: 30),
              width: MediaQuery.of(context).size.width - 60,
              decoration: AppDecoration.outlineBlack900,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Contact Number\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              TextSpan(
                                text: controller.arg[2],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Email\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              TextSpan(
                                text: controller.arg[3],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  defaultSpacerVerticalMedium,
                  defaultSpacerVerticalMedium,
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Date of Birth\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              TextSpan(
                                text: DateFormat('dd-MM-yyyy')
                                    .format(controller.arg[4]),
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      ),
                      Expanded(
                        child: RichText(
                          text: TextSpan(
                            children: [
                              TextSpan(
                                text: "Gender\n",
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 16),
                              ),
                              TextSpan(
                                text: controller.arg[5],
                                style: Theme.of(context)
                                    .textTheme
                                    .titleLarge!
                                    .copyWith(fontSize: 18, color: Colors.grey),
                              ),
                            ],
                          ),
                          textAlign: TextAlign.left,
                        ),
                      )
                    ],
                  ),
                  defaultSpacerVerticalMedium,
                  defaultSpacerVerticalMedium,
                  RichText(
                    text: TextSpan(
                      children: [
                        TextSpan(
                          text: "Address\n",
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 16),
                        ),
                        TextSpan(
                          text: controller.arg[6],
                          style: Theme.of(context)
                              .textTheme
                              .titleLarge!
                              .copyWith(fontSize: 18, color: Colors.grey),
                        ),
                      ],
                    ),
                    textAlign: TextAlign.left,
                  )
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
