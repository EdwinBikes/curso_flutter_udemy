import 'package:flutter/material.dart';

import 'package:segunda_aplicaicon/router/app_routes.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(title: const Text('Componentes de Flutter')),
        body: ListView.separated(
          itemBuilder: (context, i) => ListTile(
            leading: Icon(AppRoutes.menuOptions[i].icon),
            title: Text(AppRoutes.menuOptions[i].name),
            onTap: () {
              Navigator.pushNamed(context, AppRoutes.menuOptions[i].route);
            },
          ),
          itemCount: AppRoutes.menuOptions.length,
          separatorBuilder: (_, __) => const Divider(),
        ));
  }
}
