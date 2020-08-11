import 'package:registro/model/comprador.dart';

class Dao{

  aumentarCantidadPersonas(){}
  disminuirCantidadPersonas(){}

  static Comprador obtenerCompradorConDni(String dni){
    // devuelve los nombres, fecha ultima de ingreso
    Comprador rocha = Comprador(dni,"Eward Giuseppe", "Rocha Espinoza");
     rocha.fechaIngreso = DateTime.parse("2020-06-20 13:18:04");  
    rocha.fechaSalida = DateTime.parse("2020-06-20 13:30:06");  
    return rocha;
  }
}