import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/model/chat_message_model.dart';
import 'package:frontend/modules/chats/view_model/chat_view_model.dart';
import 'package:frontend/modules/theme/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';

class MessagesListBuilder extends StatefulWidget {
  const MessagesListBuilder({super.key});

  @override
  State<MessagesListBuilder> createState() => _MessagesListBuilderState();
}

class _MessagesListBuilderState extends State<MessagesListBuilder> {
  void _scrollToBottom() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (_scrollController.hasClients) {
        _scrollController.jumpTo(_scrollController.position.maxScrollExtent);
      }
    });
  }

  @override
  void initState() {
    super.initState();
    Future.microtask(() {
      if (mounted) {
        context.read<ChatViewModel>().getAllChats();
      }
    });
  }

  final ScrollController _scrollController = ScrollController();

  @override
  Widget build(BuildContext context) {
    Future.delayed(Duration(milliseconds: 100), () {
      _scrollToBottom();
    });
    final chatViewModel = context.watch<ChatViewModel>();
    List<ChatMessage> chatMessage = chatViewModel.chatMessage;
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: ListView.builder(
          controller: _scrollController,
          itemCount: chatMessage.length,
          itemBuilder: (context, index) {
            return Column(
              children: [
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerRight,
                  child: Container(
                      padding: EdgeInsets.all(8),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8),
                        color: context.watch<ThemeViewModel>().isDarkMode
                            ? Colors.black54
                            : Colors.black12,
                      ),
                      child: Column(
                        children: [
                          Text(chatMessage[index].userMessage),
                        ],
                      )),
                ),
                SizedBox(
                  height: 10,
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Container(
                    width: 240,
                    padding: EdgeInsets.all(8),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(8),
                      color: context.watch<ThemeViewModel>().isDarkMode
                          ? Colors.black54
                          : Colors.black12,
                    ),
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          "AI Bot",
                          style: TextStyle(
                              color: Colors.blue,
                              fontSize: 16,
                              fontWeight: FontWeight.bold),
                        ),
                        Text(chatMessage[index].aiResponse),
                      ],
                    ),
                  ),
                ),
                SizedBox(
                  height: 10,
                ),
              ],
            );
          }),
    );
  }
}
