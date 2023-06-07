import 'package:counter_flutter/players/players.dart';
import 'package:flutter/material.dart';

class CounterPage extends StatefulWidget {
  const CounterPage({super.key});

  @override
  State<CounterPage> createState() => _CounterPageState();
}

class _CounterPageState extends State<CounterPage> {
  int clickCounter = 0;
List<Jugador> jugadores = [];

void sumarPuntos(String nombreJugador) {
  setState(() {
    Jugador? jugador = jugadores.firstWhere(
      (jugador) => jugador.nombre == nombreJugador,
     
    );

    if (jugador != null) {
      jugador.vecesGanadas++;
    } else {
      jugadores.add(Jugador(nombre: nombreJugador, vecesGanadas: 1));
    }
  });
}

  @override
Widget build(BuildContext context) {
  return Scaffold(
    appBar: AppBar(
      title: const Text('Contador de juegos'),
    ),
    body: Column(
      SizedBox(height: 16),
        const Text(
          'Jugadores:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        Expanded(
          child: ListView.builder(
            itemCount: jugadores.length,
            itemBuilder: (context, index) {
              Jugador jugador = jugadores[index];
              return ListTile(
                title: Text(jugador.nombre),
                trailing: Text(jugador.vecesGanadas.toString()),
              );
            },
          ),
        ),
        const SizedBox(height: 16),
        const Text(
          'Agregar puntos:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        const SizedBox(height: 8),
        TextField(
          controller: TextEditingController(),
          decoration: const InputDecoration(
            labelText: 'Nombre del jugador',
          ),
        ),
        const SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            String nombreJugador = TextEditingController().text;
            sumarPuntos(nombreJugador);
          },
          child: const Text('Sumar puntos'),
        ),
    )
  );
}

}
