/*
  Clase donde se guardan los datos temporales traidos de la DB

  Por limpiar
*/

import 'package:registro/model/comprador.dart';
import 'package:registro/model/libro.dart';
import 'package:registro/model/usuario.dart';

class Sesion {
  // con sqflutter se puede mantener la sesion iniciada

  // Usuario
  static Usuario usuarioLogeado = Usuario("", "", "", "");
  static bool vieneDeRegistro = false;
  static ListaLibros librosDelUsuario = ListaLibros();

  static Libro libroLeyendoPorUsuario = Libro("", "", 0, 0);

  // Dialog
  static Libro libroAgregado = Libro("", "", 0, 0);

  // General
  static ListaLibros librosLeyendoseTotales = ListaLibros();

  // Otros perfiles
  static Usuario usuarioSeleccionado = Usuario("", "", "", "");
  static ListaLibros librosDelUsuarioSeleccionado = ListaLibros();

  // que se guarden los datos en estas variables estaticas?




  // Comprador actual
  static Comprador compradorActual = Comprador("Dni", "Nombres", "Apellidos");
  static String estadoComprador = "";
  static var ultimaFechaMostrada;

}
