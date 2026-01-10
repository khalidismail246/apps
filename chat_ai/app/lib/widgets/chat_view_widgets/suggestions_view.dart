import 'package:app/models/Suggestions_model.dart';
import 'package:app/widgets/chat_view_widgets/custom_container_suggestions.dart';
import 'package:flutter/material.dart';

class SuggestionsView extends StatelessWidget {
  const SuggestionsView({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          Image.asset(
            "assets/images/robot.png",
            width: MediaQuery.of(context).size.width * .5,
          ),
          SizedBox(height: 80),
          Column(
            children: SuggestionsModel.suggestions
                .map(
                  (suggestion) =>
                      CustomContainerSuggestions(suggestion: suggestion),
                )
                .toList(),
          ),
        ],
      ),
    );
  }
}
