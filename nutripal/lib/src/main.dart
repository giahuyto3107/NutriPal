import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_input.dart';
import 'package:nutripal/src/features/articles/presentation/view/home_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/settings.dart';
import 'package:nutripal/src/features/articles/presentation/view/analytic.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;

  final List<Widget> _pages = [
    HomePage(),
    AnalyticsPage(),
    SettingsPage()
  ];

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(          
        body: SafeArea(
          child:_pages[_currentIndex], 
        ), 
        
        floatingActionButton: _currentIndex == 0 //HomePage index
          ? FloatingActionButton(
              onPressed: () {
                Navigator.of(context).push(
                  MaterialPageRoute(
                    builder: (context) => UserInputPage(),
                  )
                );
              },
              backgroundColor: Colors.black,
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(100)
              ),
              child: Icon(Icons.add, color: Colors.white,),
           )
          : null, 

        bottomNavigationBar: BottomNavigationBar(
          backgroundColor: Color(0xffffffff),
          selectedItemColor: Colors.black,
          unselectedItemColor: Colors.grey,
          onTap: _onTabTapped,
          currentIndex: _currentIndex,
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
        ),
      ),
    );
  }
}

