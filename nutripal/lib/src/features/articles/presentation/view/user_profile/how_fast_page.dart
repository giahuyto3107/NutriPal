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
      "${goal} speed per week",
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
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Slider(
          min: 0.1,
          max: 1.5,
          value: 0.1,
          onChanged: (value) => null,
        )
      ]
    );
  }
}