/*
  Clase donde se guardan los datos temporales traidos de la DB

  Por limpiar
*/

import 'package:registro/model/mercado.dart';
import 'package:registro/model/registro_comprador.dart';

class Sesion {

  // Comprador actual
  static RegistroComprador compradorActual = RegistroComprador();
  static String estadoComprador = "";
  static var ultimaFechaMostrada;
  static int mercadoColdDown = 1;
  static Mercado mercadoActual = Mercado(1, "Santa Anita", "Santa Anita", 1200, 2);
}
