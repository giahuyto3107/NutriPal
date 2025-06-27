import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class HowFastPage extends StatelessWidget {
  const HowFastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return ContentSection(
      heading: "How fast do you want to reach you goal?",
      description: "Loose Weight speed per week",
      options: ["Gain Weight", "Maintain", "Lose Weight"],
    );
  }
}

class ContentSection extends StatefulWidget {
  final String heading;
  final String description;
  final List<String> options;

  const ContentSection({
    super.key,
    required this.heading,
    required this.description,
    required this.options,
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

        SizedBox(height: 150),

        Center(
          child: Column(
            children: [
              Text(
                widget.description,
                textAlign: TextAlign.center,
                style: TextStyle(
                  fontSize: 17,
                  color: Color(0xFF18171C),
                ),
              ),
              
              SizedBox(height: 12),

              Text(
                "0.4 lbs",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 24
                ),
              ),

              SizedBox(height: 12),
            ],
          ),
        ),

        ...List.generate(widget.options.length, (i) {
          final bool isSelected = selected == i;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: ChoiceChip(
              label: SizedBox(
                width: double.infinity,
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Icon(Icons.circle),

                    SizedBox(width: 20),

                    Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.options[i],
                          textAlign: TextAlign.start,
                          style: TextStyle(
                            color: isSelected ? selectedTextColor : unselectedTextColor,
                            fontSize: 16,
                            fontWeight: FontWeight.w500,
                          ),
                        ),
                    
                      ],
                    ),
                  ],
                ),
              ), 
              selected: isSelected,
              selectedColor: selectedColor,
              backgroundColor: unselectedColor,
            
              onSelected: (bool selectedChoice) {
                setState(() {
                  selected = i;
                });

                final store = Provider.of<UserProfileStore>(context, listen: false);
                // Example for gender page, use setGender
                if (widget.heading.toLowerCase().contains("gender")) {
                  store.setGender(widget.options[i]);
                }

                if (widget.heading.toLowerCase().contains("goal")) {
                  store.setGoal(widget.options[i]);
                }
              },
            
              showCheckmark: false,
            ),
          );
        }
          )
      ],
    );
  }
}