import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/view/widgets/messages_list_builder.dart';
import 'package:frontend/modules/chats/view_model/chat_view_model.dart';
import 'package:frontend/modules/theme/view/widget/theme_buttom.dart';
import 'package:provider/provider.dart';

class ChatPage extends StatefulWidget {
  const ChatPage({super.key});

  @override
  State<ChatPage> createState() => _ChatPageState();
}

class _ChatPageState extends State<ChatPage> {
  TextEditingController promtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('AI ChatBot'),
        actions: [
          Padding(
            padding: EdgeInsets.all(8),
            child: ThemeButtom(),
          )
        ],
      ),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          const Expanded(
            child: MessagesListBuilder(),
          ),
          Container(
            color: Theme.of(context).colorScheme.surface,
            child: Row(
              children: [
                Expanded(
                  child: Padding(
                    padding: EdgeInsets.symmetric(
                      horizontal: 8,
                      vertical: 4,
                    ),
                    child: TextField(
                      controller: promtController,
                      onChanged: (value) {},
                      decoration: const InputDecoration(
                        hintText: 'Type your message...',
                      ),
                    ),
                  ),
                ),
                IconButton(
                  onPressed: () async {
                    context.read<ChatViewModel>().getAllChats();
                  },
                  icon: const Icon(Icons.send),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
