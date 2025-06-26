import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';


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
    if (_currentStep < 8) {
      setState(() => _currentStep++);
      _controller.nextPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
    }

    else if (_currentStep == 8) {
      // Move to HomePage
    }
  }

  void prevPage() {
    if (_currentStep > 0) {
      setState(() => _currentStep--);
      _controller.previousPage(duration: Duration(milliseconds: 300), curve: Curves.ease);
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
              onPressed: () => Navigator.of(context).maybePop(),
              icon: Icon(Icons.arrow_back)
            ),
            Expanded(
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                child: LinearProgressIndicator(
                  value: 0.2, // customize progress
                  backgroundColor: Color(0xFFECE6F5),
                  valueColor: AlwaysStoppedAnimation(Color.fromARGB(255, 0, 0, 0)),
                  minHeight: 4,
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