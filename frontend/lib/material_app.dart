import 'package:flutter/material.dart';
import 'package:frontend/modules/chats/view/chat_page.dart';
import 'package:frontend/modules/theme/view_model/theme_view_model.dart';
import 'package:provider/provider.dart';

class MaterialAppWidget extends StatelessWidget {
  const MaterialAppWidget({super.key});

  @override
  Widget build(BuildContext context) {
    // Listen for theme changes via ThemeViewModel
    final themeData = context.watch<ThemeViewModel>().themeData;

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      // scaffoldMessengerKey: scaffoldMessengerKey, // Assign the key
      theme: themeData, // Use the theme from the provider
      home: const ChatPage(), // Set the initial screen
    );
  }
}
