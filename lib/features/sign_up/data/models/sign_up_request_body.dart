import 'package:json_annotation/json_annotation.dart';

import '../../../add/widget/shared_preferences.dart';
part 'sign_up_request_body.g.dart';

@JsonSerializable()
class SignupRequestBody {
  final String first_name;
  final String last_name;
  final String email;
  final String password;
  @JsonKey(name: 'password_confirmation')
  final String passwordConfirmation;
  String? role ;

  SignupRequestBody({
    required this.first_name,
    required this.last_name,
    required this.email,
    required this.password,
    required this.passwordConfirmation,
  }){
    CachData.setData(key: 'firstN', id: first_name);
    CachData.setData(key: 'lastN', id: last_name);
  }

  Map<String, dynamic> toJson() => _$SignupRequestBodyToJson(this);
}