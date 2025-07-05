import 'dart:io';

import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/user_profile_store.dart';
import 'package:provider/provider.dart';

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

        SizedBox(height: 120),

        Center(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              _SectionTitle(),
              SizedBox(height: 12),
              _WeightPicker(),
            ],
          ),
        ),
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
      goal ?? '',
      style: TextStyle(
        fontWeight: FontWeight.w400,
        fontSize: 17
      ),
    );
  }
}

class _WeightPicker extends StatefulWidget {
  const _WeightPicker({super.key});

  @override
  State<_WeightPicker> createState() => _WeightPickerState();
}

class _WeightPickerState extends State<_WeightPicker> {

  int selectedWeight = 120;
  final int minWeight = 80;
  final int maxWeight = 200;

  final ScrollController _controller = ScrollController();

  @override
  void initState() {
    super.initState();
    // Optionally scroll to initial selected
    WidgetsBinding.instance.addPostFrameCallback((_) {
      _controller.jumpTo((selectedWeight - minWeight) * 60.0); // 60 is item extent
    });
  }

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 100,
      child: ListView.builder(
        controller: _controller,
        scrollDirection: Axis.horizontal,
        itemCount: maxWeight - minWeight + 1,
        itemBuilder: (context, index) {
          int weight = minWeight + index;
          bool isSelected = weight == selectedWeight;
          return GestureDetector(
            onTap: () {
              setState(() {
                selectedWeight = weight;
                final store = Provider.of<UserProfileStore>(context, listen: false);
                store.setDesiredWeight(selectedWeight.toString());
              });
            },
            child: Container(
              width: 60,
              alignment: Alignment.center,
              margin: EdgeInsets.symmetric(horizontal: 8),
              decoration: BoxDecoration(
                color: isSelected ? Colors.grey[400] : Colors.transparent,
                borderRadius: BorderRadius.circular(12),
              ),
              child: Text(
                "$weight lbs",
                style: TextStyle(
                  fontSize: 22,
                  color: isSelected ? Colors.black : Colors.grey,
                  fontWeight: isSelected ? FontWeight.bold : FontWeight.normal,
                ),
              ),
            ),
          );
        },
      ),
    );
  }
}