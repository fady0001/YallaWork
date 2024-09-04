import 'dart:async';

import 'package:flutter/material.dart';
import 'package:untitled3/features/home/ui/home_screen.dart';

import '../../../constants/app_localizations.dart';
import 'intro123.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState(){
    super.initState();
    Timer(Duration(seconds: 3),
        ()=>Navigator.pushReplacement(context, MaterialPageRoute(builder: (context)=>IntroScreens()))
    );
  }

  @override


  Widget build(BuildContext context) {
    return Material(
      child: Container(
        height: MediaQuery.of(context).size.height,
        width:MediaQuery.of(context).size.width ,
        decoration: BoxDecoration(
          color: Colors.black,
          image: DecorationImage(
            image: AssetImage('assets/images/splashScreen3.webp'),
            fit: BoxFit.cover,
            opacity: 0.4,
          )
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text( AppLocalizations.of(context)!.translate("splas_mess"),
              style:TextStyle(
                color: Colors.white,
                fontWeight: FontWeight.bold,
                fontSize: 40,
                fontStyle: FontStyle.italic,
              ) ,)
          ],
        ),
      ),
    );
  }
}
