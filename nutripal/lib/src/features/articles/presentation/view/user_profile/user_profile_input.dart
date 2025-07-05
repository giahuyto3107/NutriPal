import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/appreciate_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/ask_for_notification_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/date_of_birth_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/desired_weight.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/goal_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/height_and_weight_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/how_fast_page.dart';
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
  int _currentStep = 1;
  late final Map<int, bool Function(UserProfileStore)> _stepValidators;
  late List<Widget> _pages;

  @override
  void initState() {
    super.initState();
    _stepValidators = {
      1: (store) => _currentStep == 1 && store.input.gender != null && store.input.gender!.isNotEmpty,
      2: (store) => _currentStep == 2 && store.input.workoutFrequency != null && store.input.workoutFrequency!.isNotEmpty,
      3: (store) => _currentStep == 3 && store.input.height != null && store.input.height!.isNotEmpty
                    && store.input.weight != null && store.input.weight!.isNotEmpty,
      4: (store) => _currentStep == 4 && store.input.dob != null && store.input.dob!.isNotEmpty,
      5: (store) => _currentStep == 5 && store.input.goal != null && store.input.goal!.isNotEmpty,
      6: (store) => _currentStep == 6 && store.input.desiredWeight != null && store.input.desiredWeight!.isNotEmpty,
      7: (store) => _currentStep == 7 && store.input.reachingGoalSpeed != null && store.input.reachingGoalSpeed!.isNotEmpty,
      8: (store) => true,
      9: (store) => true,
    };

    _pages = [
      StepPageWrapper(
        key: const ValueKey('step-1'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 1,
        stepValidators: _stepValidators,
        child: GenderPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-2'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 2,
        stepValidators: _stepValidators,
        child: WorkoutFrequencyPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-3'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 3,
        stepValidators: _stepValidators,
        child: HeightAndWeightPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-4'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 4,
        stepValidators: _stepValidators,
        child: DateOfBirthPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-5'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 5,
        stepValidators: _stepValidators,
        child: GoalPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-6'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 6,
        stepValidators: _stepValidators,
        child: DesiredWeight(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-7'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 7,
        stepValidators: _stepValidators,
        child: HowFastPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-8'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 8,
        stepValidators: _stepValidators,
        child: AskForNotificationPage(),
      ),
      StepPageWrapper(
        key: const ValueKey('step-9'),
        onNext: nextPage,
        onBack: prevPage,
        currentStep: 9,
        stepValidators: _stepValidators,
        child: AppreaciatePage(key: PageStorageKey('appreaciate')),
      ),
    ];
  }

  void nextPage() {
    final store = Provider.of<UserProfileStore>(context, listen: false);

    if (_currentStep < 9) {
      if (_currentStep == 5 && store.input.goal!.toLowerCase() == "maintain") {
        setState(() => _currentStep += 2);
        Provider.of<FormProgressViewModel>(context, listen: false).setStep(7);  
      }

      // Main flow
      else {
        setState(() => _currentStep++);
        Provider.of<FormProgressViewModel>(context, listen: false).nextStep();
      }
      
    }

    else if (_currentStep == 9) {
      // Move to HomePage
    }
  }

  void prevPage() {
    final store = Provider.of<UserProfileStore>(context, listen: false);
    if (_currentStep > 1) {
      if (_currentStep == 7 && store.input.goal!.toLowerCase() == "maintain") {
        setState(() => _currentStep -= 2);
        Provider.of<FormProgressViewModel>(context, listen: false).setStep(5);  
      }

      else {
        setState(() => _currentStep--);
        Provider.of<FormProgressViewModel>(context, listen: false).prevStep();
      }      
    }

    else if (_currentStep == 1) {
      // Move back to introduction
    }
  }

  

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: Stack(
        children: List.generate(_pages.length, (index) {
          final isCurrent = _currentStep - 1 == index;
          return IgnorePointer(
            ignoring: !isCurrent,
            child: Opacity(
              opacity: isCurrent ? 1.0 : 0.0,
              child: isCurrent
                  ? TweenAnimationBuilder<Offset>(
                      tween: Tween<Offset>(
                        begin: const Offset(1, 0),
                        end: Offset.zero,
                      ),
                      duration: const Duration(milliseconds: 350),
                      curve: Curves.easeOut,
                      builder: (context, offset, child) {
                        return Transform.translate(
                          offset: Offset(offset.dx * MediaQuery.of(context).size.width, 0),
                          child: child,
                        );
                      },
                      child: SizedBox.expand(
                        child: _pages[index],
                      ),
                    )
                  : SizedBox.expand(
                      child: _pages[index],
                    ),
            ),
          );
        }),
      ),
    );
  }
}

class StepPageWrapper extends StatefulWidget {
  final Widget child;
  final VoidCallback? onNext;
  final VoidCallback? onBack;
  final int? currentStep;
  final Map<int, bool Function(UserProfileStore)> stepValidators;

  const StepPageWrapper({
    super.key,
    required this.child,
    required this.onNext,
    required this.onBack,
    required this.currentStep,
    required this.stepValidators,
  });

  @override
  State<StepPageWrapper> createState() => _StepPageWrapperState();
}

class _StepPageWrapperState extends State<StepPageWrapper> {
  bool isNextButtonEnabled = true;

  void onEventOccur() {
    setState(() {
      isNextButtonEnabled = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            IconButton(
              onPressed: widget.onBack,
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
          child: widget.child
        ),

        SizedBox(
          width: double.infinity,
          child: Consumer<UserProfileStore>(
            builder: (context, store, _) {
              final validator = widget.stepValidators[widget.currentStep];
              final enabled = validator == null ? true : validator(store);
              return ElevatedButton(
                onPressed: enabled ? widget.onNext : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.black
                ),
                child: Padding(
                  padding: const EdgeInsets.symmetric(vertical: 13),
                  child: Text(
                    "Next",
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 18,
                      fontWeight: FontWeight.w600
                    )
                  ),
                )
              );
            },
          ),
        )
      ],
    );
  }
}