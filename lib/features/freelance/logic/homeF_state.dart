
import 'package:freezed_annotation/freezed_annotation.dart';

import '../../../networking/api_error_handler.dart';
import '../models.dart';


part 'homeF_state.freezed.dart';

@freezed
class HomeStateF with _$HomeStateF {
  const factory HomeStateF.initial() = _Initial;

  const factory HomeStateF.specializationsLoading() = SpecializationsLoading;
  const factory HomeStateF.specializationsSuccess(FreelanceModel freelanceModel) = SpecializationsSuccess;
  const factory HomeStateF.specializationsError(ErrorHandler errorHandler) = SpecializationsError;
}
