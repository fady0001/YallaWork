

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../networking/api_constants.dart';
import 'model/searchmModel.dart';

part 'searchApiService.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SearchApiService {
  factory SearchApiService(Dio dio) = _SearchApiService;

  @GET('/search?search={query}&page={page}')
  Future<SearchMmodel> getSpecialization(@Path('query') String query, @Path('page') int page);

}

