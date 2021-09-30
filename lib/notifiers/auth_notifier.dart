import 'package:flutter/cupertino.dart';
import '../models/user.dart';
import '../services/authentication.dart';

class AuthNotifier with ChangeNotifier {
  late User currentUser;
  final auth = Auth();

  Future<void> signIn(String email, String password) async {
    currentUser = await auth.signIn(email, password);
  }
}
