import 'package:flutter/material.dart';

class LoginTextField extends StatefulWidget {
  final String hint;
  final bool password;
  bool obsecure;
  final TextInputType? keyboardType;
  final String? Function(String?)? validator;
  final void Function(String?)? save;

  LoginTextField({
    this.password = false,
    required this.hint,
    this.keyboardType,
    this.obsecure = false,
    this.validator,
    this.save,
  });

  @override
  _LoginTextFieldState createState() => _LoginTextFieldState();
}

class _LoginTextFieldState extends State<LoginTextField> {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: TextFormField(
        keyboardType: widget.keyboardType,
        obscureText: widget.obsecure,
        decoration: InputDecoration(
          suffixIcon: widget.password
              ? GestureDetector(
                  child: Icon(widget.obsecure
                      ? Icons.visibility
                      : Icons.visibility_off),
                  onTap: () {
                    setState(() => widget.obsecure = !widget.obsecure);
                  })
              : null,
          enabledBorder:
              textFieldBorder(Theme.of(context).cardColor.withOpacity(0.4)),
          focusedBorder:
              textFieldBorder(Theme.of(context).cardColor.withOpacity(0.4)),
          errorBorder: textFieldBorder(Colors.red.withOpacity(0.4)),
          focusedErrorBorder: textFieldBorder(Colors.red.withOpacity(0.4)),
          fillColor: Theme.of(context).cardColor.withOpacity(0.4),
          filled: true,
          hintText: widget.hint,
          hintStyle: TextStyle(color: Colors.white.withOpacity(0.4)),
        ),
        cursorColor: Colors.black,
        validator: widget.validator,
        onSaved: widget.save,
      ),
    );
  }

  OutlineInputBorder textFieldBorder(Color color) {
    return OutlineInputBorder(
      borderRadius: BorderRadius.all(Radius.circular(25)),
      borderSide: BorderSide(color: color),
    );
  }
}
