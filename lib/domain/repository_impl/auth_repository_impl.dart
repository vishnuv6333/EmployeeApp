import 'dart:io';
import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/data/data_resource/auth_local_data_resource.dart';
import 'package:employeeapp/data/data_resource/auth_remote_data_resource.dart';
import 'package:employeeapp/domain/repository/auth_repositorty.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';

import '../../domain/entities/user_entities.dart';

class AuthenticationRepositoryImpl implements AuthenticationRepository {
  final AuthenticationRemoteDataSource _authenticationRemoteDataSource;
  // ignore: unused_field
  final AuthenticationLocalDataSource _authenticationLocalDataSource;
  AuthenticationRepositoryImpl(this._authenticationLocalDataSource,
      this._authenticationRemoteDataSource);

  @override
  Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params) async {
    try {
      final response = await _authenticationRemoteDataSource.login(params);
      UserEntity? user;

      if (response['data'] != null) {
        user = UserEntity(
          token: response['data']['access_token'],
        );
        _authenticationLocalDataSource.saveUser(user);
      }
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
