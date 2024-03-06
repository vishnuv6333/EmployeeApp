import 'dart:convert';
import 'package:employeeapp/domain/entities/user_entities.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';

class AuthController extends GetxController {
  AuthController() {
    getUser();
    observeUser();
  }

  final box = GetStorage();
  UserEntity? _userEntity;
  String? intro;
  bool? visited;

  UserEntity? get user => _userEntity;

  getUser() async {
    String? jsonUser = box.read("user");
    if (jsonUser != null) {
      _userEntity = UserEntity.fromJson(jsonDecode(jsonUser.toString()));
    }
  }

  observeUser() {
    box.listenKey("user", (user) {
      if (user != null) {
        _userEntity = UserEntity.fromJson(jsonDecode(user));
      } else {
        _userEntity = null;
      }
    });
    box.listenKey("intro", (user) {
      if (user != null) {
        visited = true;
      } else {
        visited = null;
      }
    });
  }
}
