import 'package:flutter/cupertino.dart';
import 'package:t_library_dashboard/models/auth_response.dart';
import '../services/authentication.dart';

class AuthNotifier with ChangeNotifier {
  AuthResponse? _authResponse;
  final _auth = Auth();

  Future<bool> signIn(String email, String password) async {
    try {
      _authResponse = await _auth.signIn(email, password);
      print('loggedIn');
      notifyListeners();
      return true;
    } on Exception catch (e) {
      print(e);
      return false;
    }
  }

  void signOut() {
    _authResponse = null;
    notifyListeners();
  }

  String? get token {
    return _authResponse?.token;
  }
}
