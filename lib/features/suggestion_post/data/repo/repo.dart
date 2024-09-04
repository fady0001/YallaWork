

import '../../../../networking/api_error_handler.dart';
import '../../../../networking/api_result.dart';
import '../api_servies_suggestion-post.dart';
import '../model/suggestion_post_model.dart';

class SuggestionRepo {
  final SuggestionApiService _suggestionApiService;

  SuggestionRepo(this._suggestionApiService);

  Future<ApiResult<SuggestedPosts>> getSpecialization(int page) async {
    try {
      final response = await _suggestionApiService.getSpecialization(page);
print(response);
      return ApiResult.success(response);
    } catch (error) {
      print('errordddddddddd+${error}');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}

