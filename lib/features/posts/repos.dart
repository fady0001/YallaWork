



import '../../networking/api_error_handler.dart';
import '../../networking/api_result.dart';
import 'apis/home_api_service.dart';
import 'models.dart';
class HomeRepo {
  final HomeApiService _homeApiService;

  HomeRepo(this._homeApiService);

  Future<ApiResult<PostModels>> getSpecialization(int page) async {
    try {
      final response = await _homeApiService.getSpecialization(page);

      return ApiResult.success(response as PostModels);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }


}

