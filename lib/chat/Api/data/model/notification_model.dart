
import 'msg_model.dart';

class NotificationModel {
  int chatId;
  Message message;

  NotificationModel({required this.chatId, required this.message});

  factory NotificationModel.fromJson(Map<String, dynamic> json) {
    return NotificationModel(
      chatId: int.parse(json['chat_id']),
      message: Message.fromJson(json['message']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_id': chatId,
      'message': message.toJson(),
    };
  }
}

class Message {
  String chatId;
  String message;
  int userId;
  DateTime updatedAt;
  DateTime createdAt;
  int id;
  ChatDetails chat;
  User user;

  Message({
    required this.chatId,
    required this.message,
    required this.userId,
    required this.updatedAt,
    required this.createdAt,
    required this.id,
    required this.chat,
    required this.user,
  });

  factory Message.fromJson(Map<String, dynamic> json) {
    return Message(
      chatId:json['chat_id'].toString(),
      message: json['message'],
      userId: json['user_id'],
      updatedAt: DateTime.parse(json['updated_at']),
      createdAt: DateTime.parse(json['created_at']),
      id: json['id'],
      chat: ChatDetails.fromJson(json['chat']),
      user: User.fromJson(json['user']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'chat_id': chatId,
      'message': message,
      'user_id': userId,
      'updated_at': updatedAt.toIso8601String(),
      'created_at': createdAt.toIso8601String(),
      'id': id,
      'chat': chat.toJson(),
      'user': user.toJson(),
    };
  }
}

class ChatDetails {
  int id;
  int createdBy;
  String? name;
  int isPrivate;
  DateTime createdAt;
  DateTime updatedAt;

  ChatDetails({
    required this.id,
    required this.createdBy,
    this.name,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
  });

  factory ChatDetails.fromJson(Map<String, dynamic> json) {
    return ChatDetails(
      id: json['id'],
      createdBy: json['created_by'],
      name: json['name'],
      isPrivate: json['is_private'],
      createdAt: DateTime.parse(json['created_at']),
      updatedAt: DateTime.parse(json['updated_at']),
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'created_by': createdBy,
      'name': name,
      'is_private': isPrivate,
      'created_at': createdAt.toIso8601String(),
      'updated_at': updatedAt.toIso8601String(),
    };
  }
}
