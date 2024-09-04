

import '../../../../networking/api_error_handler.dart';
import '../../../../networking/api_result.dart';
import '../model/ModelSearchFilter.dart';
import '../model/searchmModel.dart';
import '../searchApiService.dart';
import '../searchApiServiceFilter.dart';


class SearchRepom {
 final SearchApiService _searchApiService;

 SearchRepom(this._searchApiService);

 Future<ApiResult<SearchMmodel>> searchSpecialization(String query, int page) async {
  try {
   final result = await _searchApiService.getSpecialization(query, page);
   return ApiResult.success(result);
  } catch (error) {
   return ApiResult.failure(ErrorHandler.handle(error));
  }
 }
}

class SearchRepo {
 final SearchApiServiceF _searchApiService;

 SearchRepo(this._searchApiService);

 Future<ApiResult<SearchMmodelF>> searchSpecialization({
   List<String>? jobTitles,
   List<String>? enrollement,
   List<String>? specializations,
   int? page,
 }) async {
  try {

   final generalJobTitleString = jobTitles?.join(',') ?? '';
   final enrollementString = enrollement?.join(',') ?? '';
   final specializationsString = specializations?.join(',') ?? '';


   final result = await _searchApiService.getSpecialization(
    page!,
    generalJobTitleString!,
    enrollementString!,
    specializationsString!,
   );
   return ApiResult.success(result);
  } catch (error) {
   return ApiResult.failure(ErrorHandler.handle(error));
  }
 }
}
