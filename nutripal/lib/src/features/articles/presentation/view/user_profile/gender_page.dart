import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';

class GenderPage extends StatelessWidget {
  const GenderPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleChoicePageWithPlainText(
      heading: "Choose your Gender",
      description: "This will be used to calibrate your custom plan",
      options: ["Male", "Female", "Other"],
    );
  }
}