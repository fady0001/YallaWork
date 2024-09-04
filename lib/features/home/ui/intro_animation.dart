import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import '../../../constants/app_localizations.dart';
import '../../../core/theming/colors.dart';
import 'intro123.dart';


class IntroAnimation extends StatefulWidget {
  const IntroAnimation({super.key});
  @override
  State<IntroAnimation> createState() => _IntroAnimationState();
}

class _IntroAnimationState extends State<IntroAnimation> {

  @override
  void initState() {
    Future.delayed(Duration(seconds: 4),(){
      Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreens()));
    });
    // TODO: implement initState
    super.initState();
  }
  @override
  Widget build(BuildContext context) {
    return  Scaffold(
      backgroundColor: Colors.white,
      // Color(0xFFFFFF00),
      body:
      Center(
        child: Container(
          width: 230,
          height: 230,
          // decoration: BoxDecoration(
          //   color: Colors.white,
          //   // borderRadius: BorderRadius.only(
          //   //   topLeft: Radius.circular(130),
          //   //   bottomRight: Radius.circular(130),
          //   //   topRight: Radius.circular(5),
          //   //   bottomLeft: Radius.circular(130),
          //   // ),
          // ),
          child:  Column (
              crossAxisAlignment: CrossAxisAlignment.center,
              children:[
                SizedBox(
                  height: 15,
                ),
                Lottie.asset('assets/d.json',height: 140),
                // SizedBox(height: 165,),
                Text(
                  AppLocalizations.of(context)!.translate("splas_mess")
                  ,style: TextStyle(
                  fontSize: 22,
                  color: textBlueColor,
                  fontWeight: FontWeight.bold,
                ),),
              ]
          ),
        ),
      ),

    );

  }
}
