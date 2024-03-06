import 'dart:io';

import 'package:employeeapp/core/constants/api_constant.dart';
import 'package:employeeapp/presentation/employeeList/model/employee_list_model.dart';
import 'package:employeeapp/presentation/employee_form/model/designation_model.dart';
import '../apiClient/api_client.dart';

abstract class RemoteDataSource {
  Future<EmployeeListModel> listEmployee(Map<String, dynamic> params);
  Future<DesignationListModel> listdesignation(Map<String, dynamic> params);
  Future<Map<String, dynamic>> addNewEmployee(Map<String, dynamic> params,
      Map<String, File> image, Map<String, File> image2);
}

class RemoteDataSourceImpl extends RemoteDataSource {
  final ApiClient _apiClient;

  RemoteDataSourceImpl(this._apiClient);
  @override
  Future<Map<String, dynamic>> addNewEmployee(Map<String, dynamic> params,
      Map<String, File> image, Map<String, File> image2) async {
    final response = await _apiClient.formData(
        images: image,
        images2: image2,
        path: ApiConstants.addemployee,
        data: params);
    return response;
  }

  @override
  Future<EmployeeListModel> listEmployee(Map<String, dynamic> params) async {
    final response = await _apiClient.get(
        "${ApiConstants.listEmployee}?page=${params["page"]}&size=${params["size"]}");
    return EmployeeListModel.fromJson(response);
  }

  @override
  Future<DesignationListModel> listdesignation(
      Map<String, dynamic> params) async {
    final response = await _apiClient.get(
        "${ApiConstants.listDesignations}?page=${params["page"]}&size=${params["size"]}");
    return DesignationListModel.fromJson(response);
  }
}
