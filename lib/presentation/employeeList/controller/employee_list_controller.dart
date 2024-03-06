import 'package:employeeapp/domain/params/employee_list_params.dart';
import 'package:employeeapp/domain/usecase/employee_list_usecase.dart';
import 'package:get/get.dart';

class EmployeeListController extends GetxController {
  var isloading = false.obs;
  var size = 10;
  int page = 1;
  var epmloyeelist = [].obs;
  var hasmore = true.obs;
  EmployeeListUseCase employeeListUseCase = Get.find();

  getEmployee() async {
    EmployeeListParams employeeListParams =
        EmployeeListParams(size: size.toString(), page: page.toString());
    final response = await employeeListUseCase(employeeListParams);
    response.fold((l) => l.handleError(), (r) {
      if (r.data.data.length < size) {
        hasmore.value = false;
      }
      epmloyeelist.addAll(r.data.data);
      page++;
    });
    isloading.value=false;
  }

  Future refreshData() async {
    isloading.value = true;
    page = 1;
    hasmore.value = true;
    epmloyeelist.value = [];
    await getEmployee();
  }
}
