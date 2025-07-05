import 'dart:ui';

import 'package:flutter/material.dart';
import 'package:flutter_svg/flutter_svg.dart';
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
    String? goal = store.input.goal;
    return Text(
      goal != null ? "$goal speed per week" : "",
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
    bool isTurtleHighlighted = false;
    bool isRabbitHighlighted = false;
    bool isPantherHighlighted = false;

    final store = Provider.of<UserProfileStore>(context, listen: false);
    bool? isImperial = store.input.isImperial;
    if (isImperial == null) {
      // Show nothing or a placeholder if not set yet
      return SizedBox.shrink();
    }

    String recommendation = "";

    if (isImperial) {
      if (weight >= 1.1 && weight <= 2.0) {
        recommendation = "Recommended";
        isRabbitHighlighted = true;
      }
      else if (weight < 1.1 ) {
        recommendation = "Slow and Steady";
        isTurtleHighlighted = true;
      }
      else {
        recommendation = "You may feel very tired and develop loose skin";
        isPantherHighlighted = true;
      }
    }
    else {
      if (weight >= 0.5 && weight <= 1.0) {
        recommendation = "Recommended";
        isTurtleHighlighted = true;
      }
      else if (weight < 0.5) {
        recommendation = "Slow and Steady";
        isRabbitHighlighted = true;
      }
      else {
        recommendation = "You may feel very tired and develop loose skin";
        isPantherHighlighted = true;
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
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: [
            SvgPicture.asset(
              'assets/images/turtle.svg',
              width: 50,
              height: 50,
              color: isTurtleHighlighted ? Color(0xffde9b67) : null
            ),
            SvgPicture.asset(
              'assets/images/rabbit.svg',
              width: 50,
              height: 50,
              color: isRabbitHighlighted ? Color(0xffde9b67) : null
            ),
            SvgPicture.asset(
              'assets/images/panther.svg',
              width: 50,
              height: 50,
              color: isPantherHighlighted ? Color(0xffde9b67) : null
            ),
          ],
        ),
        SliderTheme(
          data: SliderTheme.of(context).copyWith(
            tickMarkShape: SliderTickMarkShape.noTickMark
          ),
          child: Slider(
            min: isImperial ? 0.2 : 0.1,
            max: isImperial ? 3.0 : 1.5,
            value: weight,
            thumbColor: Colors.black,
            inactiveColor: Color(0xfff9f8fe),
            activeColor: Colors.black,
            divisions: isImperial ? 28 : 14,
            onChanged: (newWeight) {
              setState(() {
                weight = newWeight;
                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setReachingGoalSpeed(weight.toString());
              });
            },
          ),
        ),
        SizedBox(height: 3),
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            ...(isImperial 
              ?
              [Text("0.2 lbs"),
              Text("1.5 lbs"),
              Text("3.0 lbs")]
              :
              [Text("0.1 kg"),
              Text("0.8 kg"),
              Text("1.5 kg")]
            ),            
          ],
        ),
        SizedBox(height: 25),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 15),
          child: Card(
            color: Color(0xffe9eaef),
            child: SizedBox(
              width: double.infinity,
              child: Padding(
                padding: const EdgeInsets.symmetric(vertical: 17, horizontal: 15),
                child: Text(
                  recommendation,
                  textAlign: TextAlign.center,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 14,
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