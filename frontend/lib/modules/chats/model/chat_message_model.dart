import 'dart:convert';

class ChatMessage {
  final String id;
  final String userMessage;
  final String aiResponse;
  final DateTime createdAt;
  final DateTime updatedAt;
  final int version;

  ChatMessage({
    required this.id,
    required this.userMessage,
    required this.aiResponse,
    required this.createdAt,
    required this.updatedAt,
    required this.version,
  });

  // ✅ Convert JSON to Dart Object
  factory ChatMessage.fromJson(String str) =>
      ChatMessage.fromMap(json.decode(str));

  factory ChatMessage.fromMap(Map<String, dynamic> json) => ChatMessage(
        id: json["_id"],
        userMessage: json["userMessage"],
        aiResponse: json["aiResponse"],
        createdAt: DateTime.parse(json["createdAt"]),
        updatedAt: DateTime.parse(json["updatedAt"]),
        version: json["__v"],
      );

  // ✅ Convert Dart Object to JSON
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "_id": id,
        "userMessage": userMessage,
        "aiResponse": aiResponse,
        "createdAt": createdAt.toIso8601String(),
        "updatedAt": updatedAt.toIso8601String(),
        "__v": version,
      };
}
