import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:gemini_gpt/onboarding.dart';
import 'package:gemini_gpt/theme_cubit.dart';
import 'package:gemini_gpt/themes.dart';

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (_) => ThemeCubit(),
      child: Builder(
        builder: (context) {
          final themeMode = context.watch<ThemeCubit>().state.themeMode;

          return MaterialApp(
            title: 'Flutter Demo',
            theme: lightMode,
            darkTheme: darkMode,
            themeMode: themeMode,
            home: const Onboarding(),
            debugShowCheckedModeBanner: false,
          );
        },
      ),
    );
  }
}
