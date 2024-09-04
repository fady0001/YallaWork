import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../networking/api_error_handler.dart';
import '../model/profile_response.dart';


part 'cubit_state.freezed.dart';


@freezed
class ProfileState with _$ProfileState {
  const factory ProfileState.initial() = _Initial;

  const factory ProfileState.specializationsLoading() = SpecializationsLoading;
  const factory ProfileState.specializationsSuccess(ProfileResponse profileresponse) = SpecializationsSuccess;
  const factory ProfileState.specializationsError(ErrorHandler errorHandler) =
  SpecializationsError;
}
