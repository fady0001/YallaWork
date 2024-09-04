
class PostModels {
  String? status;
  String? message;
  List<Post>? posts;

  PostModels({this.status, this.message, this.posts});

  PostModels.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Post>[];
      json['posts']['data'].forEach((v) {
        posts!.add(new Post.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['status'] = this.status;
    data['message'] = this.message;
    if (this.posts != null) {
      data['posts'] = this.posts!.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Post {
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
  int ?userId;

  Post(
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
      this.userId
      });

  Post.fromJson(Map<String, dynamic> json) {
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
    userId = json['user_id'];
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
    data['user_id'] = this.userId;
    return data;
  }
}
