import 'package:flutter/material.dart';
import 'package:untitled3/constants/app_color.dart';
class Cities extends StatefulWidget {
  const Cities({super.key});

  @override
  State<Cities> createState() => _CitiesState();
}
TextEditingController city =TextEditingController();
class _CitiesState extends State<Cities> {
  List<String> cityList = ['Damascuse' ,'Daraa'];
  String? selectcity = 'City';
  @override
  Widget build(BuildContext context) {
    return  Center(
      child: Padding(
        padding: const EdgeInsets.only(left: 20,right: 20.0),
        child: Container(

          child:DropdownButtonFormField<String>(

            //  cursorColor: Colors.amber,
              autofocus: false,
              decoration: InputDecoration
                (
counterText: city.text,
                fillColor:AppColor.secondaryColor,
                labelText: 'City' ,
                labelStyle: TextStyle(
                  fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                filled: true,
                enabledBorder: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide(color:AppColor.primaryColor),
                ),
                focusedBorder: OutlineInputBorder(
                    borderSide: BorderSide(
                      color: Colors.black12,
                    )
                ),
              ),

              items: cityList.map((item) => DropdownMenuItem(
                value: item,
                child: Text(item,style: TextStyle( fontSize: 16,
                  fontWeight: FontWeight.w400,
                  color: Colors.black,)),
              )).toList() ,
              onChanged: (item)=> setState(()
              =>cityList =item as List<String>)
          ),
        ),
      ),
    );
  }
}
