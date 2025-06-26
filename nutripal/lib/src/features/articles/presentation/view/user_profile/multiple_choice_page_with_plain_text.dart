import 'package:flutter/material.dart';

class MultipleChoicePageWithPlainText extends StatefulWidget {
  final String heading;
  final String description;
  final List<String> options;

  const MultipleChoicePageWithPlainText({
    super.key,
    required this.heading,
    required this.description,
    required this.options
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
            child: ChoiceChip(
              label: SizedBox(
                width: double.infinity,
                child: Text(
                  widget.options[i],
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    color: isSelected ? selectedTextColor : unselectedTextColor,
                    fontSize: 16,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ), 
              selected: isSelected,
              selectedColor: selectedColor,
              backgroundColor: unselectedColor,
            
              onSelected: (bool selectedChoice) {
                setState(() {
                  selected = i;
                });
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