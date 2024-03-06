import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/data/data_resource/auth_local_data_resource.dart';
import 'package:employeeapp/data/data_resource/remote_data_resource.dart';
import 'package:employeeapp/presentation/employeeList/model/employee_list_model.dart';
import 'package:employeeapp/presentation/employee_form/model/designation_model.dart';
import 'package:employeeapp/presentation/login/controller/auth_controller.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'dart:io';

import '../repository/data_repository.dart';

class DataRepositoryImpl extends DataRepository {
  final RemoteDataSource _remoteDataSource;
  // ignore: unused_field
  final AuthenticationLocalDataSource _authenticationLocalDataSource;
  DataRepositoryImpl(
      this._remoteDataSource, this._authenticationLocalDataSource);

  AuthController authController = Get.find();
   @override
  Future<Either<AppError, Map<String,dynamic>>> addNewEmployee(
      Map<String, dynamic> params,
       Map<String, File>?  image,
        Map<String, File>?  image2) async {
    try {
      final response = await _remoteDataSource.addNewEmployee(params,image??{},image2??{});
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  @override
  Future<Either<AppError, EmployeeListModel>> listEmployee(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.listEmployee(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }
  @override
  Future<Either<AppError, DesignationListModel>> listdesignation(
      Map<String, dynamic> params) async {
    try {
      final response = await _remoteDataSource.listdesignation(params);
      return Right(response);
    } on SocketException {
      return Left(AppError(AppErrorType.network));
    } on UnauthorizedException {
      return Left(AppError(AppErrorType.unauthorised));
    } on Exception {
      return Left(AppError(AppErrorType.api));
    }
  }

}