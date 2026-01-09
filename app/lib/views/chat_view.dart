import 'package:app/widgets/chat_view_widgets/app_bar_builder.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const String id = "ChatView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(appBar: appBarBuilder(context), body: Column());
  }
}
