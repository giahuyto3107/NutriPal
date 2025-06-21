import 'package:flutter/material.dart';

class UserInputPage extends StatelessWidget {
  const UserInputPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          MultipleChoiceSection(title: "Gender", options: ["Male", "Female"]),
          MultipleChoiceSection(title: "Frequency of workouts per week", options: ["0-2", "3-5", "6+"]), 
          TextFieldSection(title: "Height:", hintText: "Height input"), 
          TextFieldSection(title: "Weight:", hintText: "Weight input"),
          TextFieldSection(title: "DOB:", hintText: "Date of birth"),
          MultipleChoiceSection(title: "Goal", options: ["Gain Weight", "Maintain", "Lose Weight"]),
          TextFieldSection(title: "Desired Weight:", hintText: "Weight"),
        ],
      ),
    );
  }
}

class MultipleChoiceSection extends StatefulWidget {
  final String title;
  final List<String> options;

  const MultipleChoiceSection({
    super.key,
    required this.title,
    required this.options
  });

  @override
  State<MultipleChoiceSection> createState() => _MultiplechoiceSectionState();
}

class _MultiplechoiceSectionState extends State<MultipleChoiceSection> {
  int selectedOption = -1;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: List.generate(widget.options.length, (index) {
              return ChoiceChip(
                label: Text(widget.options[index]),
                selected: selectedOption == index,
                onSelected: (selected) {
                  setState(() {
                    selectedOption = index;
                  });
                }
              );
            }),
          ),
        ]),
    );
  }
}

 class TextFieldSection extends StatefulWidget {
  final String title;
  final String hintText;

  const TextFieldSection({
    super.key,
    required this.title,
    required this.hintText
  });

  @override
  State<TextFieldSection> createState() => _TextFieldSectionState();
 }

 class _TextFieldSectionState extends State<TextFieldSection> {
  final myController = TextEditingController();

  @override
  void dispose() {
    myController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text(
            widget.title,
            style: TextStyle(
              fontWeight: FontWeight.bold
            ),
          ),

          SizedBox(width: 20),

          Expanded(
            child: TextField(
              controller: myController,
              decoration: InputDecoration(
                hintText: widget.hintText
              ),
            ),
          )
        ],
      ),
    );
  }
 }