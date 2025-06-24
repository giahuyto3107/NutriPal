import 'package:flutter/material.dart';
import '../../domain/user_profile_input.dart';

class UserProfileStore extends ChangeNotifier {
  UserProfileInput? _input;
  UserProfileInput? get input => _input;

  void saveUserProfile(UserProfileInput input) {
    _input = input;
    notifyListeners();
  }
}