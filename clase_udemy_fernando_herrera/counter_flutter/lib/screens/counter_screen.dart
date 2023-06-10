import 'package:counter_flutter/players/players.dart';
import 'package:flutter/material.dart';

class CounterFunctionsScreen extends StatefulWidget {
  final List<String> players;
  final int winningScore;

  const CounterFunctionsScreen({
    Key? key,
    required this.players,
    required this.winningScore,
  }) : super(key: key);

  @override
  State<CounterFunctionsScreen> createState() => _CounterFunctionsScreenState();
}

class _CounterFunctionsScreenState extends State<CounterFunctionsScreen> {
  List<int> scores = [];
  late List<Player> players;
  late int currentPlayerIndex;
  late int currentPoints;
  bool shouldChangeButton = false;

  @override
  void initState() {
    super.initState();
    initializePlayers();
  }

  void initializeScores() {
    scores = List.generate(widget.players.length, (index) => 0);
  }

  void updateScore(int playerIndex, int score) {
    setState(() {
      scores[playerIndex] += score;
      checkForWinner(); // Verificar si hay un ganador después de cada actualización de puntaje
    });
  }

  void checkForWinner() {
    for (var i = 0; i < scores.length; i++) {
      if (scores[i] >= widget.winningScore) {
        // Mostrar una alerta con el nombre del ganador
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('¡Tenemos un ganador!'),
              content: Text(
                  'El jugador ${widget.players[i]} ha ganado con un puntaje de ${scores[i]}.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
        break;
      }
    }
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

      if (currentPoints >= widget.winningScore) {
        // Mostrar una alerta con el nombre del ganador al guardar los puntos
        showDialog(
          context: context,
          builder: (BuildContext context) {
            return AlertDialog(
              title: const Text('¡Tenemos un ganador!'),
              content: Text(
                  'El jugador ${players[currentPlayerIndex].name} ha ganado con un puntaje de $currentPoints.'),
              actions: [
                TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Aceptar'),
                ),
              ],
            );
          },
        );
      }
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
        actions: [
          IconButton(
            onPressed: resetPoints,
            icon: const Icon(Icons.refresh),
          ),
        ],
      ),
      body: SafeArea(
        child: Center(
          child: SingleChildScrollView(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                SingleChildScrollView(
                  scrollDirection: Axis.horizontal,
                  child: Row(
                    children: [
                      for (var player in players)
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 8.0),
                          child: AnimatedContainer(
                            duration: const Duration(milliseconds: 200),
                            decoration: BoxDecoration(
                              color:
                                  player == currentPlayer ? Colors.blue : null,
                              borderRadius: BorderRadius.circular(4),
                            ),
                            child: Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(
                                '${player.points}',
                                style: TextStyle(
                                  fontSize: 24,
                                  color: player == currentPlayer
                                      ? Colors.white
                                      : Colors.red,
                                ),
                              ),
                            ),
                          ),
                        ),
                    ],
                  ),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Turno del Jugador:',
                  style: TextStyle(fontSize: 26),
                ),
                const SizedBox(height: 8),
                Text(
                  currentPlayer.name,
                  style: const TextStyle(fontSize: 20),
                ),
                const SizedBox(height: 48),
                const Text(
                  'Total de Puntos:',
                  style: TextStyle(fontSize: 26),
                ),
                Text(
                  '${currentPlayer.points}',
                  style: const TextStyle(fontSize: 24, color: Colors.red),
                ),
                const SizedBox(height: 38),
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
                const SizedBox(height: 18),
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
                const SizedBox(height: 46),
                ElevatedButton(
                  onPressed: switchPlayer,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.lightBlue),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    'Guardar puntos',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
                const SizedBox(height: 48),
                ElevatedButton(
                  onPressed: resetPoints,
                  style: ButtonStyle(
                    backgroundColor:
                        MaterialStateProperty.all<Color>(Colors.redAccent),
                    foregroundColor:
                        MaterialStateProperty.all<Color>(Colors.white),
                  ),
                  child: const Text(
                    'Reiniciar puntos',
                    style: TextStyle(
                      fontSize: 16,
                    ),
                  ),
                ),
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
