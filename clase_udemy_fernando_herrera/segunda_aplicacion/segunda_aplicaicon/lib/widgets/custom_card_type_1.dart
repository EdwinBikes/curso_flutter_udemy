import 'package:flutter/material.dart';

import '../themes/app_themes.dart';

class CustomCardType1 extends StatelessWidget {
  const CustomCardType1({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
        child: Column(
      children: [
        const ListTile(
          leading: Icon(
            Icons.phone_bluetooth_speaker_outlined,
            color: Apptheme.primary,
          ),
          title: Text('soy un titulo'),
          subtitle: Text('estoy triunfando'),
        ),
        Padding(
          padding: const EdgeInsets.only(right: 4),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              TextButton(
                onPressed: () {},
                child: const Text("Cancel"),
              ),
              TextButton(onPressed: () {}, child: const Text("Ok")),
            ],
          ),
        )
      ],
    ));
  }
}
