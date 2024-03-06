
import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/domain/params/degintionlist_param.dart';
import 'package:employeeapp/domain/repository/data_repository.dart';
import 'package:employeeapp/domain/usecase/usecase.dart';
import 'package:employeeapp/presentation/employee_form/model/designation_model.dart';

class DesignationListUseCase extends UseCase<DesignationListModel, DesignationListParams> {
  final DataRepository _dataRepository;

  DesignationListUseCase(this._dataRepository);
  @override
  Future<Either<AppError, DesignationListModel>> call(DesignationListParams params) async {
    Map<String, dynamic> newParams = {};
     newParams.addAll(params.toMap());
    return await _dataRepository.listdesignation(newParams);
  }
}
