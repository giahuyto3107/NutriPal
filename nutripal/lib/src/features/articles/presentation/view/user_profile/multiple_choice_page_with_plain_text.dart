import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class MultipleChoicePageWithPlainText extends StatefulWidget {
  final String heading;
  final String description;
  final List<String> options;

  const MultipleChoicePageWithPlainText({
    super.key,
    required this.heading,
    required this.description,
    required this.options,
  });

  @override
  State<MultipleChoicePageWithPlainText> createState() => _MultipleChoicePageWithPlainTextState();
}

class _MultipleChoicePageWithPlainTextState extends State<MultipleChoicePageWithPlainText> {
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
          widget.description,
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF18171C),
          ),
        ),

        SizedBox(height: 150),

        ...List.generate(widget.options.length, (i) {
          final bool isSelected = selected == i;

          return Padding(
            padding: const EdgeInsets.symmetric(vertical: 8.0),
            child: SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: () {
                  setState(() {
                    selected = i;
                  });

                  final store = Provider.of<UserProfileStore>(context, listen: false);
                  if (widget.heading.toLowerCase().contains("gender")) {
                    store.setGender(widget.options[i]);
                  }

                  if (widget.heading.toLowerCase().contains("goal")) {
                    store.setGoal(widget.options[i]);
                  }
                },
                style: ElevatedButton.styleFrom(
                  backgroundColor: isSelected ? selectedColor : unselectedColor,
                  // backgroundColor: Colors.red,
                  foregroundColor: isSelected ? selectedTextColor : unselectedTextColor,
                  padding: const EdgeInsets.symmetric(vertical: 16), // Optional spacing
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
                  child: Text(
                    widget.options[i],
                    textAlign: TextAlign.center,
                    style: TextStyle(
                      fontSize: 16,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ),
            ),
          );
        })
      ],
    );
  }
}