import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/model/chat_message_model.dart';
import 'package:frontend/modules/chats/services/chat_service.dart';

class ChatViewModel extends ChangeNotifier {
  List<ChatMessage> chatMessage = [];

  final ChatService _service = ChatService();

  Future<void> getAllChats() async {
    final response = await _service.getChatHistory();
    if (response?.statusCode == 200) {
      chatMessage = response!.data;
    }
    notifyListeners();
  }

  void chat(prompt) async {
    await _service.chat(prompt);
    getAllChats();
    notifyListeners();
  }

  void addChat(prompt) {
    final newChat = ChatMessage.fromMap({
      "_id": "",
      "userMessage": prompt,
      "aiResponse": "Fetching.....",
      "createdAt": "2025-02-25T17:19:17.443Z",
      "updatedAt": "2025-02-25T17:19:17.443Z",
      "__v": 0
    });
    chatMessage.add(newChat);
    notifyListeners();
  }
}
