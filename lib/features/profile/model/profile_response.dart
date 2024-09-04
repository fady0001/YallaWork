
import '../../add/widget/shared_preferences.dart';

class ProfileInformation {
  final String fullName;
  final String email;
  final String profilePhoto;
  final String dateOfBirth;
  final String city;
  final List<String> searchFor;
  final String additionalInformation;
 String? cv;

  ProfileInformation({
    required this.fullName,
    required this.email,
    required this.profilePhoto,
    required this.dateOfBirth,
    required this.city,
    required this.searchFor,
    required this.additionalInformation,
     this.cv,
  }){
    CachData.setData(key: 'photo', id: profilePhoto);
   String pj= CachData.getData(key: 'photo');
    print(pj);
  }

  factory ProfileInformation.fromJson(Map<String, dynamic> json) {
    return ProfileInformation(
      fullName: json['full_name'],
      email: json['email'],
      profilePhoto: json['profile_photo'],
      dateOfBirth: json['date_of_birth'],
      city: json['city'],
      searchFor: List<String>.from(json['search_for']),
      additionalInformation: json['additional_information'],
       cv:json['cv'],
    );
  }
}

class ProfileResponse {
  final String status;
  final String message;
  final ProfileInformation profileInformation;

  ProfileResponse({
    required this.status,
    required this.message,
    required this.profileInformation,
  });

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      status: json['status'],
      message: json['message'],
      profileInformation: ProfileInformation.fromJson(json['profile_information']),
    );
  }
}
