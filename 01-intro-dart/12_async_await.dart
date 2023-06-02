void main() async {
	print ('Inicio del programa');
  
  try {
  
    final value = await httpGet ('https ://fernando-herrera.com/cursos');
  	print ( value );
    
  } catch (err){
    print('Tenemos un error: $err');
  }
	
  
print( 'Fin del programa');
}

Future<String> httpGet ( String url ) async{
	await Future.delayed( const Duration(seconds: 3)); 
	
  throw'Error en la petición';
  
  //return 'Error en la petición http';
}
