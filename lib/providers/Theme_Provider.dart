import'package:flutter/cupertino.dart';
import 'package:shared_preferences/shared_preferences.dart';

class ThemeProvider extends ChangeNotifier {
  static const String _isDarkModeKey = 'isDarkMode'; // Key for SharedPreferences

  ThemeProvider() {
    _loadThemeFromPrefs(); // Load theme on initialization
  }

  bool _isDarkMode = false;

  bool getThemeValue() => _isDarkMode; // Getter for theme value

  Future<void> updateTheme({required bool value}) async {
    _isDarkMode = value;
    notifyListeners();
    await _saveThemeToPrefs();
  }

  Future<void> _saveThemeToPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setBool(_isDarkModeKey, _isDarkMode);
  }

  Future<void> _loadThemeFromPrefs() async {
    final prefs = await SharedPreferences.getInstance();
    _isDarkMode = prefs.getBool(_isDarkModeKey) ?? false; // Default to false
    notifyListeners();
  }
}