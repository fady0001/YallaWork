part of 'locale_bloc.dart';
@immutable


abstract class LocaleEvent{

  // Future<void> getSavedLanguage() async{
  //   final String cachedLanguageCode = await LanguageCacheHelper().getCachedLanguageCode();
  //
  //   emit(ChangeLocaleState(locale: Locale(cachedLanguageCode)));
  // }
  // Future<void> changeLanguage(String languageCode) async{
  //   await LanguageCacheHelper().cacheLanguageCode(languageCode);
  //   emit(ChangeLocaleState(locale: Locale(languageCode)));
  //
  // }
}