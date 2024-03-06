
import 'package:dartz/dartz.dart';
import 'package:employeeapp/core/constants/app_error.dart';
import 'package:employeeapp/domain/repository/auth_repositorty.dart';
import 'package:employeeapp/domain/usecase/usecase.dart';
import '../params/auth_params.dart';


class LoginUsecase extends UseCase<Map<String, dynamic>, AuthParams> {
  final AuthenticationRepository _authenticationRepository;

  LoginUsecase(this._authenticationRepository);
  @override
  Future<Either<AppError, Map<String, dynamic>>> call(AuthParams params) async {
    Map<String, dynamic> newParams = {};
    newParams.addAll(params.toMap());
    return await _authenticationRepository.login(newParams);
  }
}
