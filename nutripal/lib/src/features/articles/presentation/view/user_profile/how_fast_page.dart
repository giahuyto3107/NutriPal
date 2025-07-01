import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class HowFastPage extends StatelessWidget {
  const HowFastPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "How fast do you want to reach your goal?",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34
          ),
        ),

        SizedBox(height: 120),

        Center(
          child: Column(
            children: [
              _SectionTitle(),
              SizedBox(height: 12),
              _SpeedSlider()
            ],
          ),
        )
        
        
      ],
    );
  }
}

class _SectionTitle extends StatelessWidget {
  const _SectionTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserProfileStore>(context, listen: false);
    String goal = store.input.goal!;
    return Text(
      "$goal speed per week",
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17
      ),
    );
  }
}

class _SpeedSlider extends StatefulWidget {
  const _SpeedSlider({super.key});
  
  @override
  State<_SpeedSlider> createState() => _SpeedSliderState();
}

class _SpeedSliderState extends State<_SpeedSlider> {
  double weight = 0.2;

  @override
  Widget build(BuildContext context) {
    final store = Provider.of<UserProfileStore>(context, listen: false);
    bool isImperial = store.input.isImperial!;
    String recommendation;
    if (isImperial) {
      if (weight >= 11 && weight <= 20) {
        recommendation = "Recommended";
      }
      else if (weight < 11 ) {
        recommendation = "Slow and Steady";
      }
      else {
        recommendation = "You may feel very tired and develop loose skin";
      }
    }
    else {
      if (weight >= 0.5 && weight <= 1.0) {
        recommendation = "Recommended";
      }
      else if (weight < 0.5) {
        recommendation = "Slow and Steady";
      }
      else {
        recommendation = "You may feel very tired and develop loose skin";
      }
    }
    return Column(
      children: [
        Text(
          "${((weight*10).round() / 10).toString()} ${isImperial ? "lbs" : "kg"}",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 25
          ),
        ),
        Slider(
          min: isImperial ? 0.2 : 0.1,
          max: isImperial ? 3.0 : 1.5,
          value: weight,
          divisions: isImperial ? 28 : 14,
          onChanged: (newWeight) {
            setState(() {
              weight = newWeight;
            });
          },
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            color: Color(0xffe9eaef),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 15),
                child: Text(
                  recommendation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 18,
                  ),
                ),
              ),
            )
          ),
        )
        
      ]
    );
  }
}