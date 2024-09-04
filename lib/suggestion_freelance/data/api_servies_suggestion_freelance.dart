import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../networking/api_constants.dart';
import 'model/suggestion_freelance_model.dart';

part 'api_servies_suggestion_freelance.g.dart';

@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SuggestionFreelanceApiService{

  factory SuggestionFreelanceApiService(Dio dio) = _SuggestionFreelanceApiService;

  @GET('/freelancing_posts/suggested/?page={page}')
  Future<SuggestedFreelance> getSpecialization(@Path('page') int page);


}