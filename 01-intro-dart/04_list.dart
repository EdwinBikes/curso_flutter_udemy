void main(){
  final numbers =[4,2,3,4,5,5,5,6,7,7,7,8,8,9,10];
  
  print('list original $numbers');// se podria cambiar o eliminar duplicados asi - $numbers.toSet().toList()
  print('Cuantos son ${numbers.length}');
  print('primera posicion ${numbers[0]}');
  print('alcontrario ${numbers.reversed}');
  final reverse = numbers.reversed;
  print('Iterables de $reverse');
  print('numeros originales pero en List${reverse.toList()}');
  print('Set: elimina los duplicados, solo valores unicos${reverse.toSet()}');
  
  final numbersGreaterThan5 = numbers.where((nums){
    return nums >5; //true
  });  
  print ('>5 iterable $numbersGreaterThan5');
  print('>5 Set ${numbersGreaterThan5.toSet()}');
}