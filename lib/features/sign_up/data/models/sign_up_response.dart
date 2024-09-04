import 'package:json_annotation/json_annotation.dart';

import '../../../add/widget/shared_preferences.dart';
part 'sign_up_response.g.dart';

@JsonSerializable()
class SignupResponse {
  String? message;
  @JsonKey(name: 'status')
  String? Nstatus;
  @JsonKey(name: 'user_id')
  String? id ;
  SignupResponse({this.message,  this.Nstatus,this.id}){
    CachData.setData(key: 'Email_Id', id: id);
    if(id!=null){
      print('iddddddddd sdddddddd:${id}');

    }
  }

  factory SignupResponse.fromJson(Map<String, dynamic> json) =>
      _$SignupResponseFromJson(json);
}