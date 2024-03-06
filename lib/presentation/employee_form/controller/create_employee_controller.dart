import 'dart:io';

import 'package:employeeapp/core/utils/image_service.dart';
import 'package:employeeapp/core/utils/logger.dart';
import 'package:employeeapp/domain/params/add_employee_param.dart';
import 'package:employeeapp/domain/params/degintionlist_param.dart';
import 'package:employeeapp/domain/usecase/add_employee_usecase.dart';
import 'package:employeeapp/domain/usecase/designation_list_usecase.dart';
import 'package:file_picker/file_picker.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class AddEmployeeController extends GetxController {
  TextEditingController nameSectionController = TextEditingController();
  TextEditingController lastNameController = TextEditingController();
  TextEditingController mobileSectionController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addresseSectionController = TextEditingController();
  TextEditingController dateOfBirthSectionController = TextEditingController();
  TextEditingController destinationSectionController = TextEditingController();
  TextEditingController resumeSectionController = TextEditingController();
  DesignationListUseCase designationListUseCase = Get.find();
  AddNewEmployeeUseCase addNewEmployeeUseCase = Get.find();
  var selectDate = "Select Date of Birth".obs;
  var statuses = ["select", "Male", "Female"];
  var status = "select".obs;
  var isloading = false.obs;
  var isloadingdes = false.obs;
  var getDes = false.obs;
  int size = 10;
  int page = 1;
  var hasmore = true.obs;
  var designation = [].obs;
  var optionId = "0".obs;
  var imagepath = "".obs;
  changeStatus(value) {
    status.value = value;
  }

  getdesignation() async {
    isloadingdes.value = true;
    page = 1;
    hasmore.value = true;
    designation.value = [];
    if (!getDes.value) {
      await getDesignations();
    }
    getDes.value = !getDes.value;
  }

  pickFile() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowedExtensions: ['pdf', 'doc'],
      type: FileType.custom,
    );
    if (result != null) {
      Logger.log("path${result.paths.toString()}");

      resumeSectionController.text = result.paths
          .toString()
          .substring(1, result.paths.toString().length - 1);
    } else {
      // User canceled the picker
    }
  }

  getDesignations() async {
    DesignationListParams designationListParams =
        DesignationListParams(size: size.toString(), page: page.toString());
    final response = await designationListUseCase(designationListParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.data.data.length < size) {
        hasmore.value = false;
      }
      designation.addAll(r.data.data);

      page++;
    });
    isloadingdes.value = false;
  }

  addNewEmployee() async {
    isloading.value = true;
    AddNewEmployeeParams addNewEmployeeParams = AddNewEmployeeParams(
        firstname: nameSectionController.text,
        landline: mobileSectionController.text,
        lastname: lastNameController.text,
        joiningDate: dateOfBirthSectionController.text,
        mobile: mobileSectionController.text,
        gender: status.value,
        status: "TEMPORERY",
        presentAddress: addresseSectionController.text,
        destinationId: optionId.value,
        dateofBirth: dateOfBirthSectionController.text,
        email: emailController.text,
        permenentaddress: addresseSectionController.text,
        profileImage: imagepath.value != ''
            ? {"profile_picture": File(imagepath.value)}
            : {},
        resume: imagepath.value != ''
            ? {"resume": File(resumeSectionController.text)}
            : {});
    final response = await addNewEmployeeUseCase(addNewEmployeeParams);
    response.fold((l) => l.handleError(), (r) {
      Get.back();
    });
    isloading.value = false;
  }

  getImage() async {
    final frontimage = await ImageService().getImage(Get.context);
    if (frontimage != null) {
      imagepath.value = frontimage.path.toString();
    }
  }

  selectDesignation(val) {
    optionId.value = val;
    getDes.value = false;
  }
}
