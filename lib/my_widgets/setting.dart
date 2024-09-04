import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import '../constants/app_localizations.dart';
import '../core/theming/colors.dart';
import '../features/home/ui/languageScreen.dart';

class Settings extends StatelessWidget {
     Settings({Key? key}) : super(key: key);
  @override
  Widget build(BuildContext context) {
          return Scaffold( 
            appBar: AppBar(
              title: Text(AppLocalizations.of(context)!.translate("setting"),),
            ),
            body: Column(
              children: [
                ListTile(
                  leading: IconButton(
                    icon: Icon(Icons.dark_mode), color: blodBlueColor,
                    onPressed: (){

                    }
                    // =>
                    // _notifier.value = mode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light,
                  ),
                  title: Text('Dark Mode'),

                ),
                ListTile(

                  leading:IconButton(
                   icon: Icon(Icons.language,color: blodBlueColor,),
                    onPressed: (){
                      Navigator.push(context, MaterialPageRoute(builder: (context ){
                        return LanguageScreen();
                      }));                     },),

                  // Icon(Icons.language,color: blodBlueColor,),
                title: Text(AppLocalizations.of(context)!.translate("language",
                ),
                ),

                )
              ],
            ),
          );
        }
  }
