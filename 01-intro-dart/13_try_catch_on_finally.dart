void main() async {
	print ('Inicio del programa');
  
  try {
  
    final value = await httpGet ('https ://fernando-herrera.com/cursos');
  	print ( value );
    
  } on Exception catch(err){
   print('Tenemos una Exception: $err');
    
  } catch (err){
    print('OOPS!! algo terrible pasó: $err');
  } finally {
    print('fin del try y catch');
  }
	  
print( 'Fin del programa');
}

Future<String> httpGet ( String url ) async{
	await Future.delayed( const Duration(seconds: 3)); 
	
  throw Exception ('Tenemos una un error');
  
  // throw'Error en la petición';
  
  //return 'Error en la petición http';
}


// Future<String> httpGet ( String url ){
// 	return Future.delayed( const Duration(seconds: 3), () {
	
//     throw 'Error en la petición http';// al escribir el throw no se cumple la siguiente expresion por eso se comenta
//     // return 'Respuesta de la petición http';
//   });
// }