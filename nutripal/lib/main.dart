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
          child: Center(
            child: Column(
              children: [
                Padding(
                  padding: EdgeInsets.all(20),
                  child: Row(
                    children: [
                      Row(
                        children: [
                          Icon(Icons.apple, size: 30, color: Colors.black),
                          SizedBox(width: 2),
                          Text("NutriPal"),
                        ]
                        
                      ),
                      Column(
                        children: [
                          Text("Good Morning!"),
                          Text("Let's track your nutrition today")
                        ],
                      ),
                      Card(
                        child: Padding(
                          padding: EdgeInsets.all(10),
                          child: Row(
                            children: [
                              Icon(Icons.local_fire_department_rounded, color:Colors.red),
                              SizedBox(width: 3),
                              Text("0")
                            ],
                          )
                        ),
                      )
                    ],
                  )
                ),

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
                  ],
                ),
              ],
            )
          ) 
        ) 
        
        
      ),
    );
  }
}

Widget _dayColumn(String day, String date) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
    child: Column(
      children: [
        Text(day),
        Text(date),
      ],
    )
  );
}