import 'dart:convert';
import 'package:frontend/modules/chats/model/chat_message_model.dart';

class ChatHistoryResponse {
  final int statusCode;
  final List<ChatMessage> data;
  final String message;
  final bool success;

  ChatHistoryResponse({
    required this.statusCode,
    required this.data,
    required this.message,
    required this.success,
  });

  // ✅ Convert JSON to Dart Object
  factory ChatHistoryResponse.fromJson(String str) =>
      ChatHistoryResponse.fromMap(json.decode(str));

  factory ChatHistoryResponse.fromMap(Map<String, dynamic> json) =>
      ChatHistoryResponse(
        statusCode: json["statusCode"],
        data: List<ChatMessage>.from(
            json["data"].map((x) => ChatMessage.fromMap(x))),
        message: json["message"],
        success: json["success"],
      );

  // ✅ Convert Dart Object to JSON
  String toJson() => json.encode(toMap());

  Map<String, dynamic> toMap() => {
        "statusCode": statusCode,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
        "message": message,
        "success": success,
      };
}
