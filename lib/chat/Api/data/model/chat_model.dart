
import 'msg_model.dart';

class LastMessage {
  final int id;
  final int userId;
  final String chatId;
  final String message;
  final User user;

  LastMessage({
    required this.id,
    required this.userId,
    required this.chatId,
    required this.message,
    required this.user,
  });

  factory LastMessage.fromJson(Map<String, dynamic> json) {
    return LastMessage(
      id: json['id'],
      userId: json['user_id'],
      chatId: json['chat_id'].toString(),
      message: json['message'],
      user: User.fromJson(json['user']),
    );
  }
}

class Participant {
  final int id;
  final int userId;
  final String chatId;
  final User user;

  Participant({
    required this.id,
    required this.userId,
    required this.chatId,
    required this.user,
  });

  factory Participant.fromJson(Map<String, dynamic> json) {
    return Participant(
      id: json['id'],
      userId: json['user_id'],
      chatId: json['chat_id'].toString(),
      user: User.fromJson(json['user']),
    );
  }
}

class ChatModel {
  final int id;
  final int createdBy;
  final String? name;
  final int? isPrivate;
  final String createdAt;
  final String updatedAt;
  final LastMessage? lastMessage;
  final List<Participant> participants;

  ChatModel({
    required this.id,
    required this.createdBy,
    this.name,
    required this.isPrivate,
    required this.createdAt,
    required this.updatedAt,
    required this.lastMessage,
    required this.participants,
  });

  factory ChatModel.fromJson(Map<String, dynamic> json) {
    var participantsList = json['participants'] as List;
    List<Participant> participants =
        participantsList.map((i) => Participant.fromJson(i)).toList();

    return ChatModel(
      id: json['id'],
      createdBy: json['created_by'],
      name: json['name'],
      isPrivate: json['is_private'],
      createdAt: json['created_at'],
      updatedAt: json['updated_at'],
      lastMessage: json['last_message'] != null
          ? LastMessage.fromJson(json['last_message'])
          : null,
      participants: participants,
    );
  }
}
