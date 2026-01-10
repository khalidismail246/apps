import 'package:app/widgets/chat_view_widgets/custom_text_field.dart';
import 'package:app/widgets/chat_view_widgets/suggestions_view.dart';
import 'package:app/widgets/chat_view_widgets/app_bar_builder.dart';
import 'package:flutter/material.dart';

class ChatView extends StatelessWidget {
  const ChatView({super.key});
  static const String id = "ChatView";

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      resizeToAvoidBottomInset: true,
      appBar: appBarBuilder(context),
      body: SingleChildScrollView(
        child: Center(child: Column(children: [SuggestionsView()])),
      ),
      bottomNavigationBar: Padding(
        padding: MediaQuery.of(context).viewInsets,
        child: CustomTextField(),
      ),
    );
  }
}
