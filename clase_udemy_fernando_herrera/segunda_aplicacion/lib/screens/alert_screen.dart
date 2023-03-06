import 'dart:io';

import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AlertScreen extends StatelessWidget {
  const AlertScreen({Key? key}) : super(key: key);
  void displayDialogIphone(BuildContext context) {
    showCupertinoDialog(
        barrierDismissible: true,
        context: context,
        builder: (context) {
          return CupertinoAlertDialog(
            title: const Text('titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('este es el contenido de la alerta'),
                SizedBox(height: 10),
                FlutterLogo(size: 80)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text(
                    'Cancelar',
                    style: TextStyle(color: Colors.red),
                  )),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok'))
            ],
          );
        });
  }

  void displayDialogAndoid(BuildContext context) {
    showDialog(
        barrierDismissible: true,
        context: context,
        builder: (contex) {
          return AlertDialog(
            elevation: 5,
            shape:
                RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
            title: const Text('Titulo'),
            content: Column(
              mainAxisSize: MainAxisSize.min,
              children: const [
                Text('este es el contenido de la alerta'),
                SizedBox(height: 10),
                FlutterLogo(size: 80)
              ],
            ),
            actions: [
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('Cancelar')),
              TextButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  child: const Text('ok'))
            ],
          );
        });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
          child: ElevatedButton(
              child:
                  const Text('mostrar alert', style: TextStyle(fontSize: 16)),
              // onPressed: () => displayDialogAndoid(context))),
              // como es ! diferente a ios entonces me muestra android
              onPressed: () => !Platform.isAndroid
                  ? displayDialogAndoid(context)
                  : displayDialogIphone(context))),
      floatingActionButton: FloatingActionButton(
          child: const Icon(Icons.close),
          onPressed: () {
            Navigator.pop(context);
          }),
    );
  }
}
