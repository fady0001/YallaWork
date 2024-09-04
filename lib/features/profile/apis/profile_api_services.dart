import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';
import 'package:untitled3/features/profile/apis/profile_constance.dart';
import '../../../networking/api_constants.dart';
import '../model/profile_response.dart';
part 'profile_api_services.g.dart';


@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class ProfileApiService {
  factory ProfileApiService(Dio dio) = _ProfileApiService;

  @GET(ProfileApiConstants.prfile)
  Future<ProfileResponse> getSpecialization();

}

