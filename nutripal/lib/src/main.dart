import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: SafeArea(
          child: Column(
            children: [
              HeaderSection(),
              DateSelectorRow(),
              DailyCaloriesCard(),
              NutrientProgressRow(),
              RecentFoodList(),
              // BottomNavBar(),
            ],
          ) 
        ), 
        
        floatingActionButton: FloatingActionButton(
          onPressed: _addNewFoodEntry,
          backgroundColor: Colors.black,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100)
          ),
          child: Icon(Icons.add, color: Colors.white,),
        ),
        bottomNavigationBar: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            Container(
              height: 0.5,
              color: Colors.black
            ),
            BottomNavigationBar(
              backgroundColor: Color(0xffffffff),
              // divider:
              items: const [
                BottomNavigationBarItem(
                  icon: Icon(Icons.home),
                  label: 'Home'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.menu),
                  label: 'Analytics'
                ),
                BottomNavigationBarItem(
                  icon: Icon(Icons.settings),
                  label: 'Settings'
                )
              ]
            )
          ],
        ),
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: Row(
        children: [
          Icon(Icons.apple, size: 30, color: Colors.black),
          SizedBox(width: 2),
          Text(
            "NutriPal",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.bold,
            )
          ),

          SizedBox(width: 25),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  "Good Morning!",
                  style: TextStyle(
                    fontSize: 15,
                    fontWeight: FontWeight.bold
                    )
                  ),
                Text(
                  "Let's track your nutrition today",
                  style: TextStyle(
                    fontSize: 10,
                    color: Colors.grey,
                  )
                  )
              ],
            ),
          ),

          Card(
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(15)
            ),
            child: Padding(
              padding: EdgeInsets.fromLTRB(7, 5, 7, 5),
              child: Row(
                children: [
                  Icon(Icons.local_fire_department_rounded, color:Colors.red),
                  SizedBox(width: 3),
                  Text(
                    "0",
                    style: TextStyle(
                      fontSize: 13,
                      fontWeight: FontWeight.bold
                    )
                    )
                ],
              )
            ),
          )
        ]
      ),
    );
  }
}

class NutrientProgressRow extends StatelessWidget {
  const NutrientProgressRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Expanded(child: _nutrientProgressCard("Protein", 85, 120)),
          Expanded(child: _nutrientProgressCard("Carbs", 140, 200)),
          Expanded(child: _nutrientProgressCard("Fat", 45, 65)),
        ],
      ),
    );
  }
}

class DateSelectorRow extends StatelessWidget {
  const DateSelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(1),
      child: 
      // SingleChildScrollView(
      //   scrollDirection: Axis.horizontal,
      //   child: 
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            _dayColumn("T", "05"),
            _dayColumn("F", "06"),
            _dayColumn("S", "07"),
            _dayColumn("S", "08"),
            _dayColumn("M", "09"),
            _dayColumn("T", "10"),
            _dayColumn("W", "11"),
          ]
        ),
      // ),
    );
  }
}

class DailyCaloriesCard extends StatelessWidget {
  const DailyCaloriesCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
        child: Card(
        child: SizedBox(
          width: double.infinity,
          child: Padding(
            padding: const EdgeInsets.fromLTRB(0, 13, 0, 13),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: EdgeInsets.only(left: 20),
                  child: Text(
                    "Daily Calories",
                    style: TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                    ),
                  ),
                ),
            
                Center(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      Text(
                        "750 calories remaining",
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          fontSize: 18,
                        )
                      ),
                      SizedBox(height: 5),
                      Text(
                        "63% of daily goal reached",
                        style: TextStyle(
                          color: Colors.grey,
                          fontSize: 14,
                        )
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}

class RecentFoodList extends StatelessWidget {
  const RecentFoodList({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(10),
      child: SizedBox(
        width: double.infinity,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: const EdgeInsets.all(10),
              child: Text(
                "Recently eaten",
                style: TextStyle(
                  fontWeight: FontWeight.bold,
                  fontSize: 15
                ),
              ),
            ),
            
            SizedBox(
              width: double.infinity,
              child: Card(
                color: Color(0xFFF9F8FE),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Text(
                      "You haven't uploaded any food",
                      style: TextStyle(
                        fontWeight: FontWeight.bold
                      ),
                    ),
                    Text(
                      "Start tracking Today's meals by taking a quick pictures"
                    )
                  ],
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}

Widget _dayColumn(String day, String date) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 0),
    child: Column(
      children: [
        Text(
          day,
          style: TextStyle(
            fontWeight: FontWeight.bold
          )
          ),
        Text(date),
      ],
    )
  );
}

Widget _nutrientProgressCard(String type, double current, double total) {
  return Card(
    child: Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        children: [
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Text(
                  type,
                  style: TextStyle(
                    fontWeight: FontWeight.bold,
                    fontSize: 13
                  ),
                ),
              
              Text(
                "${current.toInt()}/${total.toInt()}g",
                style: TextStyle(
                  fontSize: 12
                ),
              ),
            ]
          ),
          Text(
            "${(current/total * 100).round().toInt()}% of daily goal",
            style: TextStyle(
              fontSize: 12
            ),
          ),
        ],
      ),
    ),
  );
}

// Widget _uploadedSection(AboutDialog)

void _addNewFoodEntry() {
  AddNewFoodPage();
}

class AddNewFoodPage extends StatelessWidget {
  const AddNewFoodPage({super.key});

  Widget build(BuildContext context) {
    return Column(
      children: [

      ],
    );
  }
}

double calculateBMR(String gender, double weight, double height, int age) {
  if (gender == 'male') {
    return 10 * weight + 6.25 * height - 5 * age + 5;
  } else {
    return 10 * weight + 6.25 * height - 5 * age - 161;
  }
}

double calculateBMI(double weightKg, double heightCm) {
  double heightM = heightCm / 100;
  return weightKg / (heightM * heightM);
}

// Used for multiplying BMR index
double getActivityMultiplier(int workoutsPerWeek) {
  if (workoutsPerWeek == 0) return 1.2;
  if (workoutsPerWeek <= 3) return 1.375;
  if (workoutsPerWeek <= 5) return 1.55;
  if (workoutsPerWeek <= 7) return 1.725;
  return 1.9;
}

double adjustForGoal(double calories, String goal, String speed) {
  double adjustment = 0;
  if (speed == 'slow') adjustment = 250;
  else if (speed == 'medium') adjustment = 500;
  else if (speed == 'fast') adjustment = 750;

  if (goal == 'lose') return calories - adjustment;
  if (goal == 'gain') return calories + adjustment;
  return calories; // maintain
}

double estimateTimeToGoal({
  required double currentWeight,
  required double targetWeight,
  required double weeklyChangeKg,
}) {
  double weightDifference = (targetWeight - currentWeight).abs();
  if (weeklyChangeKg <= 0) {
    throw ArgumentError("Weekly change must be greater than 0");
  }
  return weightDifference / weeklyChangeKg;
}