import 'package:dio/dio.dart';
import 'package:pretty_dio_logger/pretty_dio_logger.dart';


import '../core/helpers/constants.dart';
import '../core/helpers/sharedpreference.dart';
import '../features/add/widget/shared_preferences.dart';



class DioFactory {
  /// private constructor as I don't want to allow creating an instance of this class
  DioFactory._();
  static Dio? dio;
  static  Dio getDio()  {
    Duration timeOut = const Duration(seconds: 20);
    if (dio == null) {
      dio = Dio();
      dio!
        ..options.connectTimeout = timeOut
        ..options.receiveTimeout = timeOut;
      addDioHeaders();
      addDioInterceptor();


      return dio!;
    } else {


      return dio!;
    }
  }

  static void addDioHeaders() async {
    String token=  CachData.getData(key: 'access_token');
    dio?.options.headers = {
      'Accept': 'application/json',
     'Authorization':
     'Bearer ${await SharedPrefHelper.getString(SharedPrefKeys.userToken)}',
    };
  }
  static void setTokenIntoHeaderAfterLogin(String token) {
    dio?.options.headers = {
      'Authorization': 'Bearer $token',

    };

  }
  static void addDioInterceptor() {
    dio?.interceptors.add(
      PrettyDioLogger(
        requestBody: true,
        requestHeader: true,
        responseHeader: true,
      ),
    );
  }
}
