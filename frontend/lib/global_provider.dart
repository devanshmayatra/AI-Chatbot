import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/view_model/chat_view_model.dart';
import 'package:frontend/modules/theme/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';

class GlobalProvider extends StatelessWidget {
  const GlobalProvider({
    super.key,
    required this.child,
  });

  final Widget child;

  @override
  Widget build(BuildContext context) {
    return MultiProvider(providers: [
      ChangeNotifierProvider(create: (context) => ThemeViewModel()),
      ChangeNotifierProvider(create: (context) => ChatViewModel()),
    ], child: child);
  }
}
