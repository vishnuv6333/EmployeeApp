
import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/domain/params/employee_list_params.dart';
import 'package:employeeapp/domain/repository/data_repository.dart';
import 'package:employeeapp/domain/usecase/usecase.dart';
import 'package:employeeapp/presentation/employeeList/model/employee_list_model.dart';

class EmployeeListUseCase extends UseCase<EmployeeListModel, EmployeeListParams> {
  final DataRepository _dataRepository;

  EmployeeListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, EmployeeListModel>> call(EmployeeListParams params) async {
    Map<String, dynamic> newParams = {};
     newParams.addAll(params.toMap());
    return await _dataRepository.listEmployee(newParams);
  }
}
