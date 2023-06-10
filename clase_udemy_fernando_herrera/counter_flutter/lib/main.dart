import 'package:flutter/material.dart';
import 'package:counter_flutter/screens/start/start_screen.dart';
import 'package:counter_flutter/widgets/app_theme.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: AppTheme.lightTheme(), // Utiliza el tema definido en AppTheme
      home: const StartScreen(),
    );
  }
}
