import 'package:counter_flutter/players/players.dart';
import 'package:flutter/material.dart';


class CounterScreen extends StatefulWidget {
  const CounterScreen({super.key});

  @override
  State<CounterScreen> createState() => _CounterScreenState();
}

class _CounterScreenState extends State<CounterScreen> {
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
      title: Text('Contador de juegos'),
    ),
    body: Column(
      children: [
        SizedBox(height: 16),
        Text(
          'Jugadores:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
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
        SizedBox(height: 16),
        Text(
          'Agregar puntos:',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        SizedBox(height: 8),
        TextField(
          controller: TextEditingController(),
          decoration: InputDecoration(
            labelText: 'Nombre del jugador',
          ),
        ),
        SizedBox(height: 8),
        ElevatedButton(
          onPressed: () {
            String nombreJugador = TextEditingController().text;
            sumarPuntos(nombreJugador);
          },
          child: Text('Sumar puntos'),
        ),
      ],
    ),
  );
}

}
