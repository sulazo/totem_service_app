import 'package:flutter/material.dart';

class TextFormFieldX extends StatelessWidget {
  final String hintX;
  final Function onChangedX;
  final Function validatorX;
  final bool obscure;
  final controllerX;

  TextFormFieldX(
      {@required this.hintX,
      @required this.onChangedX,
      this.validatorX,
      this.controllerX,
      this.obscure});

  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controllerX,
      validator: validatorX,
      autovalidateMode: AutovalidateMode.always,
      // autovalidateMode:true ,
      textAlign: TextAlign.center,
      obscureText: obscure,
      onChanged: onChangedX,
      decoration: InputDecoration(
        hintText: hintX,
        //'Enter your password.',
        contentPadding: EdgeInsets.symmetric(vertical: 10.0, horizontal: 20.0),
        border: OutlineInputBorder(
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        enabledBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 1.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
        focusedBorder: OutlineInputBorder(
          borderSide: BorderSide(color: Colors.lightBlueAccent, width: 2.0),
          borderRadius: BorderRadius.all(Radius.circular(32.0)),
        ),
      ),
    );
  }
}
