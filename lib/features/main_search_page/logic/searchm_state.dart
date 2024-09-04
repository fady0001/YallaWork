import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../networking/api_error_handler.dart';
import '../data/model/searchmModel.dart';
part 'searchm_state.freezed.dart';

@freezed
class SearchState with _$SearchState{
  const factory SearchState.initial() = _Initial;

  const factory SearchState.specializationsLoading() = SearchStateLoading;
  const factory SearchState.specializationsLoadingMore() = _SpecializationsLoadingMore;
  const factory SearchState.specializationsSuccess(SearchMmodel searchMmodel) = SearchStateSuccess;
  const factory SearchState.specializationsError(ErrorHandler errorHandler) = SearchStateError;

}
