
import 'package:freezed_annotation/freezed_annotation.dart';


import '../../../networking/api_error_handler.dart';
import '../data/model/suggestion_post_model.dart';

part 'suggestion_post_state.freezed.dart';



@freezed

class SuggestionState with _$SuggestionState {
  const factory SuggestionState.initial() = _Initial;
  const factory SuggestionState.specializationsLoading() = SuggestionStateLoading;
  const factory SuggestionState.specializationsSuccess(SuggestedPosts suggestedPosts) = SuggestionStateSuccess;
  const factory SuggestionState.specializationsError(ErrorHandler errorHandler) = SuggestionStateError;
}
