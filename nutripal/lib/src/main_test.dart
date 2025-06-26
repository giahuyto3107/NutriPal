import 'package:flutter/material.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/gender_page.dart';
import 'package:nutripal/src/features/articles/presentation/view/user_profile/user_profile_input.dart';
import 'package:nutripal/src/features/articles/presentation/viewmodel/form_progress_view_model.dart';
import 'package:provider/provider.dart';
import 'package:nutripal/src/features/articles/presentation/view/home_page.dart';
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
    MultiProvider(
      providers: [
        ChangeNotifierProvider(create: (_) => UserProfileStore()),
        ChangeNotifierProvider(create: (_) => FormProgressViewModel(totalSteps: 9)),
      ],
        child: const MainApp(),
    ),
  );
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(          
        body: SafeArea(
          child: MultipleStepForm(),
        ),
      ),
    );
  }
}