import 'package:flutter/material.dart';

class CustomContainerSuggestions extends StatelessWidget {
  const CustomContainerSuggestions({super.key, required this.suggestion});
  final String suggestion;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(vertical: 10),
      child: Container(
        width: double.infinity,
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(16),
          color: Colors.grey.withValues(alpha: .4),
        ),
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(child: Text(suggestion)),
        ),
      ),
    );
  }
}
