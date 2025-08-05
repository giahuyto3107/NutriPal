import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Column(
            children: [
              topSection(),
              dailyRecommendation(),
              reachingGoalGuide()
            ],
          ),
        ),
      )
    );
  }
}

Widget topSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Icon(Icons.)
      Text("Congratulations your custom plan is ready!"),
      Text("You should (modify here):"),
      Card(
        child: Text("11.0 lbs by 14 February (for example)"),
      )
    ],
  );
}

Widget dailyRecommendation() {
  return Card(
    child: Column(
      children: [
        Text("Daily recommendation"),
        Text("You can edit this any time"),
        Row(
          children: [
            macroCard("Calories", 0xff000000, 2125),
            macroCard("Carbs", 0xffd19a75, 274),
          ],
        ),
        Row(
          children: [
            macroCard("Protein", 0xffdb6968, 123),
            macroCard("Fats", 0xff6699db, 59),
          ],
        ),

      ],
    ) 
  );
}

Widget macroCard(
  String title,
  int colour,
  int calorie
) {
  return Card(
    child: Column(
      children: [
        Row(
          children: [
            Icon(Icons.fire_extinguisher),
            Text(title)
          ],
        ),
        Row(
          children: [
            CircularProgressIndicator(
              value: 0.5,
            ),
            Icon(Icons.edit)
          ],
        )
      ],
    ),
  );
}

Widget healthScoreCard() {
  return Card(
    child: Row(
      children: [
        Icon(Icons.heart_broken),
        Column(
          children: [
            Row(
              children: [
                Text("Health score"),
                Text("7/10")
              ],
            ),
            LinearProgressIndicator(
              value: 7/10,
            )
          ],
        )
      ],
    ),
  );
}

Widget reachingGoalGuide() {
  return Card(
    child: Column(
      children: [
        Text("How to reach your goals"),
        adviceCard("Get your weekly life score and improve your routine", ""),
        adviceCard("Track your food", ""),
        adviceCard("Follow your daily calorie recommendation", ""),
        adviceCard("Balance your carbs, protein, fat", ""),
      ],
    ),
  );
}

Widget adviceCard(
  String content,
  String illustrativeImagePath
) {
  return Card(
    child: Row(
      children: [
        // Image.asset(illustrativeImagePath),
        Text(content)
      ],
    ),
  );
}


