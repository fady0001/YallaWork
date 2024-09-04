

import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../networking/api_constants.dart';
import 'model/suggestion_post_model.dart';


part 'api_servies_suggestion-post.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SuggestionApiService {
  factory SuggestionApiService(Dio dio) = _SuggestionApiService;


  @GET('/posts/suggested/?page={page}')
  Future<SuggestedPosts> getSpecialization(@Path('page') int page);
}

  