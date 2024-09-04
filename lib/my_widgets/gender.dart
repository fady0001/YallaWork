import 'package:flutter/material.dart';
import 'package:untitled3/constants/app_color.dart';
class Gender extends StatefulWidget {
  const Gender({super.key});

  @override
  State<Gender> createState() => _GenderState();
}
TextEditingController gender =TextEditingController();
class _GenderState extends State<Gender> {
  List<String> ganderList = ['Male' ,'Female'];
  String? selectgander = 'Male';
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20.0),
        child: Container(


         child:  DropdownButtonFormField<String>(

            //  cursorColor: Colors.amber,
              autofocus: false,
              decoration: InputDecoration
                (
counterText: gender.text,
                fillColor:AppColor.secondaryColor,
                labelText: 'Gender' ,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color: AppColor.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: AppColor.primaryColor,
                    )

                ),

              ),

              items: ganderList.map((item) => DropdownMenuItem(

                value: item,
                child: Text(item,style: TextStyle( fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,)),

              )).toList() ,

              onChanged: (item)=> setState(()

              =>ganderList =item as List<String>

              )
             

          ),
        ),
      ),
    );
  }
}
