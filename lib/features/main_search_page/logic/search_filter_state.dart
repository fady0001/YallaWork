import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../networking/api_error_handler.dart';
import '../data/model/ModelSearchFilter.dart';
import '../data/model/searchmModel.dart';
part 'search_filter_state.freezed.dart';

@freezed
class SearchStateF with _$SearchStateF{
  const factory SearchStateF.initial() = _InitialF;

  const factory SearchStateF.specializationsLoading() = SearchStateLoadingF;
  const factory SearchStateF.specializationsLoadingMore() = _SpecializationsLoadingMoreF;
  const factory SearchStateF.specializationsSuccess(SearchMmodelF searchMmodel) = SearchStateSuccessF;
  const factory SearchStateF.specializationsError(ErrorHandler errorHandler) = SearchStateErrorF;

}
