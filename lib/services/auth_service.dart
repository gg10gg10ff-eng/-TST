import 'package:flutter/material.dart';
import '../models/user_model.dart';

class AuthService extends ChangeNotifier {
  User? _currentUser;

  User? get currentUser => _currentUser;

  Future<bool> login(String email, String password) async {
    await Future.delayed(const Duration(seconds: 1));
    
    _currentUser = User(
      id: '1',
      name: 'User Name',
      email: email,
      isAdmin: false,
      languagePreference: 'ar',
      darkMode: false,
    );
    
    notifyListeners();
    return true;
  }

  Future<void> logout() async {
    _currentUser = null;
    await Future.delayed(const Duration(milliseconds: 500));
    notifyListeners();
  }
}