import 'package:flutter/material.dart';
import '../../domain/user_profile.dart';

class UserProfileStore extends ChangeNotifier {
  UserProfile _input = UserProfile();
  UserProfile get input => _input;

  void setGender(String gender) {
    _input.gender = gender;
    notifyListeners();
  }

  void setWorkoutFrequency(String frequency) {
    _input.workoutFrequency = frequency;
    notifyListeners();
  }

  void setHeight(String height) {
    _input.height = height;
    notifyListeners();
  }

  void setWeight(String weight) {
    _input.weight = weight;
    notifyListeners();
  }

  void setDOB(String dob) {
    _input.dob = dob;
    notifyListeners();
  }

  void setGoal(String goal) {
    _input.goal = goal;
    notifyListeners();
  }

  void setDesiredWeight(String desiredWeight) {
    _input.desiredWeight = desiredWeight;
    notifyListeners();
  }

  void setReachingGoalSpeed(String reachingGoalSpeed) {
    _input.reachingGoalSpeed = reachingGoalSpeed;
    notifyListeners();
  }

  void saveUserProfile(UserProfile input) {
    _input = input;
    notifyListeners();
  }
}