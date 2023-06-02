void main (){
  
  print( greetEveryone()); // hello everyone!
  
  print( greetEveryoneTwo());
  
  print('Suma de ${addTwoNumbers(10,30)}');
  
  print('Suma de ${addTwoNumbersTwo(50,90)}');
}

String greetEveryone(){
  return 'hello everyone!';
  }
  
String greetEveryoneTwo() => 'hello everione two!'; // ++ es lo mismo solo que con arrowfuntion

int addTwoNumbers( int a, int b){ //se recomienda poner el tipo de dato para el tipado siempre, pero si necesita que sea opcional se ponen dentro de[]
  return a+ b;
}
  

int addTwoNumbersTwo( int a, [int b = 0]) => a+ b; // se creo opcional el segundo numero y da valor de 0 por defecto




