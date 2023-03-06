import 'package:flutter/material.dart';
import 'package:segunda_aplicaicon/themes/app_themes.dart';

class SliderScreen extends StatefulWidget {
  const SliderScreen({Key? key}) : super(key: key);

  @override
  State<SliderScreen> createState() => _SliderScreenState();
}

class _SliderScreenState extends State<SliderScreen> {
  double _sliderValue = 100;
  bool _sliderEnabled = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Slider'),
        ),
        body: SingleChildScrollView(
          child: Column(
            children: [
              Slider.adaptive(
                  min: 50,
                  max: 400,
                  activeColor: Apptheme.primary,
                  //divisions: 10,
                  value: _sliderValue,
                  onChanged: _sliderEnabled
                      ? (value) {
                          _sliderValue = value;
                          setState(() {});
                        }
                      : null),
              Checkbox(
                  value: _sliderEnabled,
                  onChanged: (value) {
                    _sliderEnabled = value ?? true;
                    setState(() {});
                  }),
              CheckboxListTile(
                  activeColor: Apptheme.primary,
                  title: const Text('Habilitar slider'),
                  value: _sliderEnabled,
                  onChanged: (value) => setState(() {
                        _sliderEnabled = value ?? true;
                      })),
              Switch(
                  value: _sliderEnabled,
                  onChanged: (value) => setState(() {
                        _sliderEnabled = value;
                      })),
              SwitchListTile.adaptive(
                  activeColor: Apptheme.primary,
                  title: const Text('Habilitar slider'),
                  value: _sliderEnabled,
                  onChanged: (value) => setState(() {
                        _sliderEnabled = value;
                      })),

              SingleChildScrollView(
                child: Image(
                  image: const NetworkImage(
                      'https://i.ytimg.com/vi/M2YkBkDVO4k/maxresdefault.jpg'),
                  fit: BoxFit.contain,
                  width: _sliderValue,
                ),
              ),

              // SizedBox(
              //   width: _sliderValue,
              //   child: Image(
              //       image: NetworkImage(
              //           'https://i.ytimg.com/vi/M2YkBkDVO4k/maxresdefault.jpg')),
              // )
            ],
          ),
        ));
  }
}
