import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class ListView2Screen extends StatelessWidget {
  final movies = const [
    'Avengers',
    'Spiderman',
    "Dracula",
    'Amor y Trueno',
    'Rapido y Furioso'
  ];

  const ListView2Screen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Listview 2'),
        ),
        body: ListView.separated(
            itemCount: movies.length,
            itemBuilder: (context, index) => ListTile(
                  title: Text(movies[index]),
                  trailing: const Icon(Icons.arrow_forward_ios_rounded),
                ),
            separatorBuilder: (_, __) => const Divider()));
  }
}
