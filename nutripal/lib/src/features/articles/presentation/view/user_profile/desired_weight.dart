import 'package:flutter/material.dart';

class DesiredWeight extends StatelessWidget {
  const DesiredWeight({super.key});

  @override
  Widget build(BuildContext context) {
return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Choose your desired weight?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34
          ),
        ),

        SizedBox(height: 3),

        SizedBox(height: 12),

        
      ],
    );
  }
}