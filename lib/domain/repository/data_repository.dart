import 'dart:io';

import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/presentation/employeeList/model/employee_list_model.dart';
import 'package:employeeapp/presentation/employee_form/model/designation_model.dart';

abstract class DataRepository {
  Future<Either<AppError, EmployeeListModel>> listEmployee(
      Map<String, dynamic> params);
  Future<Either<AppError, DesignationListModel>> listdesignation(
      Map<String, dynamic> params);
  Future<Either<AppError, Map<String,dynamic>>> addNewEmployee(
    Map<String, dynamic> params,
    Map<String, File>? image,
    Map<String, File>? image2,
  );
}
