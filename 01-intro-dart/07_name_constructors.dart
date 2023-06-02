void main () {

  final Map<String, dynamic> rawJson = {  //esto puede ser la informacion que envian los archivos json de una peticion http
    'name': 'Tony Stark',
    'power': 'Money',
    'isAlive': false
  };
  final ironman = Hero.fromJson( rawJson);
  	// final ironman = Hero(
    // isAlive: false,
    // power: 'Money',
    // name: 'Tony Stark'
  	//);


  print(ironman);
}

class Hero {
  String name;
  String power;
  bool isAlive;

  Hero({
    required this.name,
    required this.power,
    required this.isAlive
  });
  Hero.fromJson(Map<String, dynamic> json)//la palabra json es solo un nombre, entonces puedo cambiarlo
      : name = json['name']?? 'No name found',
        power = json['power']?? 'No power found',
        isAlive = json['isAlive']??'No isAlive found';

        @override  //significa que puede sobre escribir las variables
        String toString(){
          return '$name, $power, isAlive: ${ isAlive ? 'yes!':'Nope'}';
        }
}