import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import '../notifiers/auth_notifier.dart';
import '../widgets/login_text_field.dart';
import '../widgets/login_button.dart';

final authProvider = StateProvider<AuthNotifier>((ref) => AuthNotifier());

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
  bool loading = false;
  String? email;
  String? password;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
          decoration: BoxDecoration(
            image: DecorationImage(
                image: AssetImage('assets/login_background.png'),
                fit: BoxFit.cover),
          ),
          child: Center(
            child: Row(
              mainAxisSize: MainAxisSize.max,
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Container(
                  height: MediaQuery.of(context).size.height,
                  width: MediaQuery.of(context).size.width / 4,
                  child: Form(
                    key: formKey,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      children: [
                        SizedBox(
                          height: 30,
                        ),
                        Padding(
                          padding: const EdgeInsets.symmetric(vertical: 20),
                          child: Text(
                            'T.Library',
                            style: Theme.of(context)
                                .textTheme
                                .headline6!
                                .copyWith(fontSize: 40),
                          ),
                        ),
                        Column(
                          children: [
                            LoginTextField(
                              hint: 'Email',
                              keyboardType: TextInputType.emailAddress,
                              validator: (val) {
                                if (val != null &&
                                    val.contains('@') &&
                                    val.contains('.')) {
                                  return null;
                                } else {
                                  return 'Please provide a valid email!';
                                }
                              },
                              save: (val) {
                                email = val;
                              },
                            ),
                            LoginTextField(
                              hint: 'Password',
                              password: true,
                              obsecure: true,
                              validator: (val) {
                                if (val != null && val.length >= 6) {
                                  return null;
                                } else {
                                  return 'Short Password!';
                                }
                              },
                              save: (val) {
                                password = val;
                              },
                            ),
                          ],
                        ),
                        Consumer(builder: (context, watch, child) {
                          final auth = watch(authProvider);
                          return LoginButton(
                            loading: loading,
                            onTap: () async {
                              if (formKey.currentState!.validate()) {
                                formKey.currentState!.save();
                                setState(() => loading = true);
                                final loggedIn =
                                    await auth.state.signIn(email!, password!);
                                setState(() => loading = false);
                                if (loggedIn) {
                                  //navigation
                                } else {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Error!, check your connection and try again.')));
                                }
                              }
                            },
                          );
                        }),
                        SizedBox(height: 20),
                      ],
                    ),
                  ),
                ),
                SizedBox(width: MediaQuery.of(context).size.width / 8)
              ],
            ),
          )),
    );
  }
}
