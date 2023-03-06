import 'package:flutter/material.dart';
import 'package:flutter/semantics.dart';

class CounterScreen extends StatefulWidget {
  const CounterScreen({Key? key}) : super(key: key);

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
  int counter = 0;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Prueba fff'),
        ),
        body: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text('Numero de Clicks'),
              Text("$counter"),
            ],
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
        floatingActionButton: Row(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            FloatingActionButton(
              child: const Icon(Icons.exposure_plus_1_outlined),
              onPressed: () => setState(() => counter++),
            ),
            FloatingActionButton(
              child: const Icon(Icons.published_with_changes_sharp),
              onPressed: () => setState(() => counter = 0),
            ),
            // const SizedBox(
            //   width: 20,
            // ),
            FloatingActionButton(
              child: const Icon(Icons.exposure_minus_1),
              onPressed: () => setState(() => counter--),
            ),
          ],
        ));
  }
}
