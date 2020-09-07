/*
  Clase donde se guardan los datos temporales traidos de la DB

  Por limpiar
*/

import 'package:registro/model/registro_comprador.dart';

class Sesion {

  // Comprador actual
  static int idMercado = 1;
  static RegistroComprador compradorActual = RegistroComprador();
  static String estadoComprador = "";
  static var ultimaFechaMostrada;
  static int numeroCompradoresActual = 0;
  static int mercadoAforo = 420;
  static int mercadoColdDown = 23;
}

