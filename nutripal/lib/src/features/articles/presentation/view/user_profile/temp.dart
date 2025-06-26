import 'package:flutter/material.dart';

class MultipleChoicePageWithPlainTextText extends StatefulWidget {
  final String heading;
  final String description;
  final List<String> options;

  const MultipleChoicePageWithPlainTextText({
    super.key,
    required this.heading,
    required this.description,
    required this.options,
  });

  @override
  State<MultipleChoicePageWithPlainTextText> createState() => _MultipleChoicePageWithPlainTextTextState();
}

class _MultipleChoicePageWithPlainTextTextState extends State<MultipleChoicePageWithPlainTextText> {
  int? selectedIndex;

  @override
  Widget build(BuildContext context) {
    // Simple theme colors, adjust to match your app
    const selectedColor = Color(0xFF18171C);
    const unselectedColor = Color(0xFFF9F8FF);
    const selectedTextColor = Colors.white;
    const unselectedTextColor = Color(0xFF18171C);

    return Scaffold(
      backgroundColor: Colors.white,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 18.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Top bar with back button and progress
              Row(
                children: [
                  IconButton(
                    icon: Icon(Icons.arrow_back, size: 32),
                    onPressed: () => Navigator.of(context).maybePop(),
                  ),
                  Expanded(
                    child: Padding(
                      padding: const EdgeInsets.only(left: 8.0, right: 16.0),
                      child: LinearProgressIndicator(
                        value: 0.2, // customize progress
                        backgroundColor: Color(0xFFECE6F5),
                        valueColor: AlwaysStoppedAnimation(Color(0xFFB5A8C5)),
                        minHeight: 4,
                      ),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 32),
              // Heading
              Text(
                widget.heading,
                style: const TextStyle(
                  fontSize: 34,
                  fontWeight: FontWeight.bold,
                  color: Color(0xFF18171C),
                  height: 1.15,
                ),
              ),
              const SizedBox(height: 8),
              // Description
              Text(
                widget.description,
                style: const TextStyle(
                  fontSize: 17,
                  color: Color(0xFF18171C),
                  height: 1.4,
                ),
              ),
              const SizedBox(height: 60),
              // Options
              ...List.generate(widget.options.length, (i) {
                final isSelected = selectedIndex == i;
                return Padding(
                  padding: const EdgeInsets.symmetric(vertical: 10.0),
                  child: Material(
                    color: isSelected ? selectedColor : unselectedColor,
                    borderRadius: BorderRadius.circular(16),
                    child: InkWell(
                      borderRadius: BorderRadius.circular(16),
                      onTap: () {
                        setState(() => selectedIndex = i);
                      },
                      child: Container(
                        width: double.infinity,
                        padding: const EdgeInsets.symmetric(vertical: 28),
                        alignment: Alignment.center,
                        child: Text(
                          widget.options[i],
                          style: TextStyle(
                            fontSize: 21,
                            fontWeight: FontWeight.w500,
                            color: isSelected ? selectedTextColor : unselectedTextColor,
                          ),
                        ),
                      ),
                    ),
                  ),
                );
              }),
              const Spacer(),
              // Next button
              Padding(
                padding: const EdgeInsets.only(bottom: 24.0),
                child: SizedBox(
                  width: double.infinity,
                  height: 64,
                  child: ElevatedButton(
                    onPressed: selectedIndex != null ? () {
                      // Handle next button tap
                    } : null,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: selectedColor,
                      disabledBackgroundColor: selectedColor.withOpacity(0.4),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(24),
                      ),
                      elevation: 0,
                    ),
                    child: const Text(
                      "Next",
                      style: TextStyle(
                        fontSize: 21,
                        fontWeight: FontWeight.w500,
                        color: Colors.white,
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}