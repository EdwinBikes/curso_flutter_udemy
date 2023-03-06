import 'package:flutter/material.dart';
import 'package:primer_ejercicio/counter_screen.dart';
import 'package:primer_ejercicio/counter_screen_extract_widget.dart';
import 'package:primer_ejercicio/home_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        home: CounterScreen2());
  }
}
