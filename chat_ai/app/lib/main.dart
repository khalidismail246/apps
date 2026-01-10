import 'package:app/views/chat_view.dart';
import 'package:app/views/splash_view.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(ChatAI());
}

class ChatAI extends StatelessWidget {
  const ChatAI({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: SplashView.id,
      routes: {
        SplashView.id: (context) => SplashView(),
        ChatView.id: (context) => ChatView(),
      },
    );
  }
}
