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
        appBar: AppBar(
          leading: Icon(Icons.apple),
          title: Text("NutriPal"),
        ),
        body: Center(
          child: Column(
            children: [
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