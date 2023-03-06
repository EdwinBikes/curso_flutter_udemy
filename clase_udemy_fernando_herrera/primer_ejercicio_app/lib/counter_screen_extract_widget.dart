import 'package:flutter/material.dart';

class CounterScreen2 extends StatefulWidget {
  const CounterScreen2({Key? key}) : super(key: key);

  @override
  State<CounterScreen2> createState() => _CounterScreen2State();
}

class _CounterScreen2State extends State<CounterScreen2> {
  int counter = 0;
  void increase() {
    counter++;
    setState(() {});
  }

  void decrease() {
    counter--;
    setState(() {});
  }

  void restartCount() {
    counter = 0;
    setState(() {});
  }

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
        floatingActionButton: CustomFloating(
          increaseFn: increase,
          decreaseFn: decrease,
          resetCount: restartCount,
        ));
  }
}

class CustomFloating extends StatelessWidget {
  final Function increaseFn;
  final Function decreaseFn;
  final Function resetCount;

  const CustomFloating(
      {Key? key,
      required this.increaseFn,
      required this.decreaseFn,
      required this.resetCount})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        FloatingActionButton(
          child: Icon(Icons.exposure_plus_1_outlined),
          onPressed: () => increaseFn(),
        ),
        FloatingActionButton(
            child: Icon(Icons.published_with_changes_sharp),
            onPressed: () => resetCount()),
        // const SizedBox(
        //   width: 20,
        // ),
        FloatingActionButton(
            child: Icon(Icons.exposure_minus_1), onPressed: () => decreaseFn()),
      ],
    );
  }
}
