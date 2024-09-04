


import 'package:freezed_annotation/freezed_annotation.dart';

import '../../networking/api_error_handler.dart';
import '../data/model/suggestion_freelance_model.dart';

part 'suggestion_freelance_state.freezed.dart';



@freezed

class SuggestionFreelanceState with _$SuggestionFreelanceState {
  const factory SuggestionFreelanceState.initial() = _Initial;
  const factory SuggestionFreelanceState.specializationsLoading() = SuggestionFreelanceStateLoading;
  const factory SuggestionFreelanceState.specializationsSuccess(SuggestedFreelance suggestedFreelance) = SuggestionFreelanceStateSuccess;
  const factory SuggestionFreelanceState.specializationsError(ErrorHandler errorHandler) = SuggestionFreelanceStateError;
}