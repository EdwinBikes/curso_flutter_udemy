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
        title: const Text('Counter Screen'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text('$clickCounter',
                style: const TextStyle(
                    fontSize: 160, fontWeight: FontWeight.w100)),
                    
            Text('Click${ clickCounter == 1 ? '':'s' }', style: const TextStyle(fontSize: 25))

            // if( clickCounter == 1 )
            //   const Text('Click', style: TextStyle(fontSize: 25)),

            // if( clickCounter != 1 )
            //   const Text('Clicks', style: TextStyle(fontSize: 25)),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          clickCounter++;
          setState(() {});
        },
        child: const Icon(Icons.plus_one),
      ),
    );
  }
}
