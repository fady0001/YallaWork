
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import '../../../networking/api_constants.dart';
import '../../freelance/models.dart';
part 'homeF_api_service.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class HomeApiServiceF {
  factory HomeApiServiceF(Dio dio) = _HomeApiServiceF;

  @GET('/freelancing_posts/index/?page={page}')
  Future<FreelanceModel> getSpecialization(@Path('page') int page);
}

