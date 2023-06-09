import 'package:flutter/material.dart';

class StartButton extends StatelessWidget {
  final VoidCallback onPressed;

  const StartButton({required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return FittedBox(
      child: ElevatedButton(
        onPressed: onPressed,
        style: ButtonStyle(
          backgroundColor: MaterialStateProperty.all<Color>(Colors.lightBlue),
        ),
        child: const Text(
          'Iniciar Contador',
          style: TextStyle(
            color: Color.fromARGB(255, 252, 252, 252),
          ),
        ),
      ),
    );
  }
}
