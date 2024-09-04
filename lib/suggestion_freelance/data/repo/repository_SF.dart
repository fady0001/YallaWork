

import 'package:untitled3/suggestion_freelance/data/api_servies_suggestion_freelance.dart';

import '../../../networking/api_error_handler.dart';
import '../../../networking/api_result.dart';
import '../model/suggestion_freelance_model.dart';

class SuggestionFreelanceRepo{
  final SuggestionFreelanceApiService _suggestionFreelanceApiService;

  SuggestionFreelanceRepo(this._suggestionFreelanceApiService);
  Future<ApiResult<SuggestedFreelance>> getSpecialization(int page) async{
    try{
      final response = await _suggestionFreelanceApiService.getSpecialization(page);
      print(response);
      return ApiResult.success(response);
    } catch (error) {
      print('errordddddddddd+${error}');
      return ApiResult.failure(ErrorHandler.handle(error));
    }
    }

  }
