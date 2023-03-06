import 'package:flutter/material.dart';

import '../widgets/widgets.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('card widget'),
        ),
        body: ListView(
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 12),
          children: const [
            CustomCardType1(),
            SizedBox(height: 10),
            CustomCardType2(
                nameCard: 'un hermoso paisaje',
                imagenUrl: 'https://wallpaper.dog/large/10795761.jpg'),
            SizedBox(height: 20),
            CustomCardType2(
                imagenUrl:
                    'https://i.blogs.es/f2ba32/wallpapers-abduzeedo/1366_2000.jpg'),
            SizedBox(height: 20),
            CustomCardType2(
                imagenUrl:
                    'https://www.nawpic.com/media/2020/cool-nawpic.jpeg'),
            SizedBox(height: 20),
            CustomCardType2(
                imagenUrl:
                    'https://i.pinimg.com/originals/b4/dd/f8/b4ddf89f7808243a3479dfd571e25dc8.jpg'),
            SizedBox(height: 20),
            CustomCardType2(
                nameCard: 'estos se pueden colocar o, no por el if',
                imagenUrl:
                    'https://img.freepik.com/free-vector/colorful-palm-silhouettes-background_23-2148541792.jpg?w=2000'),
            SizedBox(height: 30),
          ],
        ));
  }
}
