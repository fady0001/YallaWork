
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../networking/api_error_handler.dart';
import '../models.dart';


part 'home_state.freezed.dart';

@freezed
class HomeState with _$HomeState {
  const factory HomeState.initial() = _Initial;

  const factory HomeState.specializationsLoading() = SpecializationsLoading;
  const factory HomeState.specializationsSuccess(PostModels postModels) = SpecializationsSuccess;
  const factory HomeState.specializationsError(ErrorHandler errorHandler) = SpecializationsError;
}
