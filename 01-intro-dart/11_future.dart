void main() {
	print ('Inicio del programa');
	
  httpGet ('https ://fernando-herrera.com/cursos') 
  .then( (value) {
print ( value );
})    
  .catchError( (err){
    print('Error: $err');
  });  
print( 'Fin del programa');
}

Future<String> httpGet ( String url ){
	return Future.delayed( const Duration(seconds: 3), () {
	
    throw 'Error en la petición http';// al escribir el throw no se cumple la siguiente expresion por eso se comenta
    // return 'Respuesta de la petición http';
  });
}