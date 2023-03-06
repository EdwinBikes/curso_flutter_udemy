import 'package:flutter/material.dart';
import 'package:segunda_aplicaicon/themes/app_themes.dart';

class CustomCardType2 extends StatelessWidget {
  final String imagenUrl;
  final String? nameCard;
  const CustomCardType2({Key? key, required this.imagenUrl, this.nameCard})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Card(
      clipBehavior: Clip.antiAlias,
      shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
      elevation: 20,
      shadowColor: Apptheme.primary.withOpacity(0.6),
      child: Column(
        children: [
          FadeInImage(
            placeholder: const AssetImage('assets/loading.gif'),
            image: NetworkImage(imagenUrl),
            width: double.infinity,
            height: 230,
            fit: BoxFit.cover,
            fadeInDuration: const Duration(milliseconds: 300),
          ),
          if (nameCard != null)
            Container(
              alignment: AlignmentDirectional.centerEnd,
              padding: const EdgeInsets.only(right: 20, top: 10, bottom: 10),
              child: Text(nameCard!),
            )
        ],
      ),
    );
  }
}
