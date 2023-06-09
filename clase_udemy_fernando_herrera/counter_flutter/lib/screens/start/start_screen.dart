import 'dart:io';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:counter_flutter/screens/counter_screen.dart';
import 'package:counter_flutter/screens/start/player_textfield.dart';
import 'package:counter_flutter/screens/start/start_button.dart';

class StartScreen extends StatefulWidget {
  const StartScreen({Key? key}) : super(key: key);

  @override
  _StartScreenState createState() => _StartScreenState();
}

class _StartScreenState extends State<StartScreen> {
  int playerCount = 0;
  List<String> playerNames = [];
  List<String> defaultPlayerNames = [];

  @override
  void initState() {
    super.initState();
    initializeDefaultPlayerNames();
  }

  void initializeDefaultPlayerNames() {
    defaultPlayerNames =
        List.generate(playerCount, (index) => 'Jugador ${index + 1}');
    playerNames = List.from(defaultPlayerNames);
  }

  void navigateToCounterFunctionsScreen() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => CounterFunctionsScreen(
          players: playerNames,
        ),
      ),
    );
  }

  void displayAlert(BuildContext context) {
    if (Platform.isAndroid) {
      showDialog(
        context: context,
        builder: (BuildContext context) {
          return AlertDialog(
            elevation: 5,
            shape: RoundedRectangleBorder(
              borderRadius: BorderRadius.circular(10),
            ),
            title: const Text('Detalles de Jugadores'),
            content: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 26),
                const Text('Cantidad de Jugadores:'),
                Text(playerCount.toString()),
                const SizedBox(height: 26),
                const Text('Nombre de Jugadores:'),
                for (var name in playerNames) Text(name),
              ],
            ),
            actions: [
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                  navigateToCounterFunctionsScreen();
                },
                child: const Text('Aceptar'),
              ),
              TextButton(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Actualizar'),
              ),
            ],
          );
        },
      );
    } else {
      showCupertinoDialog(
        context: context,
        builder: (BuildContext context) {
          return CupertinoAlertDialog(
            title: const Text('Detalles de Jugadores'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: [
                const SizedBox(height: 26),
                const Text('Cantidad de Jugadores:'),
                Text(playerCount.toString()),
                const SizedBox(height: 26),
                const Text('Nombre de Jugadores:'),
                for (var name in playerNames) Text(name),
              ],
            ),
            actions: [
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                  navigateToCounterFunctionsScreen();
                },
                child: const Text('Aceptar'),
              ),
              CupertinoDialogAction(
                onPressed: () {
                  Navigator.pop(context);
                },
                child: const Text('Actualizar'),
              ),
            ],
          );
        },
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('APP Edwin Bikes Contador'),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(height: 16),
            const Row(
              children: [
                Icon(
                  Icons.add_task,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'Cantidad de Jugadores:',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            TextField(
              keyboardType: TextInputType.number,
              onChanged: (value) {
                setState(() {
                  playerCount = int.tryParse(value) ?? 0;
                  initializeDefaultPlayerNames();
                });
              },
            ),
            const SizedBox(height: 46),
            const Row(
              children: [
                Icon(
                  Icons.list,
                  color: Colors.blue,
                ),
                SizedBox(width: 8),
                Text(
                  'Nombres de los Jugadores:',
                  style: TextStyle(fontSize: 16),
                ),
              ],
            ),
            Expanded(
              child: ListView(
                children: [
                  for (var index = 0; index < playerCount; index++)
                    Hero(
                      tag: 'start_player_${index + 1}',
                      child: PlayerTextField(
                        onChanged: (value) {
                          setState(() {
                            playerNames[index] = value;
                          });
                        },
                        defaultText: defaultPlayerNames[index],
                      ),
                    ),
                  const SizedBox(height: 36),
                  Align(
                    alignment: Alignment.bottomCenter,
                    child: StartButton(
                      onPressed: () {
                        displayAlert(context);
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
