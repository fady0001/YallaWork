

class SearchMmodel {
  String? status;
  List<Data>? posts;
  List<DataF>? freelancePosts;

  SearchMmodel({this.status, this.posts, this.freelancePosts});

  SearchMmodel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    if (json['posts'] != null) {
      posts = <Data>[];
      json['posts']['data'].forEach((v) {
        posts!.add(new Data.fromJson(v));
      });
    }
    if (json['freelance_posts'] != null) {
      freelancePosts = <DataF>[];
      json['freelance_posts']['data'].forEach((v) {
        freelancePosts!.add(new DataF.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    if (this.freelancePosts != null) {
      data['freelance_posts'] = this.freelancePosts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}



class Data {
  int? id;
  int? companyId;
  String? companyName;
  String? companyLogo;
  String? companyLocation;
  String? generalJobTitle;
  String? specialization;
  String? enrollmentStatus;
  String? preferedGender;
  String? preferedExperience;
  String? detailedLocation;
  String? requirements;
  String? promises;
  String? jobInformation;
  String? applicationDeadline;
  String? expectedSalary;
  int? isTaken;
  String? createdAt;
  String? updatedAt;

  Data(
      {this.id,
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
        this.updatedAt});

  Data.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    companyId = json['company_id'];
    companyName = json['company_name'];
    companyLogo = json['company_logo'];
    companyLocation = json['company_location'];
    generalJobTitle = json['general_job_title'];
    specialization = json['specialization'];
    enrollmentStatus = json['enrollment_status'];
    preferedGender = json['prefered_gender'];
    preferedExperience = json['prefered_experience'];
    detailedLocation = json['detailed_location'];
    requirements = json['requirements'];
    promises = json['promises'];
    jobInformation = json['job_information'];
    applicationDeadline = json['application_deadline'];
    expectedSalary = json['expected_salary'];
    isTaken = json['is_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['company_id'] = this.companyId;
    data['company_name'] = this.companyName;
    data['company_logo'] = this.companyLogo;
    data['company_location'] = this.companyLocation;
    data['general_job_title'] = this.generalJobTitle;
    data['specialization'] = this.specialization;
    data['enrollment_status'] = this.enrollmentStatus;
    data['prefered_gender'] = this.preferedGender;
    data['prefered_experience'] = this.preferedExperience;
    data['detailed_location'] = this.detailedLocation;
    data['requirements'] = this.requirements;
    data['promises'] = this.promises;
    data['job_information'] = this.jobInformation;
    data['application_deadline'] = this.applicationDeadline;
    data['expected_salary'] = this.expectedSalary;
    data['is_taken'] = this.isTaken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;
  }
}



class DataF {
  final int id;
  final int freelancerId;
  final String profilePhoto;
  final String phoneNumber;
  final String location;
  final String generalJobTitle;
  final String specialization;
  final String earnings;
  final String jobInformation;
  final String requirements;
  final String applicationDeadline;
  final int isTaken;
  final String createdAt;
  final String updatedAt;

  DataF({
    required this.id,
    required this.freelancerId,
    required this.profilePhoto,
    required this.phoneNumber,
    required this.location,
    required this.generalJobTitle,
    required this.specialization,
    required this.earnings,
    required this.jobInformation,
    required this.requirements,
    required this.applicationDeadline,
    required this.isTaken,
    required this.createdAt,
    required this.updatedAt,
  });

  factory DataF.fromJson(Map<String, dynamic> json) {
    return DataF(
      id: json['id'],
      freelancerId: json['freelancer_id'],
      profilePhoto: json['profile_photo'],
      phoneNumber: json['phone_number'],
      location: json['location'],
      generalJobTitle: json['general_job_title'],
      specialization: json['specialization'],
      earnings: json['earnings'],
      jobInformation: json['job_information'],
      requirements: json['requirements'],
      applicationDeadline: json['application_deadline'],
      isTaken: json['is_taken'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['freelancer_id'] = this.freelancerId;
    data['profile_photo'] = this.profilePhoto;
    data['phone_number'] = this.phoneNumber;
    data['location'] = this.location;
    data['general_job_title'] = this.generalJobTitle;
    data['specialization'] = this.specialization;
    data['earnings'] = this.earnings;
    data['requirements'] = this.requirements;
    data['job_information'] = this.jobInformation;
    data['application_deadline'] = this.applicationDeadline;
    data['application_deadline'] = this.applicationDeadline;
    data['is_taken'] = this.isTaken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    return data;


  }
}



