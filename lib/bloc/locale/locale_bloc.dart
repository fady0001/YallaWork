
import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../constants/language_cache_helper.dart';


part 'locale_event.dart';
part  'locale_state.dart';

class LocaleBloc extends Bloc<LocaleEvent, ChangeLocaleState>{
  LocaleBloc() : super(ChangeLocaleState(locale: Locale('en')));

      Future<void>  getSavedLanguage() async{
        final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
        emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
      }
      Future<void> changeLanguage(String languageCode) async{
        await LanguageCacheHelper().cacheLanguageCode(languageCode);
        emit(ChangeLocaleState(locale: Locale(languageCode)));

      }


}


