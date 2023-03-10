import 'package:flutter/material.dart';
import 'package:segunda_aplicaicon/router/app_routes.dart';
import 'package:segunda_aplicaicon/themes/app_themes.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
        debugShowCheckedModeBanner: false,
        title: 'Material App',
        initialRoute: AppRoutes.initialRoute,
        routes: AppRoutes.getAppRoutes(),
        onGenerateRoute: AppRoutes.onGenerateRoute,
        theme: Apptheme.linghtThem);
  }
}
