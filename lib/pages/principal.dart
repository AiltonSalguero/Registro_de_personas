/*


  Por limpiar dar mejores nombres a las vairable
*/

import 'package:flutter/material.dart';
import 'package:registro/dao/dao.dart';
import 'package:registro/dao/sesion.dart';
import 'package:registro/dialogs/error_dialog.dart';
import 'package:registro/util/screen.dart';
import 'package:registro/util/temaPersonlizado.dart';
import 'package:registro/widgets/inputPersonalizado.dart';
import 'package:registro/widgets/labelPerzonalizado.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final dniController = TextEditingController();

  Widget _buildAforo() {
    return Align(
      alignment: Alignment(0, -0.79),
      child: Text(
        "Aforo \n ${Sesion.numeroCompradoresActual} / ${Sesion.mercadoAforo}",
        style: TextStyle(
          fontSize: 14,
        ),
      ),
    );
  }

  Widget _buildEstadoPersona() {
    return Padding(
      padding: EdgeInsets.symmetric(
        horizontal: 8.0,
      ),
      child: Container(
        height: Screen.height * 0.55,
        width: Screen.width * 0.90, // responsive
        decoration: BoxDecoration(
          borderRadius: BorderRadius.all(
            Radius.circular(16.0),
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Estado: "),
                Text(Sesion.estadoComprador),
              ],
            ),
            Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                Text("Ultima fecha de entrada: "),
                Sesion.ultimaFechaMostrada == null ? Text("") : Text(Sesion.ultimaFechaMostrada.toString()),
              ],
            )
          ],
        ),
      ),
    );
  }

  Widget _buildDniInput() {
    return Align(
        alignment: Alignment(0, -0.62),
        child:
            inputPrincipalNumber("Ingrese DNI", dniController, mostrarEstado));
  }

  mostrarEstado(BuildContext context) {
    String dni = dniController.text;
    if (dni.length != 8) {
      errorDialogAlert(context, "Error", "Ingrese un dni valido.");
    }
    if (dni == "") {
      errorDialogAlert(context, "No data", "Escriba un dni.");
    } else {
      if (Dao.existeDni(dni)) {

        print("$dni dni");
        print("${Sesion.numeroCompradoresActual} a0");
        Sesion.compradorActual.dniComprador = dni;
        Dao.validarIngreso(dni);

        setState(() {
          print("${Sesion.numeroCompradoresActual} a");
          print("${Sesion.compradorActual.nombres} as");
          print("${Sesion.numeroCompradoresActual} b");
        });
      } else {
        errorDialogAlert(context, "Error", "Ingrese un dni valido.");
      }
    }
  }

 

  @override
  Widget build(BuildContext context) {
    print("principal");
    return Scaffold(
      resizeToAvoidBottomPadding: false,
      body: Stack(
        fit: StackFit.passthrough,
        children: <Widget>[
          Image.asset(
            "images/background.jpg",
            fit: BoxFit.cover,
            height: Screen.height * 0.35, // Responsive
            width: double.infinity,
          ),
          _buildAforo(),
          _buildDniInput(),
          Container(
            height: double.infinity,
            width: double.infinity,
            decoration: BoxDecoration(
              borderRadius: BorderRadius.only(
                topRight: Radius.circular(32.0),
                topLeft: Radius.circular(32.0),
              ),
              border: Border.all(
                color: Colors.black,
              ),
              boxShadow: [
                BoxShadow(
                  color: Colors.grey,
                  blurRadius: 32.0,
                ),
              ],
              color: Color(0xfffafafa),
            ),
            margin: EdgeInsets.only(
              top: Screen.height * 0.3, // Responsive 266
            ),
            child: Padding(
              padding: EdgeInsets.only(
                top: 16.0,
              ),
              child: Column(
                children: <Widget>[
                  titulo1Label(Sesion.compradorActual.dniComprador),
                  Text(Sesion.compradorActual.nombres),
                  _buildEstadoPersona(),
                ],
              ),
            ),
          ),
        ],
      ),
      floatingActionButton:
          //usuarioPerfil.codUsuario == ApiDao.usuarioLogeado.codUsuario?
          FloatingActionButton(
        shape: CircleBorder(
          side: BorderSide(
            color: Colors.black,
          ),
        ),
        backgroundColor: ColoresTkv.cyan,
        child: Icon(
          Icons.refresh,
        ),
        onPressed: () => mostrarEstado(context),
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
