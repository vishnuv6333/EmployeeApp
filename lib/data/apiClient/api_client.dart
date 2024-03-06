// ignore_for_file: depend_on_referenced_packages
import 'dart:convert';
import 'dart:io';

import 'package:employeeapp/core/constants/api_constant.dart';
import 'package:employeeapp/core/utils/logger.dart';
import 'package:employeeapp/core/utils/snackbar_utils.dart';
import 'package:employeeapp/data/data_resource/auth_local_data_resource.dart';
import 'package:employeeapp/presentation/login/controller/auth_controller.dart';
import 'package:employeeapp/routes/route_constants.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/exceptions/exceptions.dart';
import 'package:http/http.dart';
// ignore: implementation_imports
import "package:http/src/multipart_file.dart" as multipart;
// ignore: implementation_imports,
import 'package:http/src/response.dart' as res;
import 'package:http_parser/http_parser.dart';

class ApiClient {
  final Client _client;
  AuthenticationLocalDataSource authenticationLocalDataSource = Get.find();

  ApiClient(this._client);

  Future<Map<String, dynamic>> fakeRequest(String path, String params) async {
    await Future.delayed(const Duration(seconds: 3));
    return {"name": "pranav"};
  }

  dynamic get(String path, {Map<dynamic, dynamic>? params}) async {
    AuthController authController = Get.find();
    final response = await _client.get(
      getPath(path),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.token}'
            : "",
      },
    );
    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      showMessage("session expied");
      authenticationLocalDataSource.deleteUser();
      Get.offAllNamed(RouteList.login);
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic post(String path, Map<dynamic, dynamic> params) async {
    Logger.log("sxcdbdhsbvdhdsv");
    AuthController authController = Get.find();
    final response = await _client.post(
      getPath(path),
      body: jsonEncode(params),
      headers: {
        'Content-Type': 'application/json',
        'Authorization': authController.user != null
            ? 'Bearer ${authController.user!.token}'
            : "",
      },
    );
    if (response.statusCode == 200) {
      final responseJson = json.decode(response.body);

      return responseJson;
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  dynamic formData(
      {required Map<String, dynamic> data,
      required Map<String, File> images,
      required Map<String, File> images2,
      required String path}) async {
    AuthController authController = Get.find();

    var request =
        MultipartRequest("POST", Uri.parse(ApiConstants.baseUrl + path));
    request.headers.addAll({
      'Authorization': authController.user != null
          ? 'Bearer ${authController.user!.token}'
          : "",
    });
    data.forEach((key, value) {
      if (value is List) {
        for (var element in value) {
          final index = value.indexOf(element);
          final fieldString = "$key[$index]";
          request.fields[fieldString] = element.toString();
        }
      } else {
        request.fields[key] = value.toString();
      }
    });

    // ignore: avoid_function_literals_in_foreach_calls, unrelated_type_equality_checks
    if (images != '') {
      images.forEach((key, value) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
            key, value.path,
            contentType: MediaType("image", "jpeg"));
        request.files.add(multipartFile);
      });
    }
    // ignore: unrelated_type_equality_checks
    if (images2 != '') {
      images2.forEach((key, value) async {
        var multipartFile = await multipart.MultipartFile.fromPath(
            key, value.path,
            contentType: MediaType("pdf", "doc"));
        request.files.add(multipartFile);
      });
    }
  
    final response = await request.send();
    print(response.statusCode);
    var httpResponse = await res.Response.fromStream(response);
    print(httpResponse.body);
    final jsonresposne = json.decode(httpResponse.body);
    Logger.log(jsonresposne);
    return jsonresposne;
  }

  dynamic deleteWithBody(String path, {Map<dynamic, dynamic>? params}) async {
    Request request = Request('DELETE', getPath(path));
    request.headers['Content-Type'] = 'application/json';
    request.body = jsonEncode(params);
    final response = await _client.send(request).then(
          (value) => res.Response.fromStream(value),
        );

    if (response.statusCode == 200) {
      return json.decode(response.body);
    } else if (response.statusCode == 401) {
      throw UnauthorizedException();
    } else {
      throw Exception(response.reasonPhrase);
    }
  }

  Uri getPath(String path, {Map<dynamic, dynamic>? params}) {
    Logger.log(path);
    return Uri.parse('${ApiConstants.baseUrl}$path');
  }
}
