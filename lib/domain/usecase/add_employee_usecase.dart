
import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/domain/params/add_employee_param.dart';
import 'package:employeeapp/domain/repository/data_repository.dart';
import 'package:employeeapp/domain/usecase/usecase.dart';

class AddNewEmployeeUseCase extends UseCase<Map<String,dynamic>, AddNewEmployeeParams> {
  final DataRepository _dataRepository;

  AddNewEmployeeUseCase(this._dataRepository);
  @override
  Future<Either<AppError, Map<String,dynamic>>> call(AddNewEmployeeParams params) async {
    Map<String, dynamic> newParams = {};
     newParams.addAll(params.toMap());
    return await _dataRepository.addNewEmployee(newParams,params.profileImage,params.resume);
  }
}
