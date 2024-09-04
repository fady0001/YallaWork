

import '../../networking/api_error_handler.dart';
import '../../networking/api_result.dart';
import 'apis/profile_api_services.dart';
import 'model/profile_response.dart';


class ProfileRepo {
  final ProfileApiService _profileApiService;

  ProfileRepo(this._profileApiService);

  Future<ApiResult<ProfileResponse>> getSpecialization() async {
    try {
      final response = await _profileApiService.getSpecialization();
      return ApiResult.success(response);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
