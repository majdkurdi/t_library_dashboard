import 'dart:convert';
import 'package:http/http.dart' as http;
import '../models/auth_response.dart';

const String baseUrl = 'http://127.0.0.1:8000/api';

class Auth {
  Auth._privateConstructor();

  static Auth? _instance;

  factory Auth() {
    if (_instance == null) {
      _instance = Auth._privateConstructor();
    }
    return _instance!;
  }

  Future<AuthResponse> signIn(String email, String password) async {
    try {
      final response = await http.post(Uri.parse('$baseUrl/loginAdmin'),
          body: {'email': email, 'password': password});
      return AuthResponse.fromJson(jsonDecode(response.body));
    } on Exception catch (e) {
      throw e;
    }
  }
}
