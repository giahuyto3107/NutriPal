import 'package:flutter/material.dart';

class MultipleChoicePageWithPlainText extends StatelessWidget {
  final String heading;
  final String description;
  final List<String> options;

  const MultipleChoicePageWithPlainText({
    super.key,
    required this.heading,
    required this.description,
    required this.options
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Text(
          heading,
          style: TextStyle(
            fontWeight: FontWeight.bold
          ),
        ),
        Text(
          description,
        ),

        
      ],
    );
  }
}