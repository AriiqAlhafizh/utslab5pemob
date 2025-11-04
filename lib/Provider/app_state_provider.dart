import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AppStateProvider extends ChangeNotifier {
  static const String _highScoreKey = 'quiz_highscore';
  static const String _usernameKey = 'user_name';

  String _currentUsername = 'Mas Tomat';
  String get currentUsername => _currentUsername;

  AppStateProvider() {
    _loadInitialState();
  }

  void _loadInitialState() async {
    final prefs = await SharedPreferences.getInstance();
    _currentUsername = prefs.getString(_usernameKey) ?? 'Mas Tomat';
    _currentHighscore = prefs.getInt(_highScoreKey) ?? 0;

    notifyListeners();
  }

  Future<void> setUsername(String newName) async {
    if (newName.trim().isEmpty) return;

    _currentUsername = newName;
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString(_usernameKey, newName);

    notifyListeners();
  }

  int _currentHighscore = 0;
  int get currentHighscore => _currentHighscore;

  Future<void> saveHighscore(int currentScore) async {
    final prefs = await SharedPreferences.getInstance();

    if (currentScore > _currentHighscore) {
      _currentHighscore = currentScore;

      await prefs.setInt(_highScoreKey, currentScore);
      notifyListeners();
      print('Highscore baru tersimpan & listener di-update: $currentScore');
    }
  }
}