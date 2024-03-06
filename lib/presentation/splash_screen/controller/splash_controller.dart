import 'package:employeeapp/presentation/login/controller/auth_controller.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:get/get.dart';

class SplashScreenController extends GetxController {
  @override
  void onInit() {
    AuthController authController = Get.find();
    Future.delayed(const Duration(seconds: 3)).then((val) async {
      if (authController.user == null) {
        Get.offAllNamed(RouteList.login);
      } else {
        Get.offAllNamed(RouteList.employeelist);
      }
    });
    super.onInit();
  }
}
