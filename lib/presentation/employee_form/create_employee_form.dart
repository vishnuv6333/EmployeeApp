import 'package:dropdown_button2/dropdown_button2.dart';
import 'package:employeeapp/core/utils/snackbar_utils.dart';
import 'package:employeeapp/core/utils/validation_functions.dart';
import 'package:employeeapp/presentation/employee_form/controller/create_employee_controller.dart';
import 'package:employeeapp/theme/button_style.dart';
import 'package:employeeapp/theme/theme.dart';
import 'package:employeeapp/widgets_common/elevated_button.dart';
import 'package:employeeapp/widgets_common/image_view.dart';
import 'package:employeeapp/widgets_common/textstyle.dart';
import 'package:employeeapp/widgets_common/textformfield.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:intl/intl.dart';

class CreateEmployeeForm extends GetWidget<AddEmployeeController> {
  const CreateEmployeeForm({super.key});

  @override
  Widget build(BuildContext context) {
    final GlobalKey<FormState> formKey = GlobalKey<FormState>();

    return Scaffold(
      appBar: AppBar(
        elevation: 0,
        backgroundColor: const Color.fromARGB(255, 160, 180, 195),
        leading: GestureDetector(
            onTap: () {
              Get.back();
            },
            child: const Icon(Icons.arrow_back_ios)),
        title: Text(
          "Add an Employee",
          style: Theme.of(context).textTheme.headlineSmall,
        ),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              Form(
                  key: formKey,
                  child: SizedBox(
                      width: double.maxFinite,
                      child: Column(children: [
                        const SizedBox(height: 11),
                        Center(
                          child: Obx(
                            () => Stack(
                              children: [
                                InkWell(
                                  onTap: () {
                                    controller.getImage();
                                  },
                                  child: CustomImageView(
                                    imagePath: controller.imagepath.value == ""
                                        ? "assets/img/userimage_empty.svg"
                                        : controller.imagepath.value,
                                    height: 90,
                                    width: 90,
                                    fit: BoxFit.fill,
                                    radius: BorderRadius.circular(
                                      50,
                                    ),
                                    margin: const EdgeInsets.only(left: 2),
                                  ),
                                ),
                                Positioned(
                                    bottom: 1,
                                    right: 1,
                                    child: controller.imagepath.value == ""
                                        ? const Icon(Icons.edit)
                                        : const SizedBox())
                              ],
                            ),
                          ),
                        ),
                        defaultSpacerVerticalMedium,
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Name *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildNameSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Last Name *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildLNameSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Mobile *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildNumberSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Email *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildEmailSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Address *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildAddressSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Date of Birth *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildDateofBirthSection(context),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Designation *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _builddesSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Gender *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildGenderSection(),
                        defaultSpacerVerticalMedium,
                        Align(
                          alignment: Alignment.centerLeft,
                          child: Padding(
                              padding: const EdgeInsets.only(left: 30),
                              child: Text("Resume *".tr,
                                  style: theme.textTheme.titleMedium)),
                        ),
                        defaultSpacerVerticalMedium,
                        _buildResumeSection(),
                        defaultSpacerVerticalMedium,
                        defaultSpacerVerticalMedium,
                        Obx(
                          () => CustomElevatedButton(
                              isDisabled: false,
                              height: 50,
                              text: controller.isloading.value
                                  ? "Please wait.."
                                  : "Add Employee",
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 30),
                              buttonStyle: CustomButtonStyles.fillBlue,
                              buttonTextStyle:
                                  CustomTextStyles.bodyMediumBluegray40,
                              rightIcon: controller.isloading.value
                                  ? const Padding(
                                      padding: EdgeInsets.all(8.0),
                                      child: SizedBox(
                                        height: 20,
                                        width: 20,
                                        child: Center(
                                            child: CircularProgressIndicator(
                                          color: Colors.white,
                                        )),
                                      ),
                                    )
                                  : null,
                              onPressed: () {
                                if (formKey.currentState!.validate()) {
                                  if (controller.imagepath.value != "") {
                                    controller.addNewEmployee();
                                  } else {
                                    showMessage("Select a Image");
                                  }
                                }
                              }),
                        ),
                        defaultSpacerVerticalMedium,
                        defaultSpacerVerticalMedium,
                      ])))
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildNameSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomTextFormField(
          controller: controller.nameSectionController,
          hintText: "Enter Name".tr,
          hintStyle: CustomTextStyles.labelLargeGray900,
          validator: (value) {
            if (!isText(value) || value == '') {
              return "Please enter a valid name";
            }
            return null;
          }),
    );
  }

  Widget _buildLNameSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomTextFormField(
          controller: controller.lastNameController,
          hintText: "Enter Last Name".tr,
          hintStyle: CustomTextStyles.labelLargeGray900,
          validator: (value) {
            if (!isText(value) || value == '') {
              return "Please enter a valid name";
            }
            return null;
          }),
    );
  }

  Widget _buildNumberSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomTextFormField(
          textInputType: TextInputType.phone,
          controller: controller.mobileSectionController,
          hintText: "Enter number".tr,
          hintStyle: CustomTextStyles.labelLargeGray900,
          validator: (value) {
            if (!isValidPhone(value) || value == '') {
              return "Please enter a valid number";
            }
            return null;
          }),
    );
  }

  Widget _buildEmailSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomTextFormField(
          controller: controller.emailController,
          hintText: "Enter email".tr,
          hintStyle: CustomTextStyles.labelLargeGray900,
          validator: (value) {
            if (isValidEmail(value) || value == '') {
              return "Please enter a valid email";
            }
            return null;
          }),
    );
  }

  Widget _buildAddressSection() {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: CustomTextFormField(
          maxLines: 4,
          controller: controller.addresseSectionController,
          hintText: "Enter address".tr,
          hintStyle: CustomTextStyles.labelLargeGray900,
          validator: (value) {
            if (!isText(value) || value == '') {
              return "Please enter a valid address";
            }
            return null;
          }),
    );
  }

  Widget _buildDateofBirthSection(context) {
    return Padding(
      padding: const EdgeInsets.only(left: 30, right: 30),
      child: GestureDetector(
        onTap: () async {
          final DateTime? picked = await showDatePicker(
            context: context,
            initialDate: DateTime.now(),
            firstDate: DateTime(1900),
            lastDate: DateTime.now(),
          );
          // ignore: unrelated_type_equality_checks
          if (picked != null) {
            controller.dateOfBirthSectionController.text =
                DateFormat('yyyy-MM-dd').format(picked);
          }
        },
        child: CustomTextFormField(
            suffix: const Icon(
              Icons.arrow_drop_down_circle_outlined,
              size: 24,
            ),
            enabled: false,
            controller: controller.dateOfBirthSectionController,
            hintText: "Select Date of Birth".tr,
            hintStyle: CustomTextStyles.labelLargeGray900,
            validator: (value) {
              if (value == '') {
                return "Please select date of birth";
              }
              return null;
            }),
      ),
    );
  }

  Widget _buildResumeSection() {
    return Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(children: [
          GestureDetector(
            onTap: () {
              controller.pickFile();
            },
            child: CustomTextFormField(
                suffix: const Icon(
                  Icons.arrow_drop_down_circle_outlined,
                  size: 24,
                ),
                enabled: false,
                controller: controller.resumeSectionController,
                hintText: "Select resume".tr,
                hintStyle: CustomTextStyles.labelLargeGray900,
                validator: (value) {
                  if (value == '') {
                    return "Select Resume";
                  }
                  return null;
                }),
          )
        ]));
  }

  Widget _builddesSection() {
    ScrollController scrollController = ScrollController();
    void onScroll() {
      double maxscroll = scrollController.position.maxScrollExtent;
      double currentscroll = scrollController.position.pixels;
      if (maxscroll == currentscroll && controller.hasmore.value) {
        controller.getDesignations();
      }
    }

    scrollController.addListener(onScroll);
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: Column(
          children: [
            GestureDetector(
              onTap: () {
                controller.getdesignation();
              },
              child: CustomTextFormField(
                  suffix: const Icon(
                    Icons.arrow_drop_down_circle_outlined,
                    size: 24,
                  ),
                  enabled: false,
                  controller: controller.destinationSectionController,
                  hintText: "Select Designation".tr,
                  hintStyle: CustomTextStyles.labelLargeGray900,
                  validator: (value) {
                    if (value == '') {
                      return "Select Designation";
                    }
                    return null;
                  }),
            ),
            controller.getDes.value
                ? SizedBox(
                    height: 200,
                    child: ListView.builder(
                        controller: scrollController,
                        shrinkWrap: true,
                        itemCount: controller.hasmore.value
                            ? controller.designation.length + 1
                            : controller.designation.length,
                        itemBuilder: (context, index) {
                          if (index < controller.designation.length) {
                            return InkWell(
                              onTap: () {
                                controller.selectDesignation(controller
                                    .designation[index].id
                                    .toString());
                                controller.destinationSectionController.text =
                                    controller.designation[index].name;
                              },
                              child: Obx(
                                () => ListTile(
                                  title:
                                      Text(controller.designation[index].name),
                                  contentPadding: EdgeInsets.zero,
                                  leading: Radio(
                                    value: controller.optionId.value,
                                    groupValue: controller.designation[index].id
                                        .toString(),
                                    onChanged: (value) {},
                                  ),
                                ),
                              ),
                            );
                          } else {
                            return const Center(
                                child: CircularProgressIndicator());
                          }
                        }),
                  )
                : const SizedBox()
          ],
        ),
      ),
    );
  }

  Widget _buildGenderSection() {
    return Obx(
      () => Padding(
        padding: const EdgeInsets.only(left: 30, right: 30),
        child: DropdownButtonFormField2<String>(
          isExpanded: true,
          decoration: InputDecoration(
            enabledBorder: OutlineInputBorder(
              borderSide: BorderSide(color: appTheme.blueGray100),
            ),
            contentPadding: const EdgeInsets.symmetric(vertical: 16),
            border: OutlineInputBorder(
              borderRadius: BorderRadius.circular(11),
            ),
          ),
          hint: const Text(
            'Select status',
            style: TextStyle(
              color: Colors.black,
              fontSize: 13,
              fontWeight: FontWeight.w100,
            ),
          ),
          value: controller.status.value,
          items: controller.statuses
              .map((item) => DropdownMenuItem<String>(
                    value: item,
                    child: Text(
                      item,
                      style: const TextStyle(
                          fontSize: 13,
                          fontWeight: FontWeight.w100,
                          color: Colors.black),
                    ),
                  ))
              .toList(),
          validator: (value) {
            if (controller.status.value == "select") {
              return 'Please select gender.';
            }
            return null;
          },
          onChanged: (value) {
            controller.changeStatus(value);
          },
          onSaved: (value) {},
          buttonStyleData: const ButtonStyleData(
            padding: EdgeInsets.only(right: 8),
          ),
          iconStyleData: const IconStyleData(
            icon: Icon(
              Icons.arrow_drop_down,
              color: Colors.black45,
            ),
            iconSize: 24,
          ),
          dropdownStyleData: DropdownStyleData(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(15),
            ),
          ),
          menuItemStyleData: const MenuItemStyleData(
            padding: EdgeInsets.symmetric(horizontal: 16),
          ),
        ),
      ),
    );
  }
}
