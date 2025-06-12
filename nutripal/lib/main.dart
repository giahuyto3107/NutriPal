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
                HeaderSection(),
                DateSelectorRow()
              ],
            )
          ) 
        ) 
        
        
      ),
    );
  }
}

class HeaderSection extends StatelessWidget {
  const HeaderSection({super.key});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
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

class DateSelectorRow extends StatelessWidget {
  const DateSelectorRow({super.key});

  @override
  Widget build(BuildContext context) {
    return Row(
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
    );
  }
}

Widget _dayColumn(String day, String date) {
  return Padding(
    padding: EdgeInsets.symmetric(horizontal: 8),
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