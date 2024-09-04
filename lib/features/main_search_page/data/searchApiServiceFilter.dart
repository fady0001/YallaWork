
import 'package:dio/dio.dart';
import 'package:retrofit/error_logger.dart';
import 'package:retrofit/http.dart';

import '../../../networking/api_constants.dart';
import 'model/ModelSearchFilter.dart';
part 'searchApiServiceFilter.g.dart';
@RestApi(baseUrl: ApiConstants.apiBaseUrl)
abstract class SearchApiServiceF {
  factory SearchApiServiceF(Dio dio) = _SearchApiServiceF;

  @GET('/filtered_search/')
  Future<SearchMmodelF> getSpecialization(
      @Query('page') int page,
      @Query('job_title') String jobTitles,
      @Query('enrollment_status') String enrollement,
      @Query('specialization') String specializations,
      );
}
