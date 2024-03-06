
import 'package:employeeapp/core/constants/api_constant.dart';
import '../apiClient/api_client.dart';

abstract class AuthenticationRemoteDataSource {
  Future<Map<String, dynamic>> login(Map<String, dynamic> params);
}

class AuthenticationRemoteDataSourceImpl
    implements AuthenticationRemoteDataSource {
  final ApiClient _apiClient;
  AuthenticationRemoteDataSourceImpl(this._apiClient);

  @override
  Future<Map<String, dynamic>> login(Map<String, dynamic> params) async {
    final response = await _apiClient.post(ApiConstants.login, params);
    return response;
  }
}
