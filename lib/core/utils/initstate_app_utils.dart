import 'package:employeeapp/di/di.dart';
import 'package:get/get.dart';

class InitialBindings extends Bindings {
  @override
  dependencies() async {
    DependencyInjection.init();
  }
}
