// // class WishlistPost {
// //   final int id;
// //   final int? companyId;
// //   final String? companyName;
// //   final String? companyLogo;
// //   final String? companyLocation;
// //   final String generalJobTitle;
// //   final String specialization;
// //   final String? enrollmentStatus;
// //   final String? preferedGender;
// //   final String? preferedExperience;
// //   final String? detailedLocation;
// //   final String requirements;
// //   final String promises;
// //   final String jobInformation;
// //   final String applicationDeadline;
// //   final String? expectedSalary;
// //   final int isTaken;
// //   final String createdAt;
// //   final String updatedAt;
// //   final int? freelancerId;
// //   final String? profilePhoto;
// //   final String? phoneNumber;
// //   final String? location;
// //   final String? earnings;
// //
// //   WishlistPost({
// //     required this.id,
// //     this.companyId,
// //     this.companyName,
// //     this.companyLogo,
// //     this.companyLocation,
// //     required this.generalJobTitle,
// //     required this.specialization,
// //     this.enrollmentStatus,
// //     this.preferedGender,
// //     this.preferedExperience,
// //     this.detailedLocation,
// //     required this.requirements,
// //     required this.promises,
// //     required this.jobInformation,
// //     required this.applicationDeadline,
// //     this.expectedSalary,
// //     required this.isTaken,
// //     required this.createdAt,
// //     required this.updatedAt,
// //     this.freelancerId,
// //     this.profilePhoto,
// //     this.phoneNumber,
// //     this.location,
// //     this.earnings,
// //   });
// //
// //   factory WishlistPost.fromJson(Map<String, dynamic> json) {
// //     return WishlistPost(
// //       id: json['id'],
// //       companyId: json['company_id'],
// //       companyName: json['company_name'],
// //       companyLogo: json['company_logo'],
// //       companyLocation: json['company_location'],
// //       generalJobTitle: json['general_job_title'],
// //       specialization: json['specialization'],
// //       enrollmentStatus: json['enrollment_status'],
// //       preferedGender: json['prefered_gender'],
// //       preferedExperience: json['prefered_experience'],
// //       detailedLocation: json['detailed_location'],
// //       requirements: json['requirements'],
// //       promises: json['promises'],
// //       jobInformation: json['job_information'],
// //       applicationDeadline: json['application_deadline'],
// //       expectedSalary: json['expected_salary'],
// //       isTaken: json['is_taken'],
// //       createdAt: json['created_at'],
// //       updatedAt: json['updated_at'],
// //       freelancerId: json['freelancer_id'],
// //       profilePhoto: json['profile_photo'],
// //       phoneNumber: json['phone_number'],
// //       location: json['location'],
// //       earnings: json['earnings'],
// //     );
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     return {
// //       'id': id,
// //       'company_id': companyId,
// //       'company_name': companyName,
// //       'company_logo': companyLogo,
// //       'company_location': companyLocation,
// //       'general_job_title': generalJobTitle,
// //       'specialization': specialization,
// //       'enrollment_status': enrollmentStatus,
// //       'prefered_gender': preferedGender,
// //       'prefered_experience': preferedExperience,
// //       'detailed_location': detailedLocation,
// //       'requirements': requirements,
// //       'promises': promises,
// //       'job_information': jobInformation,
// //       'application_deadline': applicationDeadline,
// //       'expected_salary': expectedSalary,
// //       'is_taken': isTaken,
// //       'created_at': createdAt,
// //       'updated_at': updatedAt,
// //       'freelancer_id': freelancerId,
// //       'profile_photo': profilePhoto,
// //       'phone_number': phoneNumber,
// //       'location': location,
// //       'earnings': earnings,
// //     };
// //   }
// // }
// //
// // class ResponseModel {
// //   final String status;
// //   final Map<String, List<List<WishlistPost>>> wishlistPosts;
// //
// //   ResponseModel({
// //     required this.status,
// //     required this.wishlistPosts,
// //   });
// //
// //   factory ResponseModel.fromJson(Map<String, dynamic> json) {
// //     var wishlistPostsJson = json['wishlist_posts'] as Map<String, dynamic>;
// //     Map<String, List<List<WishlistPost>>> wishlistPosts = {};
// //
// //     wishlistPostsJson.forEach((key, value) {
// //       var listOfLists = (value as List)
// //           .map((list) => (list as List)
// //           .map((item) => WishlistPost.fromJson(item))
// //           .toList())
// //           .toList();
// //       wishlistPosts[key] = listOfLists;
// //     });
// //
// //     return ResponseModel(
// //       status: json['status'],
// //       wishlistPosts: wishlistPosts,
// //     );
// //   }
// //
// //   Map<String, dynamic> toJson() {
// //     Map<String, dynamic> wishlistPostsJson = {};
// //
// //     wishlistPosts.forEach((key, value) {
// //       var listOfLists = value
// //           .map((list) => list.map((item) => item.toJson()).toList())
// //           .toList();
// //       wishlistPostsJson[key] = listOfLists;
// //     });
// //
// //     return {
// //       'status': status,
// //       'wishlist_posts': wishlistPostsJson,
// //     };
// //   }
// // }
// // save_model.dart
// // class ResponseModel {
// //   final List<WishlistPost> wishlistPosts;
// //
// //   ResponseModel({required this.wishlistPosts});
// //
// //   factory ResponseModel.fromJson(Map<String, dynamic> json) {
// //     return ResponseModel(
// //       wishlistPosts: (json['wishlistPosts'] as List)
// //           .map((i) => WishlistPost.fromJson(i))
// //           .toList(),
// //     );
// //   }
// // }
// //
// // class WishlistPost {
// //   final String? companyLogo;
// //   final String? generalJobTitle;
// //   final String? companyName;
// //   final String? detailedLocation;
// //   final String? expectedSalary;
// //   final String? enrollmentStatus;
// //   final String? requirements;
// //   final String? jobInformation;
// //   final String? applicationDeadline;
// //   WishlistPost({
// //     this.companyLogo,
// //     this.generalJobTitle,
// //     this.companyName,
// //     this.detailedLocation,
// //     this.expectedSalary,
// //     this.enrollmentStatus,
// //     this.requirements,
// //     this.jobInformation,
// //     this.applicationDeadline,
// //   });
// //
// //   factory WishlistPost.fromJson(Map<String, dynamic> json) {
// //     return WishlistPost(
// //       companyLogo: json['companyLogo'],
// //       generalJobTitle: json['generalJobTitle'],
// //       companyName: json['companyName'],
// //       detailedLocation: json['detailedLocation'],
// //       expectedSalary: json['expectedSalary'],
// //       enrollmentStatus: json['enrollmentStatus'],
// //       requirements: json['requirements'],
// //       jobInformation: json['jobInformation'],
// //       applicationDeadline: json['applicationDeadline'],
// //     );
// //   }
// // }
// class ResponseModel {
//   ResponseModel({
//     required this.status,
//     required this.wishlistPosts,
//   });
//
//   final String? status;
//   final WishlistPosts? wishlistPosts;
//
//   factory ResponseModel.fromJson(Map<String, dynamic> json){
//     return ResponseModel(
//       status: json["status"],
//       wishlistPosts: json["wishlist_posts"] == null ? null : WishlistPosts.fromJson(json["wishlist_posts"]),
//     );
//   }
//
// }
//
// class WishlistPosts {
//   WishlistPosts({
//     required this.wishlistPostsDefault,
//   });
//
//   final List<List<Default>> wishlistPostsDefault;
//
//   factory WishlistPosts.fromJson(Map<String, dynamic> json){
//     return WishlistPosts(
//       wishlistPostsDefault: json["default"] == null ? [] : List<List<Default>>.from(json["default"]!.map((x) => x == null ? [] : List<Default>.from(x!.map((x) => Default.fromJson(x))))),
//     );
//   }
//
// }
//
// class Default {
//   Default({
//     required this.id,
//     required this.companyId,
//     required this.companyName,
//     required this.companyLogo,
//     required this.companyLocation,
//     required this.generalJobTitle,
//     required this.specialization,
//     required this.enrollmentStatus,
//     required this.preferedGender,
//     required this.preferedExperience,
//     required this.detailedLocation,
//     required this.requirements,
//     required this.promises,
//     required this.jobInformation,
//     required this.applicationDeadline,
//     required this.expectedSalary,
//     required this.isTaken,
//     required this.createdAt,
//     required this.updatedAt,
//     required this.freelancerId,
//     required this.profilePhoto,
//     required this.phoneNumber,
//     required this.location,
//     required this.earnings,
//   });
//
//   final int? id;
//   final int? companyId;
//   final String? companyName;
//   final String? companyLogo;
//   final String? companyLocation;
//   final String? generalJobTitle;
//   final String? specialization;
//   final String? enrollmentStatus;
//   final String? preferedGender;
//   final String? preferedExperience;
//   final String? detailedLocation;
//   final String? requirements;
//   final String? promises;
//   final String? jobInformation;
//   final String? applicationDeadline;
//   final String? expectedSalary;
//   final int? isTaken;
//   final DateTime? createdAt;
//   final DateTime? updatedAt;
//   final int? freelancerId;
//   final String? profilePhoto;
//   final String? phoneNumber;
//   final String? location;
//   final String? earnings;
//
//   factory Default.fromJson(Map<String, dynamic> json){
//     return Default(
//       id: json["id"],
//       companyId: json["company_id"],
//       companyName: json["company_name"],
//       companyLogo: json["company_logo"],
//       companyLocation: json["company_location"],
//       generalJobTitle: json["general_job_title"],
//       specialization: json["specialization"],
//       enrollmentStatus: json["enrollment_status"],
//       preferedGender: json["prefered_gender"],
//       preferedExperience: json["prefered_experience"],
//       detailedLocation: json["detailed_location"],
//       requirements: json["requirements"],
//       promises: json["promises"],
//       jobInformation: json["job_information"],
//       applicationDeadline: json["application_deadline"] ?? "",
//       expectedSalary: json["expected_salary"],
//       isTaken: json["is_taken"],
//       createdAt: DateTime.tryParse(json["created_at"] ?? ""),
//       updatedAt: DateTime.tryParse(json["updated_at"] ?? ""),
//       freelancerId: json["freelancer_id"],
//       profilePhoto: json["profile_photo"],
//       phoneNumber: json["phone_number"],
//       location: json["location"],
//       earnings: json["earnings"],
//     );
//   }
//
// }
// save_response_model.dart
class ResponseModel {
  final String status;
  final WishlistPosts wishlistPosts;

  ResponseModel({required this.status, required this.wishlistPosts});

  factory ResponseModel.fromJson(Map<String, dynamic> json) {
    return ResponseModel(
      status: json['status'],
      wishlistPosts: WishlistPosts.fromJson(json['wishlist_posts']),
    );
  }
}
// wishlist_posts.dart
class WishlistPosts {
  final List<List<WishlistPost>> posts;

  WishlistPosts({required this.posts});

  factory WishlistPosts.fromJson(Map<String, dynamic> json) {
    return WishlistPosts(
      posts: (json['default'] as List).map((e) => (e as List).map((item) => WishlistPost.fromJson(item)).toList()).toList(),
    );
  }
}
// wishlist_post.dart
class WishlistPost {
  final int? id;
  final int? companyId;
  final String? companyName;
  final String? companyLogo;
  final String? companyLocation;
  final String? generalJobTitle;
  final String? specialization;
  final String? enrollmentStatus;
  final String? preferedGender;
  final String? preferedExperience;
  final String? detailedLocation;
  final String? requirements;
  final String? promises;
  final String? jobInformation;
  final String? applicationDeadline;
  final String? expectedSalary;
  final int? isTaken;
  final String? createdAt;
  final String? updatedAt;

  // For freelancer fields
  final int? freelancerId;
  final String? profilePhoto;
  final String? phoneNumber;
  final String? location;
  final String? earnings;

  WishlistPost({
    this.id,
    this.companyId,
    this.companyName,
    this.companyLogo,
    this.companyLocation,
    this.generalJobTitle,
    this.specialization,
    this.enrollmentStatus,
    this.preferedGender,
    this.preferedExperience,
    this.detailedLocation,
    this.requirements,
    this.promises,
    this.jobInformation,
    this.applicationDeadline,
    this.expectedSalary,
    this.isTaken,
    this.createdAt,
    this.updatedAt,
    this.freelancerId,
    this.profilePhoto,
    this.phoneNumber,
    this.location,
    this.earnings,
  });

  factory WishlistPost.fromJson(Map<String, dynamic> json) {
    return WishlistPost(
      id: json['id'],
      companyId: json['company_id'],
      companyName: json['company_name'],
      companyLogo: json['company_logo'],
      companyLocation: json['company_location'],
      generalJobTitle: json['general_job_title'],
      specialization: json['specialization'],
      enrollmentStatus: json['enrollment_status'],
      preferedGender: json['prefered_gender'],
      preferedExperience: json['prefered_experience'],
      detailedLocation: json['detailed_location'],
      requirements: json['requirements'],
      promises: json['promises'],
      jobInformation: json['job_information'],
      applicationDeadline: json['application_deadline'],
      expectedSalary: json['expected_salary'],
      isTaken: json['is_taken'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      freelancerId: json['freelancer_id'],
      profilePhoto: json['profile_photo'],
      phoneNumber: json['phone_number'],
      location: json['location'],
      earnings: json['earnings'],
    );
  }
}
