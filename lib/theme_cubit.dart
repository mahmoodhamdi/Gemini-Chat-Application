import 'package:equatable/equatable.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

// Define the state of the theme, extending Equatable for comparison
class ThemeState extends Equatable {
  
  final ThemeMode themeMode;

  const ThemeState(this.themeMode);
  

  @override
  List<Object> get props => [themeMode];
}

// Define the Cubit for theme management
class ThemeCubit extends Cubit<ThemeState> {
  ThemeCubit() : super(const ThemeState(ThemeMode.light));

  // Toggle between light and dark theme
  void toggleTheme() {
    final newTheme =
        state.themeMode == ThemeMode.light ? ThemeMode.dark : ThemeMode.light;
    emit(ThemeState(newTheme));
  }
}
