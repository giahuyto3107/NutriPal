import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/multiple_choice_page_with_plain_text.dart';
import 'package:numberpicker/numberpicker.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

class HeightAndWeightPage extends StatelessWidget {
  const HeightAndWeightPage({super.key});

  @override
  Widget build(BuildContext context) {
    return HeightWeightPicker();
  }
}

class HeightWeightPicker extends StatefulWidget {
  const HeightWeightPicker({super.key});

  @override
  _HeightWeightPickerState createState() => _HeightWeightPickerState();
}

class _HeightWeightPickerState extends State<HeightWeightPicker> {
  bool isImperial = true;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          "Height & Weight",
          style: TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 34
          ),
        ),

        SizedBox(height: 3),

        Text(
          "This will be used to calibrate your custom plan",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontSize: 17,
            color: Color(0xFF18171C),
          ),
        ),

        SizedBox(height: 12),

        Center(
          child: Column(
            children: [
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Text(
                    "Imperial",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                  Switch(
                    onChanged: (val) => setState(() {
                      isImperial = !val;
                    }),
                    value: !isImperial,
                  ),
                  Text(
                    "Metric",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 24
                    ),
                  ),
                ],
              ),
              
              SizedBox(height: 16),

              if (isImperial)
                _ImperialContent()
              else 
                _MetricContent()
            ],
          ),
        ),

        
      ],
    );
  }
}

class _ImperialContent extends StatefulWidget {
  const _ImperialContent({super.key});

  @override
  State<_ImperialContent> createState() => _ImperialContentState();
}

class _ImperialContentState extends State<_ImperialContent> {
  int heightFt = 5, heightIn = 5, weightLb = 119;
  int get height => (heightFt * 30.48).round() + (heightIn * 2.54).round();

  @override
  void initState() {
    super.initState();
    final store = Provider.of<UserProfileStore>(context, listen: false);
    store.setHeight(height.toString());
    store.setWeight((weightLb * 0.45359237).toString());
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                NumberPicker(
                  minValue: 1,
                  maxValue: 8,
                  value: heightFt,
                  onChanged: (val) => setState(() {
                    heightFt = val;
                    final store = Provider.of<UserProfileStore>(context, listen: false);
                    store.setHeight(height.toString());
                  }),
                ),
                NumberPicker(
                  minValue: 0,
                  maxValue: 11,
                  value: heightIn,
                  onChanged: (val) => setState(() {
                    heightIn = val;
                    final store = Provider.of<UserProfileStore>(context, listen: false);
                    store.setHeight(height.toString());
                  }),
                ),
              ],
            )
          ],
        ),

        Column(
          children: [
            Text(
              "Weight",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            NumberPicker(
              minValue: 40,
              maxValue: 800,
              value: weightLb,
              onChanged: (val) => setState(() {
                weightLb = val;
                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setWeight((weightLb*0.45359237).toString());
              }),
            )
          ],
        ),
      ],
    );
  }
}

class _MetricContent extends StatefulWidget {
  @override
  State<_MetricContent> createState() => _MetricContentState();
}

class _MetricContentState extends State<_MetricContent> {
  int heightCm = 165, weightKg = 54;
  
  @override
  void initState() {
    super.initState();
    final store = Provider.of<UserProfileStore>(context, listen: false);
    store.setHeight(heightCm.toString());
    store.setWeight(weightKg.toString());
  }
  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Column(
          children: [
            Text(
              "Height",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            NumberPicker(
              minValue: 60,
              maxValue: 243,
              value: heightCm,
              onChanged: (val) => setState(() {
                heightCm = val;
                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setHeight(heightCm.toString());
              }),
            ),
          ],
        ),

        Column(
          children: [
            Text(
              "Weight",
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 24
              ),
            ),
            NumberPicker(
              minValue: 20,
              maxValue: 360,
              value: weightKg,
              onChanged: (val) => setState(() {
                weightKg = val;
                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setWeight(weightKg.toString());
              }),
            )
          ],
        ),
      ],
    );
  }
}