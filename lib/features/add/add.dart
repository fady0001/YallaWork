import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart'as http;
import 'package:untitled3/core/helpers/extensions.dart';
import 'package:untitled3/features/add/widget/shared_preferences.dart';
import 'package:untitled3/networking/api_constants.dart';


import '../../constants/app_localizations.dart';
import '../../core/routing/routes.dart';

class MyDialogScreen extends StatefulWidget {
  @override
  _MyDialogScreenState createState() => _MyDialogScreenState();
}

class _MyDialogScreenState extends State<MyDialogScreen> {
  String token=  CachData.getData(key: 'access_token');
  Future<void> CheckIfUserAddedInfo() async {
    var headers = {
      'Accept': 'application/json',
      'Authorization': 'Bearer ${token}',
    };
    print('ssssssssssssssssssssssssssssssssssssssssssssss ${token}');
    var request = http.Request('GET', Uri.parse('${ApiConstants.apiBaseUrl}information/added'));
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {

      String responseBody = await response.stream.bytesToString();


      var jsonResponse = json.decode(responseBody);

      if (jsonResponse['result'] != null) {
        int resultValue = jsonResponse['result'];
        if (resultValue == 1) {
          print(resultValue);
          context.pushNamed(Routes.homeScreen);
        } else  {
          print(resultValue);
          context.pushNamed(Routes.addinformation);
        }
      } else {

        print("nooooooooooooooooooooooooooooo");
      }


    } else {
      // context.pushNamed(Routes.addinformation);
      print('${response.reasonPhrase}');
      print('${response.statusCode}');
    }
  }
  @override
  void initState() {
    super.initState();
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _showMyDialog();
    });
  }

  Future<void> _showMyDialog() async {
    return showDialog<void>(
      context: context,
      barrierDismissible: false,
      builder: (BuildContext context) {
        return AlertDialog(
          icon:Icon(Icons.access_alarm_outlined),
          content: SingleChildScrollView(
            child: ListBody(
              children: <Widget>[
                Text(AppLocalizations.of(context)!.translate("loginSuccess")),

              ],
            ),
          ),
          actions: <Widget>[
            TextButton(
              child:Text(AppLocalizations.of(context)!.translate("continue")),
              onPressed: () {
                CheckIfUserAddedInfo();
              },
            ),
          ],
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(

    );
  }
}
