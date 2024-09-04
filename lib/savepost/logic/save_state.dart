import 'package:freezed_annotation/freezed_annotation.dart';

import '../../networking/api_error_handler.dart';
import '../models/save_model.dart';

part 'save_state.freezed.dart';

@freezed
class SaveState with _$SaveState {
  const factory SaveState.initial() = _Initial;

  const factory SaveState.specializationsLoading() = SpecializationsLoading;
  const factory SaveState.specializationsSuccess(ResponseModel responseModel) = SpecializationsSuccess;
  const factory SaveState.specializationsError(ErrorHandler errorHandler) =
  SpecializationsError;
}
