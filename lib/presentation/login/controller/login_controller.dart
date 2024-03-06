import 'package:employeeapp/core/utils/logger.dart';
import 'package:employeeapp/domain/params/auth_params.dart';
import 'package:employeeapp/domain/usecase/login_usecase.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class LoginController extends GetxController {
  TextEditingController emailController = TextEditingController();
  TextEditingController passwordController = TextEditingController();
  LoginUsecase loginUsecase = Get.find();

  var isloading = false.obs;
  var buttoncheck = true.obs;
  checkText() {
    if (passwordController.text != "" || emailController.text != "") {
      buttoncheck.value = false;
    } else {
      buttoncheck.value = true;
    }
  }

  userLogin() async {
    isloading.value = true;
    AuthParams authParams = AuthParams(
        password: passwordController.text, email: emailController.text);
    Logger.log(authParams.toMap());
    final response = await loginUsecase(authParams);
    response.fold((l) => l.handleError(), (r) {
      Get.offAllNamed(RouteList.employeelist);
    });
    isloading.value = false;
  }
}
