import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/model/chat_message_model.dart';
import 'package:frontend/modules/chats/services/chat_service.dart';

class ChatViewModel extends ChangeNotifier {
  List<ChatMessage> chatMessage = [];

  final ChatService _service = ChatService();

  Future<void> getAllChats() async {
    final response = await _service.getChatHistory();
    log(response.toString());
    notifyListeners();
  }
}
