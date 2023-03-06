import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListViewScreen extends StatelessWidget {
  final movies = const [
    'Avengers',
    'Spiderman',
    "Dracula",
    'Amor y Trueno',
    'Rapido y Furioso'
  ];

  const ListViewScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview 1'),
        ),
        body: ListView(
          children: [
            ...movies
                .map((movie) => ListTile(
                      title: Text(movie),
                      trailing: const Icon(Icons.arrow_forward_ios_rounded),
                    ))
                .toList()
          ],
        ));
  }
}
