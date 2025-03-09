import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:shared_preferences/shared_preferences.dart';

@injectable
class ThemeCubit extends Cubit<ThemeMode> {
  ThemeCubit() : super(ThemeMode.system) {
    _loadTheme();
  }

  void changeTheme(String theme) async {
    ThemeMode newTheme = _mapStringToThemeMode(theme);
    emit(newTheme);
    _saveTheme(theme);
  }

  void _loadTheme() async {
    final prefs = await SharedPreferences.getInstance();
    final savedTheme = prefs.getString('themeMode') ?? "System";
    
    emit(_mapStringToThemeMode(savedTheme));
  }

  void _saveTheme(String theme) async {
    final prefs = await SharedPreferences.getInstance();
    await prefs.setString('themeMode', theme);
  }

  ThemeMode _mapStringToThemeMode(String theme) {
    switch (theme) {
      case "Light":
        return ThemeMode.light;
      case "Dark":
        return ThemeMode.dark;
      default:
        return ThemeMode.system;
    }
  }
}
