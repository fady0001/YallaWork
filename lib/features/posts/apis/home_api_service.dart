
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../networking/api_constants.dart';
import '../models.dart';
part 'home_api_service.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiService {
  factory HomeApiService(Dio dio) = _HomeApiService;


  @GET('/posts/index?page={page}')
  Future<PostModels> getSpecialization(@Path('page') int page);
  

}

