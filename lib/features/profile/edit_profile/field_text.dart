
import 'package:drop_down_list/drop_down_list.dart';
import 'package:drop_down_list/model/selected_list_item.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../../../constants/app_color.dart';

class AppTextFieldADD extends StatefulWidget {
  final TextEditingController textEditingController;
  final String title;
  final String hint;
  final bool isCitySelected;
  final List<SelectedListItem>? cities;


  const AppTextFieldADD({
    required this.textEditingController,
    required this.title,
    required this.hint,
    required this.isCitySelected,
    this.cities,

    Key? key,
  }) : super(key: key);

  @override
  _AppTextFieldADDState createState() => _AppTextFieldADDState();
}

class _AppTextFieldADDState extends State<AppTextFieldADD> {
  /// This is on text changed method which will display on city text field on changed.
  void onTextFieldTap() {

    DropDownState(
      DropDown(
        isDismissible: true,
        bottomSheetTitle:  Text(
          widget.title,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20.0,
          ),
        ),
        submitButtonChild: const Text(
          'Done',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        clearButtonChild: const Text(
          'Clear',
          style: TextStyle(
            fontSize: 16,
            fontWeight: FontWeight.bold,
          ),
        ),
        data: widget.cities ?? [],
        selectedItems: (List<dynamic> selectedList) {
          print(selectedList.indexed);
          List<String> list = [];
          for (var item in selectedList) {
            if (item is SelectedListItem) {
              list.add(item.name);
              widget.textEditingController.text=item.name;
            }
          }
          showSnackBar(list.toString());
        },
        enableMultipleSelection: false,
      ),
    ).showModal(context);
  }

  void showSnackBar(String message) {
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(content: Text(message)));
  }

  @override
  Widget build(BuildContext context) {

    return Padding(
      padding: const EdgeInsets.only(left: 20.0,right: 20),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          // Text(widget.title),
          const SizedBox(
            height: 5.0,
          ),
          TextFormField(
            style: TextStyle(
                color: Colors.black
            ),
            readOnly: true,
            controller: widget.textEditingController,
            cursorColor: Colors.black,
            onTap: widget.isCitySelected
                ? () {
              FocusScope.of(context).unfocus();
              onTextFieldTap();
            }
                : null,

            decoration: InputDecoration
              (

              fillColor:AppColor.secondaryColor,
              labelText: widget.title,
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

            ),

          ),
          const SizedBox(
            height: 15.0,
          ),
        ],
      ),
    );
  }

}