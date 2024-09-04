import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
class CustomTextField extends StatelessWidget {
  CustomTextField({this.HintText});
  String? HintText;
  @override
  Widget build(BuildContext context) {
    return TextField(
      cursorColor: Colors.amber,
      decoration: InputDecoration(
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
              ))
      ),
    );
  }
}

