
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../../../constants/app_localizations.dart';
import '../../../core/routing/routes.dart';
import '../../../core/theming/colors.dart';
import '../../../my_widgets/customScaffold.dart';
import '../../sign_up/ui/sign_up_screen.dart';


class WelcomeScreen extends StatelessWidget {
  const WelcomeScreen({super.key});
  @override
  Widget build(BuildContext context) {
    return CustomScaffold(
     child:  Column(
        children: [
          Flexible(
            flex: 8,
            child: Container(
            padding: const EdgeInsets.symmetric(
            vertical: 0,
            horizontal: 40.0,
              ),
              child: Row(
                children: [
                  Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.all(15),
                          child: Text(AppLocalizations.of(context)!.translate("welcome"),
                              style: TextStyle(fontSize: 38,color: buttonYellowColor,fontWeight:FontWeight.bold),textAlign: TextAlign.end,),
                        ),
                        SizedBox(height:5,),
                        OutlinedButton(onPressed: (){
                          Navigator.of(context).pushReplacementNamed(Routes.loginScreen);
                          // Navigator.pushNamed(context, 'login');
                          // LoginScreen();

                        }, child: Text(AppLocalizations.of(context)!.translate("login"),
                            style: TextStyle(fontSize: 25,color: textBlueColor)),),

                        Text('&',style: TextStyle(color: buttonYellowColor,fontSize: 20,fontWeight:FontWeight.bold),),

                        ElevatedButton(onPressed: (){
                          Navigator.of(context).pushReplacementNamed(Routes.signUpScreen);
                        },
                            child: Text('Sign UP',
                                // AppLocalizations.of(context)!.translate("sign up"),
                                style: TextStyle(fontSize: 25,color: textBlueColor)),
                        ),

                      ],
                    ),
                  ),
                ],
              ),
          ),
              ),
        ],
      )
    );
  }
}
