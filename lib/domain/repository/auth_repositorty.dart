import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';

abstract class AuthenticationRepository {
   Future<Either<AppError, Map<String, dynamic>>> login(
      Map<String, dynamic> params);
}
