class User {
  final int id;
  final String firstName;
  final String lastName;
  final String role;
  final String email;
  final String? emailVerifiedAt;
  final int addedInfo;
  final int isAdmin;
  final String createdAt;
  final String updatedAt;

  User({
    required this.id,
    required this.firstName,
    required this.lastName,
    required this.role,
    required this.email,
    this.emailVerifiedAt,
    required this.addedInfo,
    required this.isAdmin,
    required this.createdAt,
    required this.updatedAt,
  });

  factory User.fromJson(Map<String, dynamic> json) {
    return User(
      id: json['id'],
      firstName: json['first_name'],
      lastName: json['last_name'],
      role: json['role'],
      email: json['email'],
      emailVerifiedAt: json['email_verified_at'],
      addedInfo: json['added_info'],
      isAdmin: json['is_admin'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'first_name': firstName,
      'last_name': lastName,
      'role': role,
      'email': email,
      'email_verified_at': emailVerifiedAt,
      'added_info': addedInfo,
      'is_admin': isAdmin,
    };
  }
}

class MessageModel {
  final int id;
  final int userId;
  final String chatId;
  final String message;

  final User user;

  MessageModel({
    required this.id,
    required this.userId,
    required this.chatId,
    required this.message,
    required this.user,
  });

  factory MessageModel.fromJson(Map<String, dynamic> json) {
    return MessageModel(
      id: json['id'],
      userId: json['user_id'],
      chatId: json['chat_id'].toString(),
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}
