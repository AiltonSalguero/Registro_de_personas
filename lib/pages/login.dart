import 'package:flutter/material.dart';
import 'package:registro/util/confirmAction.dart';
import 'package:registro/dialogs/error_dialog.dart';
import 'package:registro/util/screen.dart';
import 'package:registro/widgets/botonPersonalizado.dart';
import 'package:registro/widgets/inputPersonalizado.dart';
import 'package:registro/widgets/labelPerzonalizado.dart';
import 'package:registro/widgets/page_background.dart';

class LoginPage extends StatefulWidget {
  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final nickname = TextEditingController();
  final contrasenia = TextEditingController();
  void dispose() {
    //Limpia los controlodadores
    nickname.dispose();
    contrasenia.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PageBackground(
      header: Image.asset(
        "images/background.jpg",
        fit: BoxFit.cover,
        height: Screen.height * 0.35, // Responsive
        width: double.infinity,
      ),
      content: Padding(
        padding: const EdgeInsets.only(
          top: 32.0,
        ),
        child: SingleChildScrollView(
          scrollDirection: Axis.vertical,
          child: Column(
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              titulo1Label("Login"),
              inputPrincipal("Codigo", nickname),
              inputSecundario("Contraseña", contrasenia),
              _ingresarButton(),
            ],
          ),
        ),
      ),
    );
  }

  Widget _ingresarButton() {
    return botonPrincipal(_validarUsuario, "Ingresar");
  }

  _validarUsuario() {
    print("Validando");
    // si no hay datos que se ponga de color celeste turquesa
    if (nickname.text.isEmpty || contrasenia.text.isEmpty)
      return errorDialogAlert(
          context, "No hay datos", "Escriba el codigo y la contraseña.");
    if (nickname.text.isEmpty)
      return errorDialogAlert(context, "No hay datos", "Escriba un codigo");
    if (nickname.text.isEmpty)
      return errorDialogAlert(
          context, "No hay datos", "Escriba una contraseña");
    _logearUsuario();
    //UsuarioDao.existeUsuario(nickname.text, contrasenia.text, context)
    //    .then((existe) {
    //  if (existe) {
    //    _logearUsuario();
    //  } else {
    //    _abrirErrorLoginDialog(nickname.text);
    //  }
    //});
  }

  _abrirErrorLoginDialog(String nickname) async {
    final ConfirmAction action = await errorDialogAlert(
        context, "Usuario incorrecto", "Escribe bien los datos.");
  }

  _logearUsuario() {
    Navigator.of(context).pushReplacementNamed('/principal');
    //UsuarioDao.getUsuarioByNickname(nickname.text).then((user) {
    //  Sesion.usuarioLogeado = user;
    //  // ('/perfil/codUusario=1')
    //  Navigator.of(context).pushReplacementNamed('/perfil');
    //});
  }
}
