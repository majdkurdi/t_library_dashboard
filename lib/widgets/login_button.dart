import 'package:flutter/material.dart';

class LoginButton extends StatelessWidget {
  final Function()? onTap;
  final bool loading;
  LoginButton({
    required this.onTap,
    required this.loading,
  });
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: GestureDetector(
        onTap: onTap,
        child: Container(
          height: 40,
          width: 120,
          decoration: BoxDecoration(
            border: Border.all(color: Colors.white.withOpacity(0.1)),
            borderRadius: BorderRadius.all(Radius.circular(18)),
            color: Colors.white.withOpacity(0.5),
          ),
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 18),
            child: Center(
              child: loading
                  ? Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation(
                              Theme.of(context).primaryColor)),
                    )
                  : Text(
                      'Log in',
                      style: TextStyle(color: Colors.black, fontSize: 20),
                    ),
            ),
          ),
        ),
      ),
    );
  }
}
