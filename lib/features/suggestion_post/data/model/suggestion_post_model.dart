
class SuggestedPosts {
  String? status;
  String? message;
  List<Post1>? data;

  SuggestedPosts({this.status, this.message, this.data});

  SuggestedPosts.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['suggested_posts'] != null) {
      data = <Post1>[];
      json['suggested_posts']['data'].forEach((v) {
        data!.add(new Post1.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.data != null) {
      data['suggested_posts'] = this.data!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post1 {
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
  int? userid;



  Post1(
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
        this.updatedAt,
        this.userid});

  Post1.fromJson(Map<String, dynamic> json) {
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
    userid = json['user_id'];
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
    data['user_id'] = this.userid;
    return data;
  }
}
