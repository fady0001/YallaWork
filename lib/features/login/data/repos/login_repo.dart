
import '../../../../networking/api_error_handler.dart';
import '../../../../networking/api_result.dart';
import '../../../../networking/api_service.dart';
import '../models/login_request_body.dart';
import '../models/login_response.dart';

class LoginRepo {
  final ApiService _apiService;

  LoginRepo(this._apiService);

  Future<ApiResult<LoginResponse>> login(
      LoginRequestBody loginRequestBody) async {
    try {
      final response = await _apiService.login(loginRequestBody);
      return ApiResult.success(response);
    } catch (errro) {
      return ApiResult.failure(ErrorHandler.handle(errro));
    }
  }
}
