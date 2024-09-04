import 'package:shared_preferences/shared_preferences.dart';
class CachData{
  static late SharedPreferences sharedPreferences;
  static  casheInitialization ()async{
    sharedPreferences =await SharedPreferences.getInstance();
  }
  static Future setData({required dynamic key,required dynamic id})async{

  await  sharedPreferences.setString(key, id);
  }
  static Future setDatsetThemea({required dynamic key,required dynamic id})async{

    await  sharedPreferences.setBool(key, id);
  }
  static dynamic  getData({required String key}){
    return   sharedPreferences.get(key);
  }
 static void deleteItem({required String key})  {

    sharedPreferences.remove(key);
  }

}

