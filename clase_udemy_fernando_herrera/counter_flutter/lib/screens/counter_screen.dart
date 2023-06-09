import 'package:counter_flutter/players/players.dart';
import 'package:flutter/material.dart';
import 'animated_screen.dart';

class CounterFunctionsScreen extends StatefulWidget {
  final List<String> players;

  const CounterFunctionsScreen({Key? key, required this.players})
      : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  late List<Player> players;
  late int currentPlayerIndex;
  late int currentPoints;
  bool shouldChangeButton = false;

  @override
  void initState() {
    super.initState();
    initializePlayers();
  }

  void initializePlayers() {
    players = widget.players
        .map((name) => Player(name: name, wins: 0, points: 0))
        .toList();
    currentPlayerIndex = 0;
    currentPoints = players[0].points;
  }

  void switchPlayer() {
    setState(() {
      players[currentPlayerIndex].points = currentPoints;
      currentPlayerIndex = (currentPlayerIndex + 1) % players.length;
      currentPoints = players[currentPlayerIndex].points;
      shouldChangeButton = true;
    });
  }

  void increment() {
    setState(() {
      currentPoints++;
      players[currentPlayerIndex].points = currentPoints;
      shouldChangeButton = true;
    });
  }

  void decrement() {
    setState(() {
      currentPoints = (currentPoints > 0) ? currentPoints - 1 : 0;
      players[currentPlayerIndex].points = currentPoints;
      shouldChangeButton = true;
    });
  }

  void incrementPoints(int value) {
    setState(() {
      currentPoints += value;
      players[currentPlayerIndex].points = currentPoints;
      shouldChangeButton = true;
    });
  }

  void resetPoints() {
    showDialog(
      context: context,
      builder: (BuildContext context) {
        return AlertDialog(
          title: const Text('Reiniciar Puntos'),
          content:
              const Text('¿Estás seguro de que deseas reiniciar los puntos?'),
          actions: [
            TextButton(
              onPressed: () {
                Navigator.pop(context);
                resetPointsConfirmed();
              },
              child: const Text('Sí'),
            ),
            TextButton(
              onPressed: () {
                Navigator.pop(context);
              },
              child: const Text('No'),
            ),
          ],
        );
      },
    );
  }

  void resetPointsConfirmed() {
    setState(() {
      for (var player in players) {
        player.points = 0;
      }
      currentPoints = 0;
    });
  }

  @override
  Widget build(BuildContext context) {
    final currentPlayer = players[currentPlayerIndex];

    return Scaffold(
      appBar: AppBar(
        title: const Text('Puntajes Totales'),
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SizedBox(height: 38),
                const Text(
                  'Turno del Jugador',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  currentPlayer.name,
                  style: const TextStyle(fontSize: 16),
                ),
                SizedBox(height: 38),
                const Text(
                  'Total de Puntos:',
                  style: TextStyle(fontSize: 16),
                ),
                Text(
                  '${currentPlayer.points}',
                  style: const TextStyle(fontSize: 16),
                ),
                SizedBox(height: 38),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn1",
                      onPressed: decrement,
                      child: const Icon(Icons.remove),
                    ),
                    const SizedBox(width: 12),
                    FloatingActionButton(
                      heroTag: "btn2",
                      onPressed: increment,
                      child: const Icon(Icons.add),
                    ),
                  ],
                ),
                SizedBox(height: 18),
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    FloatingActionButton(
                      heroTag: "btn3",
                      onPressed: () => incrementPoints(5),
                      child: const Text('+5'),
                    ),
                    const SizedBox(width: 26),
                    FloatingActionButton(
                      heroTag: "btn4",
                      onPressed: () => incrementPoints(10),
                      child: const Text('+10'),
                    ),
                  ],
                ),
                const SizedBox(height: 26),
                ElevatedButton(
                  onPressed: switchPlayer,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue),
                    foregroundColor: MaterialStateProperty.all<Color>(
                        Colors.white), // Color de la fuente
                  ),
                  child: const Text(
                    'Guardar puntos',
                    style: TextStyle(
                      fontSize: 16, // Tamaño de la fuente
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                    onPressed: switchPlayer,
                    style: ButtonStyle(
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.redAccent),
                      foregroundColor: MaterialStateProperty.all<Color>(
                          Colors.white), // Color de la fuente
                    ),
                    child: const Text(
                      'Reiniciar puntos',
                      style: TextStyle(
                        fontSize: 16,
                      ),
                    )),
              ],
            ),
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: switchPlayer,
        child: const Icon(Icons.arrow_forward),
      ),
    );
  }
}
