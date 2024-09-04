
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';


returnLogo(file){
  var ex=  (file.path);
  if(ex=='.jpg'){
    return Icon(Icons.image,color: Colors.green,);}
  else if(ex=='.docx'){
    return Icon(Icons.picture_in_picture_alt,color: Colors.green,);}
  else {
    return Icon(Icons.picture_as_pdf_rounded,color: Colors.red,);}
}
class TextF extends StatelessWidget {

  final String hint;
  Function(String?)? validator;
  TextEditingController? controller;
  Widget? suffixIcon;
  int? maxL;
  int? minL;


  TextF( {super.key, required this.hint,this.maxL,this.minL , this.controller,this.suffixIcon , this.validator, });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,

        children: [

          TextFormField(
            style: TextStyle(
                color: Colors.black
            ),
            maxLines: maxL,
            minLines: minL,
            controller: controller,
            cursorColor: Colors.amber,
            autofocus: false,
            decoration: InputDecoration
              (

              fillColor:AppColor.secondaryColor,
              labelText: hint ,
              labelStyle: TextStyle(
                fontSize: 16,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
              filled: true,
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(32),
                borderSide: BorderSide(color: Color(0xff7cacee)),
              ),
              focusedBorder: OutlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.black12,
                  )
              ),
              suffixIcon: suffixIcon,
            ),
            // readOnly: reado,
            validator: (value) {
              return validator!(value);
            },
          ),
        ],
      ),
    );

  }

}
