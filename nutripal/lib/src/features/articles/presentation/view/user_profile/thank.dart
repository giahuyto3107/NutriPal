import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';

class Thank extends StatelessWidget {
  const Thank({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleChoicePageWithPlainText(
      heading: "Thanks For Trusting",
      description: "This will be used to calibrate your custom plan",
      options: ["Gain Weight", "Maintain", "Lose Weight"],
    );
  }
}