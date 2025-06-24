import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import '../../domain/user_profile_input.dart';
import '../viewmodel/user_profile_store.dart';

class UserInputPage extends StatefulWidget {
  final VoidCallback onConfirmed;

  const UserInputPage({required this.onConfirmed, super.key});

  @override
  State<UserInputPage> createState() => _UserInputPageState();
}

class _UserInputPageState extends State<UserInputPage> {
  int genderIndex = -1;
  int workoutIndex = -1;
  int goalIndex = -1;

  final heightController = TextEditingController();
  final weightController = TextEditingController();
  final dobController = TextEditingController();
  final desiredWeightController = TextEditingController();
  
  final genderOptions = ["Male", "Female"];
  final workoutOptions = ["0-2", "3-5", "6+"];
  final goalOptions = ["Lose Weight", "Maintain", "Gain Weight"];

  @override
  void dispose() {
    heightController.dispose();
    weightController.dispose();
    dobController.dispose();
    desiredWeightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          children: [
            _MultipleChoiceSection(
              title: "Gender",
              options: genderOptions,
              selected: genderIndex,
              onChanged: (i) => setState(() => genderIndex = i),
            ),
            _MultipleChoiceSection(
              title: "Frequency of workouts per week",
              options: workoutOptions,
              selected: workoutIndex,
              onChanged: (i) => setState(() => workoutIndex = i),
            ),
            _TextFieldSection(
                title: "Height:", controller: heightController, hintText: "Height input"),
            _TextFieldSection(
                title: "Weight:", controller: weightController, hintText: "Weight input"),
            _TextFieldSection(
                title: "DOB:", controller: dobController, hintText: "Date of birth"),
            _MultipleChoiceSection(
              title: "Goal",
              options: goalOptions,
              selected: goalIndex,
              onChanged: (i) => setState(() => goalIndex = i),
            ),
            if (goalIndex != 1 && goalIndex != -1)
              _TextFieldSection(
                  title: "Desired Weight:", controller: desiredWeightController, hintText: "Weight"
              ),
            ElevatedButton(
              onPressed: () {
                if (
                  (genderIndex == -1 ||
                  workoutIndex == -1 ||
                  heightController.text.isEmpty ||
                  weightController.text.isEmpty ||
                  dobController.text.isEmpty) ||
                  (goalIndex == -1 || ( (goalIndex == 0 || goalIndex == 2) && desiredWeightController.text.isEmpty))
                ) {
                    ScaffoldMessenger.of(context).showSnackBar(
                        SnackBar(content: Text("Please fill all fields")));
                    return;
                }

                final input = UserProfileInput(
                  gender: genderOptions[genderIndex],
                  workoutFrequency: workoutOptions[workoutIndex],
                  height: heightController.text,
                  weight: weightController.text,
                  dob: dobController.text,
                  goal: goalOptions[goalIndex],
                  desiredWeight: desiredWeightController.text,
                );

                Provider.of<UserProfileStore>(context, listen: false)
                  .saveUserProfile(input);
                widget.onConfirmed();
              },
              child: Text(
                "Confirm",
                style: TextStyle(
                  fontWeight: FontWeight.bold
                ),
              )
            )
          ],
        ),
      ),
    );
  }
}

class _MultipleChoiceSection extends StatelessWidget {
  final String title;
  final List<String> options;
  final int selected;
  final ValueChanged<int> onChanged;

  const _MultipleChoiceSection({
    required this.title,
    required this.options,
    required this.selected,
    required this.onChanged
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(options.length, (index) {
              return ChoiceChip(
                label: Text(options[index]),
                selected: selected == index,
                onSelected: (selected) {
                  onChanged(index);
                },
              );
            })
          ),
        ]
      ),
    );
  }
}

class _TextFieldSection extends StatelessWidget {
  final String title;
  final String hintText;
  final TextEditingController controller;

  const _TextFieldSection({
    required this.title,
    required this.hintText, 
    required this.controller
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: TextField(
              controller: controller,
              decoration: InputDecoration(
                hintText: hintText
              ),
            ),
          )
        ],
      ),
    );
  }
}