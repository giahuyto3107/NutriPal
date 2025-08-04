import 'package:confetti/confetti.dart';
import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/appreciate_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/ask_for_notification_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/date_of_birth_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/desired_weight.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/goal_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/height_and_weight_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/how_fast_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/recommendation_page.dart';
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
  int _currentStep = 0;
  late final Map<int, bool Function(UserProfileStore)> _stepValidators;
  late List<Widget> _pages;
  final PageController _pageController = PageController();
  late ConfettiController confettiController;

  @override
  void initState() {
    super.initState();

    // _stepValidators = {

    //  0: (store) => _currentStep == 0 && store.input.gender != null && store.input.gender!.isNotEmpty,

    //  1: (store) => _currentStep == 1 && store.input.workoutFrequency != null && store.input.workoutFrequency!.isNotEmpty,

    //  2: (store) => _currentStep == 2 && store.input.height != null && store.input.height!.isNotEmpty

    //         && store.input.weight != null && store.input.weight!.isNotEmpty,

    //  3: (store) => _currentStep == 3 && store.input.dob != null && store.input.dob!.isNotEmpty,

    //  4: (store) => _currentStep == 4 && store.input.goal != null && store.input.goal!.isNotEmpty,

    //  5: (store) => _currentStep == 5 && store.input.desiredWeight != null && store.input.desiredWeight!.isNotEmpty,

    //  6: (store) => _currentStep == 6 && store.input.reachingGoalSpeed != null && store.input.reachingGoalSpeed!.isNotEmpty,

    //  7: (store) => true,

    //  8: (store) => true,

    //  9: (store) => true,

    //  10: (store) => true, // Placeholder for the last step

    // };

    _stepValidators = {
      0:
          (store) =>
              _currentStep == 0 &&
              store.input.gender != null &&
              store.input.gender!.isNotEmpty,

      1:
          (store) =>
              _currentStep == 1 &&
              store.input.workoutFrequency != null &&
              store.input.workoutFrequency!.isNotEmpty,

      2: (store) => true,
    };

    confettiController = ConfettiController(
      duration: const Duration(seconds: 5),
    );
    _pageController.addListener(() {
      if (_pageController.page == 2) {
        // Assuming ConfettiPage is at index 1
        confettiController.play();
      }
    });

    _pages = [
      GenderPage(),
      WorkoutFrequencyPage(),
      //  HeightAndWeightPage(),

      //  DateOfBirthPage(),

      //  GoalPage(),

      //  DesiredWeight(),

      //  HowFastPage(),

      //  AskForNotificationPage(),
      AppreaciatePage(
        currentStep: _currentStep,
        confettiController: confettiController,
      ),
      //  RecommendationPage()
    ];
  }

  @override
  void dispose() {
    _pageController.dispose();
    confettiController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 18.0),
      child: StepPageWrapper(
        currentStep: _currentStep,
        pages: _pages,
        stepValidators: _stepValidators,
        pageController: _pageController,
        onStepChanged: (newStep) {
          setState(() {
            _currentStep = newStep;
          });
        },
        child: _pages[_currentStep],
      ),
    );
  }
}

class StepPageWrapper extends StatefulWidget {
  final Widget child;
  final int currentStep;
  final List<Widget> pages;
  final void Function(int)? onStepChanged;
  final Map<int, bool Function(UserProfileStore)> stepValidators;
  final PageController pageController;

  const StepPageWrapper({
    super.key,
    required this.child,
    required this.currentStep,
    required this.pages,
    required this.stepValidators,
    required this.onStepChanged,
    required this.pageController,
  });

  @override
  State<StepPageWrapper> createState() => _StepPageWrapperState();
}

class _StepPageWrapperState extends State<StepPageWrapper> {
  bool isNextButtonEnabled = true;
  final double itemWidth = 200.0;

  void scrollToNext() {
    // if (widget.currentStep == 1) {
    //   Navigator.push(
    //     context,
    //     MaterialPageRoute(builder: (_) => widget.pages[widget.currentStep+1])
    //   );
    // }

    widget.pageController.animateTo(
      widget.pageController.offset + itemWidth,

      duration: const Duration(milliseconds: 100),

      curve: Curves.easeInOut,
    );
  }

  void scrollToPrevious() {
    widget.pageController.animateTo(
      widget.pageController.offset - itemWidth,

      duration: const Duration(milliseconds: 100),

      curve: Curves.easeInOut,
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          children: [
            Row(
              children: [
                Consumer<UserProfileStore>(
                  builder: (context, store, _) {
                    return IconButton(
                      onPressed: () {
                        if (widget.currentStep == 6 &&
                            store.input.goal == "Maintain") {
                          widget.pageController.animateToPage(
                            4,
                            duration: Duration(milliseconds: 200),
                            curve: Curves.easeInOut,
                          );

                          widget.onStepChanged?.call(4);
                        } else {
                          final nextStep = widget.currentStep - 1;
                          widget.onStepChanged?.call(nextStep);
                          scrollToPrevious();
                        }
                      },

                      icon: Icon(Icons.arrow_back),
                    );
                  },
                ),

                Expanded(
                  child: Padding(
                    padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                    child: Consumer<FormProgressViewModel>(
                      builder:
                          (context, progressModel, _) =>
                              LinearProgressIndicator(
                                value:
                                    (widget.currentStep + 1) / widget.pages.length, // customize progress
                                backgroundColor: Color(0xFFECE6F5),
                                valueColor: AlwaysStoppedAnimation(
                                  Color.fromARGB(255, 0, 0, 0),
                                ),
                                minHeight: 4,
                              ),
                    ),
                  ),
                ),
              ],
            ),

            const SizedBox(height: 16),

            Expanded(
              child: PageView.builder(
                controller: widget.pageController,
                physics: const NeverScrollableScrollPhysics(),
                itemCount: widget.pages.length,
                itemBuilder: (context, index) {
                  return (widget.pages[index]);
                },
              ),
            ),

            SizedBox(
              width: double.infinity,
              child: Consumer<UserProfileStore>(
                builder: (context, store, _) {
                  final validator = widget.stepValidators[widget.currentStep];
                  final enabled = validator == null ? true : validator(store);

                  return ElevatedButton(
                    onPressed:
                        enabled
                            ? () {
                              if (widget.currentStep == 4 &&
                                  store.input.goal == "Maintain") {
                                widget.pageController.animateToPage(
                                  6,
                                  duration: Duration(milliseconds: 200),
                                  curve: Curves.easeInOut,
                                );
                                widget.onStepChanged?.call(6);
                              } else {
                                scrollToNext();
                                final nextStep = widget.currentStep + 1;
                                widget.onStepChanged?.call(nextStep);
                              }
                            }
                            : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.black,
                    ),
                    child: Padding(
                      padding: const EdgeInsets.symmetric(vertical: 13),
                      child: Text(
                        "Next",
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 18,
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
