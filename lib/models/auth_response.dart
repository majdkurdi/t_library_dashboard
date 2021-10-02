import 'dart:convert';
import './user.dart';

AuthResponse authResponseFromJson(String str) =>
    AuthResponse.fromJson(json.decode(str));

class AuthResponse {
  AuthResponse({
    required this.user,
    required this.token,
  });

  final User user;
  final String token;

  factory AuthResponse.fromJson(Map<String, dynamic> json) => AuthResponse(
        user: User.fromJson(json["user"]),
        token: json["token"],
      );
}
