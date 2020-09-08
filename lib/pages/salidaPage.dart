import 'package:flutter/material.dart';
import 'package:registro/bloc/mercadoAforoBloc.dart';
import 'package:registro/dao/sesion.dart';
import 'package:registro/model/mercado.dart';
import 'package:registro/util/screen.dart';
import 'package:registro/util/temaPersonlizado.dart';
import 'package:registro/widgets/labelPerzonalizado.dart';

class SalidaPage extends StatefulWidget {
  @override
  _SalidaPageState createState() => _SalidaPageState();
}

class _SalidaPageState extends State<SalidaPage> {
  final MercadoBloc _mercadoBloc = MercadoBloc();

  @override
  void dispose() {
    super.dispose();
    _mercadoBloc.dispose();
  }

  @override
  Widget build(BuildContext context) {
    print("salida");
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
            alignment: Alignment(0, -0.79),
            child: StreamBuilder(
              stream: _mercadoBloc.mercadoStream,
              builder: (BuildContext context, AsyncSnapshot<Mercado> snapshot) {
                return Container(
                    child: Text(
                  "Aforo \n ${snapshot.data.aforoActual} / ${snapshot.data.aforo}",
                  style: TextStyle(
                    fontSize: 14,
                  ),
                ));
              },
            ),
          ),
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
        onPressed: () =>
            {_mercadoBloc.disminuirAforoActual.add(Sesion.mercadoActual)},
      ),
      floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
    );
  }
}
