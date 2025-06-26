import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';

class WorkoutFrequencyPage extends StatelessWidget {
  const WorkoutFrequencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return MultipleChoicePageWithPlainText(
      heading: "How many workouts do you do per week",
      description: "This will be used to calibrate your custom plan",
      options: ["0-2", "3-5", "6+"],
    );
  }
}