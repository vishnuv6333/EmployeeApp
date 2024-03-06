import 'package:equatable/equatable.dart';

class AuthParams extends Equatable {
  final String email;
  final String password;

  const AuthParams({
    required this.email,
    required this.password,
  });

  Map<String, dynamic> toMap() {
    return {"email": email, "password": password};
  }

  @override
  List<Object?> get props => [];
}
