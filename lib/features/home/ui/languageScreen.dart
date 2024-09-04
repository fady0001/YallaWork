import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

import '../../../constants/app_localizations.dart';
import '../../../bloc/locale/locale_bloc.dart';



class LanguageScreen extends StatelessWidget {
  const LanguageScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.translate("language"),),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(8),
            child: BlocConsumer<LocaleBloc,ChangeLocaleState>(
                listener: (context,state){
                    // Navigator.of(context).pop();
                },
              builder: (context,state) {
                  return DropdownButton<String>(
                    value: 'ar',
                    icon: const Icon(Icons.keyboard_arrow_down,),
                    items: ['ar' , 'en'].map((String items){
                      return DropdownMenuItem<String>(
                        value: items,
                        child: Text(items),);
                    }).toList(),
                    onChanged: (String? newValue){
                      if(newValue!= null){
                        BlocProvider.of<LocaleBloc>(context).changeLanguage(newValue);
                        context.read<LocaleBloc>().changeLanguage(newValue);
                      }
                    },
                  );
                }
            ),
          ),
        ));
  }
}
