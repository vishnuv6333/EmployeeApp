import 'package:employeeapp/data/apiClient/api_client.dart';
import 'package:employeeapp/data/data_resource/auth_local_data_resource.dart';
import 'package:employeeapp/data/data_resource/auth_remote_data_resource.dart';
import 'package:employeeapp/data/data_resource/remote_data_resource.dart';
import 'package:employeeapp/domain/repository/auth_repositorty.dart';
import 'package:employeeapp/domain/repository/data_repository.dart';
import 'package:employeeapp/domain/repository_impl/auth_repository_impl.dart';
import 'package:employeeapp/domain/repository_impl/data_repository_impl.dart';
import 'package:employeeapp/domain/usecase/add_employee_usecase.dart';
import 'package:employeeapp/domain/usecase/designation_list_usecase.dart';
import 'package:employeeapp/domain/usecase/employee_list_usecase.dart';
import 'package:employeeapp/domain/usecase/login_usecase.dart';
import 'package:employeeapp/presentation/employeeList/controller/employee_list_controller.dart';
import 'package:employeeapp/presentation/employee_details/controller/employee_details_controller.dart';
import 'package:employeeapp/presentation/employee_form/controller/create_employee_controller.dart';
import 'package:employeeapp/presentation/login/controller/auth_controller.dart';
import 'package:employeeapp/presentation/login/controller/login_controller.dart';
import 'package:get/get.dart';
import 'package:http/http.dart';

class DependencyInjection {
  static init() {
    Get.lazyPut(() => AuthController(), fenix: true);
     Get.lazyPut(() => AddEmployeeController(), fenix: true);
    Get.lazyPut(() => EmployeeDetailsController(), fenix: true);
    Get.lazyPut(() => LoginController(), fenix: true);
    Get.lazyPut(() => EmployeeListController(), fenix: true);
    Get.lazyPut(() => LoginUsecase(Get.find()), fenix: true);
    Get.lazyPut(() => EmployeeListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => DesignationListUseCase(Get.find()), fenix: true);
    Get.lazyPut(() => AddNewEmployeeUseCase(Get.find()), fenix: true);
    Get.lazyPut<AuthenticationRepository>(
        () => AuthenticationRepositoryImpl(Get.find(), Get.find()),
        fenix: true);
    Get.lazyPut<RemoteDataSource>(() => RemoteDataSourceImpl(Get.find()),
        fenix: true);
    Get.lazyPut<AuthenticationLocalDataSource>(
        () => AuthenticationLocalDataSourceImpl(),
        fenix: true);
    Get.lazyPut<AuthenticationRemoteDataSource>(
        () => AuthenticationRemoteDataSourceImpl(Get.find()),
        fenix: true);
      Get.lazyPut<DataRepository>(
        () => DataRepositoryImpl(Get.find(), Get.find()),
        fenix: true);
     Get.lazyPut(() => ApiClient(Client()), fenix: true);
  }
}
