// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'save_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

/// @nodoc
mixin _$SaveState {
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() specializationsLoading,
    required TResult Function(ResponseModel responseModel)
        specializationsSuccess,
    required TResult Function(ErrorHandler errorHandler) specializationsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? specializationsLoading,
    TResult? Function(ResponseModel responseModel)? specializationsSuccess,
    TResult? Function(ErrorHandler errorHandler)? specializationsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? specializationsLoading,
    TResult Function(ResponseModel responseModel)? specializationsSuccess,
    TResult Function(ErrorHandler errorHandler)? specializationsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SpecializationsLoading value)
        specializationsLoading,
    required TResult Function(SpecializationsSuccess value)
        specializationsSuccess,
    required TResult Function(SpecializationsError value) specializationsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SpecializationsLoading value)? specializationsLoading,
    TResult? Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult? Function(SpecializationsError value)? specializationsError,
  }) =>
      throw _privateConstructorUsedError;
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SpecializationsLoading value)? specializationsLoading,
    TResult Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult Function(SpecializationsError value)? specializationsError,
    required TResult orElse(),
  }) =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SaveStateCopyWith<$Res> {
  factory $SaveStateCopyWith(SaveState value, $Res Function(SaveState) then) =
      _$SaveStateCopyWithImpl<$Res, SaveState>;
}

/// @nodoc
class _$SaveStateCopyWithImpl<$Res, $Val extends SaveState>
    implements $SaveStateCopyWith<$Res> {
  _$SaveStateCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;
}

/// @nodoc
abstract class _$$InitialImplCopyWith<$Res> {
  factory _$$InitialImplCopyWith(
          _$InitialImpl value, $Res Function(_$InitialImpl) then) =
      __$$InitialImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$InitialImplCopyWithImpl<$Res>
    extends _$SaveStateCopyWithImpl<$Res, _$InitialImpl>
    implements _$$InitialImplCopyWith<$Res> {
  __$$InitialImplCopyWithImpl(
      _$InitialImpl _value, $Res Function(_$InitialImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$InitialImpl implements _Initial {
  const _$InitialImpl();

  @override
  String toString() {
    return 'SaveState.initial()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType && other is _$InitialImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() specializationsLoading,
    required TResult Function(ResponseModel responseModel)
        specializationsSuccess,
    required TResult Function(ErrorHandler errorHandler) specializationsError,
  }) {
    return initial();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? specializationsLoading,
    TResult? Function(ResponseModel responseModel)? specializationsSuccess,
    TResult? Function(ErrorHandler errorHandler)? specializationsError,
  }) {
    return initial?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? specializationsLoading,
    TResult Function(ResponseModel responseModel)? specializationsSuccess,
    TResult Function(ErrorHandler errorHandler)? specializationsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SpecializationsLoading value)
        specializationsLoading,
    required TResult Function(SpecializationsSuccess value)
        specializationsSuccess,
    required TResult Function(SpecializationsError value) specializationsError,
  }) {
    return initial(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SpecializationsLoading value)? specializationsLoading,
    TResult? Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult? Function(SpecializationsError value)? specializationsError,
  }) {
    return initial?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SpecializationsLoading value)? specializationsLoading,
    TResult Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult Function(SpecializationsError value)? specializationsError,
    required TResult orElse(),
  }) {
    if (initial != null) {
      return initial(this);
    }
    return orElse();
  }
}

abstract class _Initial implements SaveState {
  const factory _Initial() = _$InitialImpl;
}

/// @nodoc
abstract class _$$SpecializationsLoadingImplCopyWith<$Res> {
  factory _$$SpecializationsLoadingImplCopyWith(
          _$SpecializationsLoadingImpl value,
          $Res Function(_$SpecializationsLoadingImpl) then) =
      __$$SpecializationsLoadingImplCopyWithImpl<$Res>;
}

/// @nodoc
class __$$SpecializationsLoadingImplCopyWithImpl<$Res>
    extends _$SaveStateCopyWithImpl<$Res, _$SpecializationsLoadingImpl>
    implements _$$SpecializationsLoadingImplCopyWith<$Res> {
  __$$SpecializationsLoadingImplCopyWithImpl(
      _$SpecializationsLoadingImpl _value,
      $Res Function(_$SpecializationsLoadingImpl) _then)
      : super(_value, _then);
}

/// @nodoc

class _$SpecializationsLoadingImpl implements SpecializationsLoading {
  const _$SpecializationsLoadingImpl();

  @override
  String toString() {
    return 'SaveState.specializationsLoading()';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecializationsLoadingImpl);
  }

  @override
  int get hashCode => runtimeType.hashCode;

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() specializationsLoading,
    required TResult Function(ResponseModel responseModel)
        specializationsSuccess,
    required TResult Function(ErrorHandler errorHandler) specializationsError,
  }) {
    return specializationsLoading();
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? specializationsLoading,
    TResult? Function(ResponseModel responseModel)? specializationsSuccess,
    TResult? Function(ErrorHandler errorHandler)? specializationsError,
  }) {
    return specializationsLoading?.call();
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? specializationsLoading,
    TResult Function(ResponseModel responseModel)? specializationsSuccess,
    TResult Function(ErrorHandler errorHandler)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsLoading != null) {
      return specializationsLoading();
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SpecializationsLoading value)
        specializationsLoading,
    required TResult Function(SpecializationsSuccess value)
        specializationsSuccess,
    required TResult Function(SpecializationsError value) specializationsError,
  }) {
    return specializationsLoading(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SpecializationsLoading value)? specializationsLoading,
    TResult? Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult? Function(SpecializationsError value)? specializationsError,
  }) {
    return specializationsLoading?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SpecializationsLoading value)? specializationsLoading,
    TResult Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult Function(SpecializationsError value)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsLoading != null) {
      return specializationsLoading(this);
    }
    return orElse();
  }
}

abstract class SpecializationsLoading implements SaveState {
  const factory SpecializationsLoading() = _$SpecializationsLoadingImpl;
}

/// @nodoc
abstract class _$$SpecializationsSuccessImplCopyWith<$Res> {
  factory _$$SpecializationsSuccessImplCopyWith(
          _$SpecializationsSuccessImpl value,
          $Res Function(_$SpecializationsSuccessImpl) then) =
      __$$SpecializationsSuccessImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ResponseModel responseModel});
}

/// @nodoc
class __$$SpecializationsSuccessImplCopyWithImpl<$Res>
    extends _$SaveStateCopyWithImpl<$Res, _$SpecializationsSuccessImpl>
    implements _$$SpecializationsSuccessImplCopyWith<$Res> {
  __$$SpecializationsSuccessImplCopyWithImpl(
      _$SpecializationsSuccessImpl _value,
      $Res Function(_$SpecializationsSuccessImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? responseModel = null,
  }) {
    return _then(_$SpecializationsSuccessImpl(
      null == responseModel
          ? _value.responseModel
          : responseModel // ignore: cast_nullable_to_non_nullable
              as ResponseModel,
    ));
  }
}

/// @nodoc

class _$SpecializationsSuccessImpl implements SpecializationsSuccess {
  const _$SpecializationsSuccessImpl(this.responseModel);

  @override
  final ResponseModel responseModel;

  @override
  String toString() {
    return 'SaveState.specializationsSuccess(responseModel: $responseModel)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecializationsSuccessImpl &&
            (identical(other.responseModel, responseModel) ||
                other.responseModel == responseModel));
  }

  @override
  int get hashCode => Object.hash(runtimeType, responseModel);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecializationsSuccessImplCopyWith<_$SpecializationsSuccessImpl>
      get copyWith => __$$SpecializationsSuccessImplCopyWithImpl<
          _$SpecializationsSuccessImpl>(this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() specializationsLoading,
    required TResult Function(ResponseModel responseModel)
        specializationsSuccess,
    required TResult Function(ErrorHandler errorHandler) specializationsError,
  }) {
    return specializationsSuccess(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? specializationsLoading,
    TResult? Function(ResponseModel responseModel)? specializationsSuccess,
    TResult? Function(ErrorHandler errorHandler)? specializationsError,
  }) {
    return specializationsSuccess?.call(responseModel);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? specializationsLoading,
    TResult Function(ResponseModel responseModel)? specializationsSuccess,
    TResult Function(ErrorHandler errorHandler)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsSuccess != null) {
      return specializationsSuccess(responseModel);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SpecializationsLoading value)
        specializationsLoading,
    required TResult Function(SpecializationsSuccess value)
        specializationsSuccess,
    required TResult Function(SpecializationsError value) specializationsError,
  }) {
    return specializationsSuccess(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SpecializationsLoading value)? specializationsLoading,
    TResult? Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult? Function(SpecializationsError value)? specializationsError,
  }) {
    return specializationsSuccess?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SpecializationsLoading value)? specializationsLoading,
    TResult Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult Function(SpecializationsError value)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsSuccess != null) {
      return specializationsSuccess(this);
    }
    return orElse();
  }
}

abstract class SpecializationsSuccess implements SaveState {
  const factory SpecializationsSuccess(final ResponseModel responseModel) =
      _$SpecializationsSuccessImpl;

  ResponseModel get responseModel;
  @JsonKey(ignore: true)
  _$$SpecializationsSuccessImplCopyWith<_$SpecializationsSuccessImpl>
      get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class _$$SpecializationsErrorImplCopyWith<$Res> {
  factory _$$SpecializationsErrorImplCopyWith(_$SpecializationsErrorImpl value,
          $Res Function(_$SpecializationsErrorImpl) then) =
      __$$SpecializationsErrorImplCopyWithImpl<$Res>;
  @useResult
  $Res call({ErrorHandler errorHandler});
}

/// @nodoc
class __$$SpecializationsErrorImplCopyWithImpl<$Res>
    extends _$SaveStateCopyWithImpl<$Res, _$SpecializationsErrorImpl>
    implements _$$SpecializationsErrorImplCopyWith<$Res> {
  __$$SpecializationsErrorImplCopyWithImpl(_$SpecializationsErrorImpl _value,
      $Res Function(_$SpecializationsErrorImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? errorHandler = null,
  }) {
    return _then(_$SpecializationsErrorImpl(
      null == errorHandler
          ? _value.errorHandler
          : errorHandler // ignore: cast_nullable_to_non_nullable
              as ErrorHandler,
    ));
  }
}

/// @nodoc

class _$SpecializationsErrorImpl implements SpecializationsError {
  const _$SpecializationsErrorImpl(this.errorHandler);

  @override
  final ErrorHandler errorHandler;

  @override
  String toString() {
    return 'SaveState.specializationsError(errorHandler: $errorHandler)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SpecializationsErrorImpl &&
            (identical(other.errorHandler, errorHandler) ||
                other.errorHandler == errorHandler));
  }

  @override
  int get hashCode => Object.hash(runtimeType, errorHandler);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SpecializationsErrorImplCopyWith<_$SpecializationsErrorImpl>
      get copyWith =>
          __$$SpecializationsErrorImplCopyWithImpl<_$SpecializationsErrorImpl>(
              this, _$identity);

  @override
  @optionalTypeArgs
  TResult when<TResult extends Object?>({
    required TResult Function() initial,
    required TResult Function() specializationsLoading,
    required TResult Function(ResponseModel responseModel)
        specializationsSuccess,
    required TResult Function(ErrorHandler errorHandler) specializationsError,
  }) {
    return specializationsError(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult? whenOrNull<TResult extends Object?>({
    TResult? Function()? initial,
    TResult? Function()? specializationsLoading,
    TResult? Function(ResponseModel responseModel)? specializationsSuccess,
    TResult? Function(ErrorHandler errorHandler)? specializationsError,
  }) {
    return specializationsError?.call(errorHandler);
  }

  @override
  @optionalTypeArgs
  TResult maybeWhen<TResult extends Object?>({
    TResult Function()? initial,
    TResult Function()? specializationsLoading,
    TResult Function(ResponseModel responseModel)? specializationsSuccess,
    TResult Function(ErrorHandler errorHandler)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsError != null) {
      return specializationsError(errorHandler);
    }
    return orElse();
  }

  @override
  @optionalTypeArgs
  TResult map<TResult extends Object?>({
    required TResult Function(_Initial value) initial,
    required TResult Function(SpecializationsLoading value)
        specializationsLoading,
    required TResult Function(SpecializationsSuccess value)
        specializationsSuccess,
    required TResult Function(SpecializationsError value) specializationsError,
  }) {
    return specializationsError(this);
  }

  @override
  @optionalTypeArgs
  TResult? mapOrNull<TResult extends Object?>({
    TResult? Function(_Initial value)? initial,
    TResult? Function(SpecializationsLoading value)? specializationsLoading,
    TResult? Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult? Function(SpecializationsError value)? specializationsError,
  }) {
    return specializationsError?.call(this);
  }

  @override
  @optionalTypeArgs
  TResult maybeMap<TResult extends Object?>({
    TResult Function(_Initial value)? initial,
    TResult Function(SpecializationsLoading value)? specializationsLoading,
    TResult Function(SpecializationsSuccess value)? specializationsSuccess,
    TResult Function(SpecializationsError value)? specializationsError,
    required TResult orElse(),
  }) {
    if (specializationsError != null) {
      return specializationsError(this);
    }
    return orElse();
  }
}

abstract class SpecializationsError implements SaveState {
  const factory SpecializationsError(final ErrorHandler errorHandler) =
      _$SpecializationsErrorImpl;

  ErrorHandler get errorHandler;
  @JsonKey(ignore: true)
  _$$SpecializationsErrorImplCopyWith<_$SpecializationsErrorImpl>
      get copyWith => throw _privateConstructorUsedError;
}
