import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:nutripal/src/features/articles/presentation/view/home_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/user_input_old.dart';
import 'package:nutripal/src/features/articles/presentation/view/settings.dart';
import 'package:nutripal/src/features/articles/presentation/view/analytic.dart';
import 'features/articles/presentation/viewmodel/user_profile_store.dart';

// class UserInputData extends ChangeNotifier {
//   final List<UserInputData> _inputs = [];
//   List<UserInputData> get inputs => _inputs;

//   void addInput(UserInputData data) {
//     _inputs.add(data);
//     notifyListeners();
//   }
// }

void main() {
  runApp(
    ChangeNotifierProvider(
      create: (_) => UserProfileStore(),
      child: const MainApp(),
    ),
  );
}

class MainApp extends StatefulWidget {
  const MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  int _currentIndex = 0;
  bool _showUserInput = false;

  final List<Widget> _pages = [
    HomePage(),
    AnalyticsPage(),
    SettingsPage()
  ];

  void _openUserInput() {
    setState(() {
      _showUserInput = true;
    });
  }

  void _onTabTapped(int index) {
    setState(() {
      _currentIndex = index;
      _showUserInput = false;
    });
  }

  void _closeUserInput() {
    setState(() {
      _showUserInput = false;
    });
  }
  
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(          
        body: SafeArea(
          child: _showUserInput
            ? UserInputPage(onConfirmed: _closeUserInput)
            : _pages[_currentIndex], 
        ), 
        
        floatingActionButton: _currentIndex == 0 // HomePage index
          ? Builder(
              builder: (context) => FloatingActionButton(
                onPressed: _openUserInput,
                backgroundColor: Colors.black,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(100)
                ),
                child: Icon(Icons.add, color: Colors.white,),
              ),
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