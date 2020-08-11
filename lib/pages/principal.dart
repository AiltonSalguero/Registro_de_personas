/*


  Por limpiar dar mejores nombres a las vairable
*/

import 'package:flutter/material.dart';
import 'package:registro/dao/sesion.dart';
import 'package:registro/model/libro.dart';
import 'package:registro/util/screen.dart';
import 'package:registro/util/temaPersonlizado.dart';
import 'package:registro/util/utilFunctions.dart';
import 'package:registro/widgets/inputPersonalizado.dart';
import 'package:registro/widgets/labelPerzonalizado.dart';
import 'package:registro/widgets/botonPersonalizado.dart';

class PrincipalPage extends StatefulWidget {
  @override
  _PrincipalPageState createState() => _PrincipalPageState();
}

class _PrincipalPageState extends State<PrincipalPage> {
  final dniController = TextEditingController();
  @override
  void initState() {

  }


  @override
  Widget build(BuildContext context) {
    print("lista_libros");
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
          Align(
            alignment: Alignment(0, -0.9),
            //alignment: AlignmentDirectional.topCenter,
            child: titulo1Label(Sesion.usuarioLogeado.nickname),
          ),
          _buildAforo(Sesion.usuarioLogeado.level),
        
          botonTercero("Mi perfil", _irAmiPerfil),
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
                  titulo1Label("75369524"),
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
        onPressed: () =>{},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }

  Widget _buildAforo(int level) {
    return Align(
      alignment: Alignment(0, -0.79),
      child: Text(
        "Aforo \n 42 / 420",
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
        child: Row(children: <Widget>[
          Column(children: <Widget>[
            Text("Estado: "),
            Text("Habilitado"),
          ],),
          Column(children: <Widget>[
            Text("Ultima fecha de entrada: "),
            Text("8 de agosto, 1:40pm"),
          ],)
        ],)
      ),
    );
  }

  Widget _buildDniInput() {
    return Align(
      alignment: Alignment(0, -0.62),
      child: inputPrincipal("Ingrese DNI", dniController)

    );
  }

  _irAmiPerfil() {
    Navigator.of(context).pushReplacementNamed('/perfil');
  }
}