import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:untitled3/savepost/api/save_constans.dart';
import '../../networking/api_constants.dart';
import '../models/save_model.dart';

part 'save_api_services.g.dart';

@RestApi(baseUrl : ApiConstants.apiBaseUrl)
abstract class SaveApiService {
  factory SaveApiService(Dio dio) = _SaveApiService;

  @GET(SaveApiConstants.savePost)
  Future<ResponseModel> getSpecialization();
}