import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';


// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

class MultipleStepForm extends StatelessWidget {
  const MultipleStepForm({super.key});

  @override
  Widget build(BuildContext context) {
    PageController _controller = PageController();
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: PageView(
        controller: _controller,
        children: [
          GenderPage(),
          // workoutFrequencyPage(),
          // HeightAndWeightPage(),
        ],
      ),
    );
  }
}