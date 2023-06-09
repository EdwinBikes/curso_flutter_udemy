import 'package:flutter/material.dart';

class PlayerTextField extends StatelessWidget {
  final ValueChanged<String> onChanged;
  final String defaultText;

  const PlayerTextField({
    required this.onChanged,
    required this.defaultText,
  });

  @override
  Widget build(BuildContext context) {
    return TextField(
      onChanged: onChanged,
      decoration: InputDecoration(
        hintText: defaultText,
      ),
    );
  }
}
