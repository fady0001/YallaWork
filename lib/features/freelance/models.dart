class FreelanceModel {
  String? status;
  String? message;
  List<Freelance>? posts;

  FreelanceModel({this.status, this.message, this.posts});

  FreelanceModel.fromJson(Map<String, dynamic> json) {
    status = json['status'];
    message = json['message'];
    if (json['posts'] != null) {
      posts = <Freelance>[];
      json['posts']['data'].forEach((v) {
        posts!.add(new Freelance.fromJson(v));
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


class Freelance {
  int? id;
  int? freelancerId;
  String? profilePhoto;
  String? phoneNumber;
  String? location;
  String? generalJobTitle;
  String? specialization;
  String? earnings;
  String? jobInformation;
  String? requirements;
  String? applicationDeadline;
  int? isTaken;
  String? createdAt;
  String? updatedAt;
  int? userid;

  Freelance(
      {this.id,
        this.freelancerId,
        this.profilePhoto,
        this.phoneNumber,
        this.location,
        this.generalJobTitle,
        this.specialization,
        this.earnings,
        this.jobInformation,
        this.requirements,
        this.applicationDeadline,
        this.isTaken,
        this.createdAt,
        this.updatedAt,
        this.userid
      });

  Freelance.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    freelancerId = json['freelancer_id'];
    profilePhoto = json['profile_photo'];
    phoneNumber = json['phone_number'];
    location = json['location'];
    generalJobTitle = json['general_job_title'];
    specialization = json['specialization'];
    earnings = json['earnings'];
    jobInformation = json['job_information'];
    requirements = json['requirements'];
    applicationDeadline = json['application_deadline'];
    isTaken = json['is_taken'];
    createdAt = json['created_at'];
    updatedAt = json['updated_at'];
    userid = json['user_id'];
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
    data['job_information'] = this.jobInformation;
    data['requirements'] = this.requirements;
    data['application_deadline'] = this.applicationDeadline;
    data['is_taken'] = this.isTaken;
    data['created_at'] = this.createdAt;
    data['updated_at'] = this.updatedAt;
    data['user_id'] = this.userid;
    return data;
  }
}


