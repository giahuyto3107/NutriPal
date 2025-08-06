import 'package:flutter/material.dart';

class RecommendationPage extends StatelessWidget {
  const RecommendationPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: SingleChildScrollView(
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 20.0),
            child: Column(
              children: [
                topSection(),
                SizedBox(height: 12,),
                dailyRecommendation(),
                SizedBox(height: 12,),
                reachingGoalGuide(),
              ],
            ),
          ),
        ),
      ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(20.0), // spacing from screen edge
        child: ElevatedButton(
          onPressed: () {
            // Navigate or perform action
          },
          style: ElevatedButton.styleFrom(
            backgroundColor: Colors.black,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(30), // rounded corners
            ),
            padding: const EdgeInsets.symmetric(vertical: 20), // button height
            elevation: 4,
          ),
          child: const Text(
            "Let's get started!",
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
              color: Colors.white,
            ),
          ),
        ),
      ),
    );
  }
}

Widget topSection() {
  return Column(
    crossAxisAlignment: CrossAxisAlignment.center,
    children: [
      // Icon(Icons.)
      Text(
        "Congratulations\nyour custom plan is ready!",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w700,
          fontSize: 24
        ),
      ),
      SizedBox(height: 16,),
      Text(
        "You should (modify here):",
        textAlign: TextAlign.center,
        style: TextStyle(
          fontWeight: FontWeight.w600,
          fontSize: 16
        ),
      ),
      SizedBox(height: 6,),
      Card(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadiusGeometry.circular(20)
        ),
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
          child: Text(
            "11.0 lbs by 14 February (for example)",
            textAlign: TextAlign.center,
            style: TextStyle(
              fontWeight: FontWeight.w700,
              fontSize: 14
            ),
          ),
        ),
      )
    ],
  );
}

Widget dailyRecommendation() {
  return Card(
    color: Color(0xfff9f8fe),
    child: Padding(
      padding: const EdgeInsets.symmetric(vertical: 16.0, horizontal: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            "Daily recommendation",
            textAlign: TextAlign.start,
            style: TextStyle(
              color: Color(0xff46434d),
              fontWeight: FontWeight.bold,
              fontSize: 18
            ),
          ),
          Text(
            "You can edit this any time",
            style: TextStyle(
              fontSize: 14
            ),
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              macroCard("Calories", 0xff000000, 2125),
              SizedBox(width: 8,),
              macroCard("Carbs", 0xffd19a75, 274),
            ],
          ),
          SizedBox(height: 8,),
          Row(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              macroCard("Protein", 0xffdb6968, 123),
              SizedBox(width: 8,),
              macroCard("Fats", 0xff6699db, 59),
            ],
          ),
          SizedBox(height: 6,),
          healthScoreCard()
        ],
      ),
    ) 
  );
}

Widget macroCard(
  String title,
  int colour,
  int calorie
) {
  return SizedBox(
    height: 170,
    width: 160,
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 16.0, vertical: 16.0),
        child: Stack(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Text(
                  title,
                  style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 16
                  ),
                ),
                SizedBox(height: 8,),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Stack(
                    alignment: Alignment.center,
                    children: [
                      SizedBox(
                        height: 80,
                        width: 80,
                        child: CircularProgressIndicator(
                          value: 0.1,
                          color: Color(colour),
                          backgroundColor: Color(0xffdcdcdc),
                          
                        ),
                      ),
                      Center(child: Text(
                        "$calorie",
                        style: TextStyle(
                          fontWeight: FontWeight.w500,
                          fontSize: 16
                        ),
                      ))
                    ] 
                  ),
                ),
              ],
            ),
            Positioned(
              bottom: 0,
              right: 0,
              child: Icon(Icons.edit, size: 20))
          ]
        ),
      ),
    ),
  );
}

Widget healthScoreCard() {
  return Card(
    color: Colors.white,
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 20),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Icon(Icons.heart_broken),
          SizedBox(width: 16),
          Expanded(
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Text("Health score"),
                    Text("7/10")
                  ],
                ),
                Container(
                  height: 10,
                  width: double.infinity,
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.black, width: 0.5),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: LinearProgressIndicator(
                      value: 7/10,
                      color: Colors.greenAccent,
                      backgroundColor: Colors.white,
                    ),
                  ),
                )
              ],
            ),
          )
        ],
      ),
    ),
  );
}

Widget reachingGoalGuide() {
  return Card(
    color: Color(0xfff9f8fe),
    child: Padding(
      padding: const EdgeInsets.symmetric(horizontal: 12.0, vertical: 16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 8.0),
            child: Text(
              "How to reach your goals",
              textAlign: TextAlign.start,
              style: TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16
              ),
            ),
          ),
          SizedBox(height: 8,),
          adviceCard("Get your weekly life score and improve your routine", ""),
          adviceCard("Track your food", ""),
          adviceCard("Follow your daily calorie recommendation", ""),
          adviceCard("Balance your carbs, protein, fat", ""),
        ],
      ),
    ),
  );
}

Widget adviceCard(
  String content,
  String illustrativeImagePath
) {
  return Padding(
    padding: const EdgeInsets.symmetric(vertical: 2.0),
    child: Card(
      color: Colors.white,
      child: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            // Image.asset(illustrativeImagePath),
            Icon(Icons.heart_broken),
            SizedBox(width: 16.0),
            Expanded(child: Text(
              content,
              style: TextStyle(
                fontWeight: FontWeight.w500
              ),
            ))
          ],
        ),
      ),
    ),
  );
}


