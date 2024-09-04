// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    LoginResponse(
      userData: json['data'] == null
          ? null
          : UserData.fromJson(json['data'] as Map<String, dynamic>),
      status: json['status'] as String?,
      id: json['user_id'] as String?,
    );

Map<String, dynamic> _$LoginResponseToJson(LoginResponse instance) =>
    <String, dynamic>{
      'data': instance.userData,
      'status': instance.status,
      'user_id': instance.id,
    };

UserData _$UserDataFromJson(Map<String, dynamic> json) => UserData(
      token: json['token_type'] as String?,
      access_token: json['access_token'] as String?,
      refresh_token: json['refresh_token'] as String?,
      expires_in: (json['expires_in'] as num?)?.toInt(),
    );

Map<String, dynamic> _$UserDataToJson(UserData instance) => <String, dynamic>{
      'token_type': instance.token,
      'access_token': instance.access_token,
      'refresh_token': instance.refresh_token,
      'expires_in': instance.expires_in,
    };
