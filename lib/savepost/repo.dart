

import '../networking/api_error_handler.dart';
import '../networking/api_result.dart';
import 'api/save_api_services.dart';
import 'models/save_model.dart';

class SaveRepo {
  final SaveApiService _saveApiService;

  SaveRepo(this._saveApiService);

  Future<ApiResult<ResponseModel>> getSpecialization() async {
    try {
      final response = await _saveApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
