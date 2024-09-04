import 'package:json_annotation/json_annotation.dart';
import '../../../add/widget/shared_preferences.dart';

part 'login_response.g.dart';
@JsonSerializable()
class LoginResponse {
  @JsonKey(name: 'data')
  UserData? userData;
  String? status;
  @JsonKey(name: 'user_id')
  String? id ;
  LoginResponse({ this.userData, this.status,  this.id}){
    CachData.setData(key: 'user_id', id: id);
    if(id!=null){
      print('iddddddddd sdddddddd:${id}');

    }
  }
  factory LoginResponse.fromJson(Map<String, dynamic> json) =>
      _$LoginResponseFromJson(json);

}
@JsonSerializable()
class UserData {
  @JsonKey(name:'token_type')
  String? token;
  String? access_token;
  String? refresh_token;
  int? expires_in;

  UserData({this.token,
    this.access_token,
    this.refresh_token,
    this.expires_in,})
  {
    // CachData.setData(key: 'access_token', id: access_token);
    if(access_token!=null){
      CachData.setData(key: 'access_token', id: access_token);
      print('iddddddddd sdddddddd:${access_token}');

    }
  }
  factory UserData.fromJson(Map<String, dynamic> json) =>
      _$UserDataFromJson(json);

}