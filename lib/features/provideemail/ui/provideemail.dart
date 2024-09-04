import 'dart:convert';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:http/http.dart' as http;
import 'package:untitled3/core/helpers/extensions.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../networking/api_constants.dart';
import '../../add/widget/shared_preferences.dart';

class ProvideEmail extends StatefulWidget {
  const ProvideEmail({super.key});

  @override
  State<ProvideEmail> createState() => _ProvideEmailState();
}

class _ProvideEmailState extends State<ProvideEmail> {
  Future ProvideEmail(String id)async{
    var headers = {
      'Accept': 'application/json',
      'Content-Type': 'application/json',
      //'Authorization': 'Bearer eyJ0eXAiOiJKV1QiLCJhbGciOiJSUzI1NiJ9.eyJhdWQiOiIxIiwianRpIjoiNGM3OTZiNDgyNWJmZWY0MGE0MjE0NDg0MjdiNzgyOTMxMDkwMTZmNGNiMjUzYzg5NWI4M2UxNDM1OTBmMGYyZmMzMGMxMWQwNGIzMWMxZmQiLCJpYXQiOjE3MTc0NDE5NDIuMDY2ODk5LCJuYmYiOjE3MTc0NDE5NDIuMDY2OTAzLCJleHAiOjE3NDg5Nzc5NDEuODQxMzEyLCJzdWIiOiIxIiwic2NvcGVzIjpbXX0.Llb0kTHoTgiaV93ahBdADKQx6cI5B8cU9U2THBz-4rz0HBUO_ZUmSiedUx14A1TiMQXJP-_6Tqflqf5Eg7FQSWoBlZTxYDzPMcAvHkj5WhlNsGOH7hHMBL1YpxjRoFh6k4j0RpmDTIZcfY5hR2DYuFgdOydAWQ8l4V7_uESTql5JxHBMN2QPOYZ_SkplElGjGyqwkD1Te7I9VjSW3j-ogCzhMt6nOPsxhSW5BDavuJgCi0_JM-crwKpgVYGFANR6L8fEYm7fhpe0bo18qcMn-izOeIP4vPgl1wdTQhPI_w6_BNbnMZT5SogV5VIu6gzChTHhEVqG_2zCqKNhMr6b26G8WNA7i_kQuL3rehTc0OzWkpOrbAKflyxSZyVjyW2VpUtVBtRDSiqDnS3F9htKGHdN41W9FVa-CndX4gQHsZTGMVvQRZ1EP0ukcEuxp-KyoFHy48TG63EUoTbKKjrQ4sZq64nsCsWAfIwH34yrsqL6Mu0QVfSOw1X0dqHP3pA71XXJd2IOZf2RkptT9E2X7oPKtsv7Q_wvfz8_KCzPlcnelqeEbMGuhGCNQQaQU6rOL0xENt3vvlZu0ysiJD1XSeEqIg7-F2VmJIy1uuOBj5sVY3GwmFxZjzv_bRfo0_cMk12ZJj5P4SLoOcE366xsqEcl9CGEmjmYcA01GBkrMmc'
    };
    var request = http.Request('GET', Uri.parse('${ApiConstants.apiBaseUrl}email/check'));
    request.body = json.encode({
      "user_id": id
    });
    request.headers.addAll(headers);

    http.StreamedResponse response = await request.send();

    if (response.statusCode == 200) {
      context.pushNamed(Routes.loginScreen);
      print(await response.stream.bytesToString());
    }
    else {
      print(response.statusCode);
      print(response.reasonPhrase);
    }

  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
               SizedBox(height: 80.h,),
                Center(
                  child: Text(
                    'We need you to confirm email address',
                    style: TextStyle(
                      fontWeight: FontWeight.w400,
                      fontSize: 13.sp,
                    ),
                  ),
                ),
                SizedBox(height: 5.h,),
                Center(
                  child: Text('Please confirm your email address first by using',style: TextStyle(
                    fontWeight: FontWeight.w400,
                    fontSize: 13.sp,
                  ),),
                ),
                SizedBox(height: 5.h,),
                Center(
                  child: Text('the code sent to you then you can proceed to login',
                    style: TextStyle(
                    fontSize: 13.sp,
                    fontWeight: FontWeight.w400,
                  ),),
                ),
                SizedBox(
                  width: double.infinity,
                  child: Padding(
                    padding: const EdgeInsets.all(16.0),
                    child: Column(
                      children: [
                        Image.asset('assets/illestrations/Enter OTP.gif'),
                      ],
                    ),
                  ),
                ),
                SizedBox(height: 40.h,),


                Padding(padding:
                EdgeInsets.symmetric(horizontal: 40.h),
                  child: Container(

                    child: MaterialButton(
                      minWidth: double.infinity,
                      height: 60,
                      onPressed: () {
                        String id=  CachData.getData(key: 'Email_Id');
                        ProvideEmail(id);
                      },
                      color: buttonYellowColor,
                      elevation: 0,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(50),
                      ),
                      child: Text(
                        "Next", style: TextStyle(
                        fontWeight: FontWeight.w600,
                        fontSize: 20,
                        color: Colors.white,
                      ),
                      ),
                    ),
                  ),
                ),

              ],
            ),
          ),
        ),
      ),
    );
  }
}
