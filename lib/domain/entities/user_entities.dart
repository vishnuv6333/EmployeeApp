import 'package:equatable/equatable.dart';

class UserEntity extends Equatable {
  final String? token;

  const UserEntity({
    required this.token,
  });

  factory UserEntity.fromJson(Map<String, dynamic> userJson) {
    return UserEntity(
      token: userJson["access_token"],
    );
  }
  Map<String, dynamic> toJson() {
    Map<String, dynamic> userJson = {};
    userJson.addAll({
      "access_token": token,
    });
    return userJson;
  }

  @override
  List<Object?> get props => [];
}
