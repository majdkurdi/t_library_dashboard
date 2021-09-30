import 'package:http/http.dart' as http;
import '../models/user.dart';

const String url = 'ldhjdb';

class Auth {
  late final Auth auth;

  Auth._privateConstructor();

  static late final Auth? _instance;

  factory Auth() {
    if (_instance == null) {
      _instance = Auth._privateConstructor();
    }
    return _instance!;
  }

  Future<User> signIn(String email, String password) async {
    final response = await http.post(Uri.parse(url));
  }
}
