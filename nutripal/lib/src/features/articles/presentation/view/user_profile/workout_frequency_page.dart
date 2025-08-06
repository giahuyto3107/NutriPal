import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/domain/user_profile.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class WorkoutFrequencyPage extends StatelessWidget {
  const WorkoutFrequencyPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      heading: "How many workouts do you do per week",
      headingDescription: "This will be used to calibrate your custom plan",
      options: ["0 - 2", "3 - 5", "6+"],
      optionDescriptions: ["Workouts now and then", "A few workouts per week", "Dedicated athelete"],
    );
  }
}

class ContentSection extends StatefulWidget {
  final String heading;
  final String headingDescription;
  final List<String> options;
  final List<String> optionDescriptions;

  const ContentSection({
    super.key,
    required this.heading,
    required this.headingDescription,
    required this.options,
    required this.optionDescriptions
  });

  @override
  State<ContentSection> createState() => ContentSectionState();
}

class ContentSectionState extends State<ContentSection> {
  int? selected = -1;

  @override
  Widget build(BuildContext context) {
    const selectedColor = Color(0xFF18171C);
    const unselectedColor = Color(0xFFf9f8fe);
    const selectedTextColor = Colors.white;
    const unselectedTextColor = Color(0xFF18171C);

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          widget.heading,
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34
          ),
        ),

        SizedBox(height: 3),

        Text(
          widget.headingDescription,
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF18171C),
          ),
        ),

        SizedBox(height: 120),

        ...List.generate(widget.options.length, (i) {
          final bool isSelected = selected == i;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ElevatedButton(
              onPressed: () {
                setState(() {
                  selected = i;
                });

                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setWorkoutFrequency(widget.options[i]);
              },
              
              style: ElevatedButton.styleFrom(
                backgroundColor: isSelected ? selectedColor : unselectedColor,
                foregroundColor: isSelected ? selectedTextColor : unselectedTextColor,
                padding: const EdgeInsets.symmetric(vertical: 12, horizontal: 16),
                shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                    side: BorderSide(
                      width: 1,
                      color: Color.fromARGB(255, 193, 193, 193)         
                    )
                  ),
                  elevation: 0, // Optional: remove shadow if you want it flat
              ),
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 4.0),
                child: Row(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const Icon(Icons.circle), // Or use different icons if needed
                    const SizedBox(width: 20),
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            widget.options[i],
                            style: TextStyle(
                              color: isSelected ? selectedTextColor : unselectedTextColor,
                              fontSize: 16,
                              fontWeight: FontWeight.w500,
                            ),
                          ),
                          const SizedBox(height: 4),
                          Text(
                            widget.optionDescriptions[i],
                            style: TextStyle(
                              color: isSelected ? selectedTextColor : unselectedTextColor,
                              fontSize: 12,
                              fontWeight: FontWeight.w300,
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          );
        }
          )
      ],
    );
  }
}