import 'package:flutter/material.dart';

class CustomTextField extends StatelessWidget {
  const CustomTextField({super.key, required this.HintText, this.isObscureText, this.suffixIcon, this.controller, required this.validator});



  final bool? isObscureText;
  final Widget? suffixIcon;
  final TextEditingController? controller;
  final Function(String?) validator;
final String HintText;
  @override
  Widget build(BuildContext context) {
    return
    TextFormField(
      controller: controller,
      validator: (value) {
        return validator(value);
      },
      obscureText: isObscureText ?? false,


    cursorColor: Colors.amber,
    decoration: InputDecoration(
        suffixIcon: suffixIcon,



    filled: true,
    fillColor:Color(0xff7CACEEFF),
    hintText: HintText,

    hintStyle: TextStyle(
    color: Colors.grey,
    ),
    enabledBorder: OutlineInputBorder(
    borderRadius: BorderRadius.circular(32),
    borderSide: BorderSide(color: Color(0xff7cacee)),
    ),
    border: OutlineInputBorder(
    borderRadius: BorderRadius.all(Radius.circular(16)),
    borderSide: BorderSide(
    color: Colors.black12,
    ))),
    );
  }
}