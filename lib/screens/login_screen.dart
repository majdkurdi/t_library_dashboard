import 'package:flutter/material.dart';
import '../widgets/login_text_field.dart';
import '../widgets/login_button.dart';

class LoginScreen extends StatefulWidget {
  @override
  _LoginScreenState createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final formKey = GlobalKey<FormState>();
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
                          height: 20,
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
                                  return 'please provide a valid email!';
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
                                if (val != null && val.length >= 8) {
                                  return null;
                                } else {
                                  return 'Weak Password!';
                                }
                              },
                              save: (val) {
                                password = val;
                              },
                            ),
                          ],
                        ),
                        LoginButton(
                          onTap: () {
                            if (formKey.currentState!.validate()) {
                              formKey.currentState!.save();
                            }
                          },
                        ),
                        SizedBox(height: 20),
                        // TextButton(
                        //   child: Text(
                        //     'Sign Up',
                        //     style: Theme.of(context)
                        //         .textTheme
                        //         .headline6!
                        //         .copyWith(fontSize: 15),
                        //   ),
                        //   onPressed: () {},
                        // )
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
