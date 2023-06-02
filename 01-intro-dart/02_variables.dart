void main (){
final String pokemon = 'pikachu';
final int hp = 100;
final bool isAlive = true;
  final List<String>abilities = ['impostor'];//se puede crear una lista por los [] y se puede decir que tipo de lista es utilizando los <>
  final sprites = <String>['pikachu/front.png','pikachu/back.png']; //es lo mismo que arriba solo que especifica al lado de la lista creada que es un String sin decir que una lista, pero es lo mismo

  // variables de tipo dynamic
  // este tipo de variable permite nulos, hay que saber cuando usarlos
  dynamic errorMessage = 'hola';
  errorMessage =true;
  errorMessage = [1,2,3,4,5,6];
  errorMessage = {1,2,3,4,5,6,};
  errorMessage = () => true;
  errorMessage = null;

  print("""
  $pokemon
  $hp
  $isAlive
  $abilities
  $sprites
  $errorMassage
  """)

}