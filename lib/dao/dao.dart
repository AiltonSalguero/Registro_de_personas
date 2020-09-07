import 'dart:async';

import 'package:registro/dao/registro_comprador_dao.dart';
import 'package:registro/dao/reniec_dao.dart';
import 'package:registro/dao/sesion.dart';
import 'package:registro/model/registro_comprador.dart';
import 'package:registro/model/reniec.dart';

class Dao {
  static void aumentarCantidadPersonas() {}
  static void disminuirCantidadPersonas() {}

  static Future<void> validarIngreso(String dni) async {
    int idMercado = 1;
    bool existe =
        await RegistroCompradorDao.existeRegistroComprador(dni, idMercado);
    if (existe) {
      print("existe");
      Sesion.compradorActual = await Dao.obtenerCompradorConDni(dni);
      Sesion.ultimaFechaMostrada = Sesion.compradorActual.fechaIngreso;
      if (_compradorEstaHabilitado()) {
        Sesion.numeroCompradoresActual++;
      }
    } else {
      print("no existe");
      Sesion.compradorActual = await Dao.obtenerCiudadanoConDni(dni);
      Sesion.numeroCompradoresActual++;
      Sesion.estadoComprador = "Habilitado";
      Dao.registrarCompradorActual();
      Sesion.compradorActual.fechaIngreso = DateTime.now();
    }
  }

  static bool _compradorEstaHabilitado() {
    var fechaActual = DateTime.now();
    var fechaNuevoIngreso = DateTime.parse(Sesion.compradorActual.fechaSalida)
        .add(Duration(hours: Sesion.mercadoColdDown));
    bool habilitado;
    print(fechaActual);
    print(fechaNuevoIngreso);
    if (fechaActual.isAfter(fechaNuevoIngreso)) {
      Sesion.estadoComprador = "Habilitado";
      print(Sesion.estadoComprador);
      habilitado = true;
    } else {
      Sesion.estadoComprador = "No habilitado";
      habilitado = false;
    }
    return habilitado;
  }

  static Future<RegistroComprador> obtenerCompradorConDni(String dni) async  {
    // devuelve los nombres, fecha ultima de ingreso
    return await RegistroCompradorDao.getCompradorByDni(dni);
  }

  static Future<RegistroComprador> obtenerCiudadanoConDni(
      String dniReniec) async {
    RegistroComprador compradorActual = RegistroComprador();
    Reniec comprador = await ReniecDao.getNombresByDni(dniReniec);
    compradorActual.dniComprador = Sesion.compradorActual.dniComprador;
    compradorActual.apellidos =
        "${comprador.data.split("|")[0]} ${comprador.data.split("|")[1]}";
    compradorActual.nombres = comprador.data.split("|")[2];
    print(compradorActual.nombres + " obtener cuidadano con dni");
    return compradorActual;
  }

  static Future<void> registrarCompradorActual() async {
    print(Sesion.compradorActual.nombres + "registrar comprador ");
    await RegistroCompradorDao.postComprador(Sesion.compradorActual);
    await RegistroCompradorDao.postRegistroComprador(
        Sesion.compradorActual, Sesion.idMercado);
  }

  static Future<bool> existeDni(String dni) async {
    bool existe;
    existe = await ReniecDao.validarDni(dni);
    print(existe.toString() +"boll 0");
    return existe;
  }
}
