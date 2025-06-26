import 'package:flutter/material.dart';

class FormProgressViewModel extends ChangeNotifier {
  int _currentStep = 1;
  final int totalSteps;

  FormProgressViewModel({required this.totalSteps});

  int get currentStep => _currentStep;

  double get progress => _currentStep / totalSteps.toDouble();

  void nextStep() {
    if (_currentStep < totalSteps) {
      _currentStep++;
      notifyListeners();
    }
  }

  void prevStep() {
    if (_currentStep > 1) {
      _currentStep--;
      notifyListeners();
    }
  }

  void setStep(int step) {
    if (step >= 1 && step <= totalSteps) {
      _currentStep = step;
      notifyListeners();
    }
  }
}