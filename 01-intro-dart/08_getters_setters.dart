//calcular área

void main() {
  
  final mySquare = Square( side:7);
  
  print( 'area: ${mySquare.area}');
  
}

class Square{
  
  double _side; //side * side
  
  Square({required double side})
    		: assert(side >= 0,'side tiene que ser >= 0'), 
  			  _side = side;
  
  double get area {
    return _side * _side;
  }
  
  set side(double value){
    print('setting new value $value');
    if (value<0) throw 'Value must be >=0';
    
    _side = value;
  }
  
  double calculatedArea(){
    return _side + _side;
    
  }
  
}