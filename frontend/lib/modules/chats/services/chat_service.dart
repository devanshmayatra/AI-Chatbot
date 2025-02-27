import 'dart:developer';
import 'package:dio/dio.dart';
import 'package:frontend/modules/chats/model/chat_history_model.dart';
import 'package:http/http.dart' as http;

class ChatService {
  final _client = Dio(BaseOptions(baseUrl: "http://10.0.2.2:3333"));

  Future<ChatHistoryResponse?> getChatHistory() async {
    try {
      // final response = await _client.get("/api/v1/chat/get-allchats");
      final response = await http
          .get(Uri.parse("http://10.0.2.2:3333/api/v1/chat/get-allchats"));
      log(response.body);

      // ✅ Log response correctly
      log(response.toString());

      // await Future.delayed(Duration(seconds: 3));
      // if (response.statusCode == 200) {
      //   final result = ChatHistoryResponse.fromMap(response.data);
      //   return result;
      // }

      // ✅ Convert JSON response to ChatHistoryResponse model
      // return ChatHistoryResponse.fromMap(response);
    } catch (error) {
      log("Error fetching chat history: $error");
      return null; // Return null in case of error
    }
  }
}
