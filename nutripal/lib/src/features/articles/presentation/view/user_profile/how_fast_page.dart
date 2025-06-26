import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';

class HowFastPage extends StatelessWidget {
  const HowFastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleChoicePageWithPlainText(
      heading: "How Fast",
      description: "This will be used to calibrate your custom plan",
      options: ["Gain Weight", "Maintain", "Lose Weight"],
    );
  }
}