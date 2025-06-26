import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/goal_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/workout_frequency_page.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/form_progress_view_model.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

// import 'package:provider/provider.dart';
// import 'package:intl/intl.dart';

class MultipleStepForm extends StatefulWidget {
  const MultipleStepForm({super.key});

  @override
  State<MultipleStepForm> createState() => _MultipleStepFormState();
}

class _MultipleStepFormState extends State<MultipleStepForm> {
  final PageController _controller = PageController();
  int _currentStep = 0;

  void nextPage() {
    final store = Provider.of<UserProfileStore>(context, listen: false);
    if (_currentStep == 0 && (store.input.gender == null || store.input.gender!.isEmpty)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text('Please select your gender.')),
      );
      return;
    }
    if (_currentStep < 8) {
      if (_currentStep == 5 && store.input.goal!.toLowerCase() == "maintain") {
        setState(() => _currentStep += 2);
        _controller.animateToPage(_controller.page!.toInt() + 2, duration: Duration(milliseconds: 300), curve: Curves.ease);
        Provider.of<FormProgressViewModel>(context, listen: false).setStep(7);  
      }

      // Main flow
      else {
        setState(() => _currentStep++);
        _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        Provider.of<FormProgressViewModel>(context, listen: false).nextStep();
      }
      
    }

    else if (_currentStep == 8) {
      // Move to HomePage
    }
  }

  void prevPage() {
    final store = Provider.of<UserProfileStore>(context, listen: false);
    if (_currentStep > 0) {
      if (_currentStep == 7 && store.input.goal!.toLowerCase() == "maintain") {
        setState(() => _currentStep -= 2);
        _controller.animateToPage(_controller.page!.toInt() - 2, duration: Duration(milliseconds: 300), curve: Curves.ease);
        Provider.of<FormProgressViewModel>(context, listen: false).setStep(5);  
      }

      else {
        setState(() => _currentStep--);
        _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
        Provider.of<FormProgressViewModel>(context, listen: false).prevStep();
      }      
    }

    else if (_currentStep == 0) {
      // Move back to introduction
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = [
      StepPageWrapper(
        onNext: nextPage,
        onBack: prevPage,
        child: GenderPage(),
      ),
      StepPageWrapper(
        onNext: nextPage,
        onBack: prevPage,
        child: WorkoutFrequencyPage(),
      ),
      StepPageWrapper(
        onNext: nextPage,
        onBack: prevPage,
        child: GoalPage(),
      ),
      // workoutFrequencyPage(),
          // HeightAndWeightPage(),
      // Add other pages
    ];

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: PageView(
        controller: _controller,
        physics: NeverScrollableScrollPhysics(),
        children: pages
      ),
    );
  }
}

class StepPageWrapper extends StatelessWidget {
  final Widget child;
  final VoidCallback? onNext;
  final VoidCallback? onBack;

  const StepPageWrapper({
    super.key,
    required this.child,
    required this.onNext,
    required this.onBack,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: onBack,
              icon: Icon(Icons.arrow_back)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: Consumer<FormProgressViewModel>(
                  builder: (context, progressModel, _) => LinearProgressIndicator(
                    value: progressModel.progress, // customize progress
                    backgroundColor: Color(0xFFECE6F5),
                    valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 0, 0, 0)),
                    minHeight: 4,
                  ),
                ),
              ),
            ),
          ],
        ),

        const SizedBox(height: 16),

        Expanded(
          child: child
        ),

        SizedBox(
          width: double.infinity,
          child: ElevatedButton(
            onPressed: onNext,
            child: Text("Next")
          ),
        )
      ],
    );
  }
}