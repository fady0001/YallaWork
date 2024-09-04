import 'package:untitled3/features/freelance/models.dart';
import '../../networking/api_error_handler.dart';
import '../../networking/api_result.dart';
import 'apis/homeF_api_service.dart';


class HomeRepoF {
  final HomeApiServiceF _homeApiServiceF;

  HomeRepoF(this._homeApiServiceF);

  Future<ApiResult<FreelanceModel>> getSpecialization(int page) async {
    try {
      final response = await _homeApiServiceF.getSpecialization(page);

      return ApiResult.success(response as FreelanceModel);
    } catch (error) {
      return ApiResult.failure(ErrorHandler.handle(error));
    }
  }
}
