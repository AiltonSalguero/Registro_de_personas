import 'package:registro/dao/registro_comprador_dao.dart';
import 'package:registro/dao/reniec_dao.dart';
import 'package:registro/dao/sesion.dart';

class Dao {
  static void aumentarCantidadPersonas() {}
  static void disminuirCantidadPersonas() {}

  static void validarIngreso(String dni) {
    int idMercado = 1;
    RegistroCompradorDao.existeRegistroComprador(dni, idMercado).then((existe) {
      if (existe) {
        print("existe");
        Dao.obtenerCompradorConDni(dni);
        Sesion.ultimaFechaMostrada = Sesion.compradorActual.fechaIngreso;
        if (_compradorEstaHabilitado()) {
          Sesion.numeroCompradoresActual++;
        }
      } else {
        print("no existe");
        Dao.obtenerCiudadanoConDni(dni);
        Dao.registrarCompradorActual();
      }
    });
  }

  static bool _compradorEstaHabilitado() {
    var fechaActual = DateTime.now();
    var fechaNuevoIngreso = DateTime.parse(Sesion.compradorActual.fechaSalida)
        .add(Duration(hours: Sesion.mercadoColdDown));
    bool habilitado;
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

  static void obtenerCompradorConDni(String dni) {
    // devuelve los nombres, fecha ultima de ingreso
    RegistroCompradorDao.getCompradorByDni(dni)
        .then((comprador) => Sesion.compradorActual = comprador);
  }

  static void obtenerCiudadanoConDni(String dniReniec) {
    ReniecDao.getNombresByDni(dniReniec).then((comprador) {
      Sesion.compradorActual.apellidos =
          "${comprador.data.split("|")[0]} ${comprador.data.split("|")[1]}";
      Sesion.compradorActual.nombres = comprador.data.split("|")[2];
    });
  }

  static registrarCompradorActual() {
    RegistroCompradorDao.postComprador(Sesion.compradorActual);
    RegistroCompradorDao.postRegistroComprador(
        Sesion.compradorActual, Sesion.idMercado);
  }

  static bool existeDni(String dni) {
    bool existe = true;
    ReniecDao.validarDni(dni).then((exists) => existe = exists);
    return existe;
  }
}
