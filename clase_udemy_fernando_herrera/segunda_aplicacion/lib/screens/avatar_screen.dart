import 'package:flutter/material.dart';

class AvatarScreen extends StatelessWidget {
  const AvatarScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Avatar circle'),
        actions: [
          Container(
            margin: const EdgeInsets.only(right: 5),
            child: CircleAvatar(
                child: const Text('SL'), backgroundColor: Colors.blue[200]),
          )
        ],
      ),
      body: const Center(
          child: CircleAvatar(
        maxRadius: 120,
        backgroundImage: NetworkImage(
            'https://www.latercera.com/resizer/jG6LTK7g5kkSAAHUJP2drdC3JN4=/800x0/smart/cloudfront-us-east-1.images.arcpublishing.com/copesa/3NEDFAFQDNBU3NQZJVM6JJ6QDA.jpeg'),
      )),
    );
  }
}
