import 'package:flutter/material.dart';
import 'package:untitled3/constants/app_color.dart';


class BirthDay extends StatefulWidget {
  const BirthDay({super.key});

  @override
  State<BirthDay> createState() => _BirthDayState();
}
TextEditingController dateControoler =TextEditingController();
class _BirthDayState extends State<BirthDay> {

  @override
  Widget build(BuildContext context) {
    return   Padding(
      padding: EdgeInsets.only(left: 20,right: 20),
      child: TextFormField(

        cursorColor: Colors.amber,
        autofocus: false,
        controller: dateControoler,
        decoration: InputDecoration
          (
          fillColor:AppColor.secondaryColor,
          labelText: 'Birthday',  labelStyle: TextStyle(
          fontWeight: FontWeight.w400,
          fontSize: 16,
          color: Colors.grey,
        ),
          filled: true,
          suffixIcon: TextButton(
              onPressed: (){
                _selectDatem();
              },
              child: Icon(Icons.calendar_month,color: AppColor.primaryColor)),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(32),
            borderSide: BorderSide(color: AppColor.primaryColor),
          ),
          focusedBorder: OutlineInputBorder(
              borderSide: BorderSide(
                color: Colors.black12,
              )
          ),
        ),
        readOnly: true,

      ),
    );
  }
  Future<void> _selectDatem()async{

    DateTime? _picked =   await showDatePicker(context: context, firstDate: DateTime(1900), lastDate: DateTime(2050),
      initialDate: DateTime.now(),
      builder: (context, child)=> Theme(data:ThemeData().copyWith(
        colorScheme:ColorScheme.dark(
            primary: AppColor.secondaryColor,
            onPrimary: Colors.black,
            surface: AppColor.primaryColor,
            onSurface: Colors.black
        ),
        dialogBackgroundColor: Colors.white,
      ),
        child: Container(child: child),

      ),
    );
    if(_picked != null){
      setState(() {
        dateControoler.text = _picked.toString().split(" ")[0];
      });
    }
  }
}
