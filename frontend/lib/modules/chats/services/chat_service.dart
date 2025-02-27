import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:frontend/modules/chats/model/chat_history_model.dart';

class ChatService {
  final _client = Dio(
    BaseOptions(baseUrl: "https://ai-chatbot-nknp.onrender.com"),
  );

  Future<ChatHistoryResponse?> getChatHistory() async {
    try {
      final response = await _client.get("/api/v1/chat/get-allchats");

      await Future.delayed(Duration(seconds: 3));
      if (response.statusCode == 200) {
        final result = ChatHistoryResponse.fromMap(response.data);
        return result;
      }
    } catch (error) {
      log("Error fetching chat history: $error");
      return null; // Return null in case of error
    }
  }

  Future<void> chat(prompt) async {
    try {
      await _client.post(
        "/api/v1/chat/get-response",
        data: {
          "prompt": prompt, // Sending body as JSON
        },
        options: Options(
          headers: {
            "Content-Type": "application/json", // Set headers if needed
          },
        ),
      );
    } catch (error) {
      log("Error fetching chat history: $error");
    }
  }
}
