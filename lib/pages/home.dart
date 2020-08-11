import 'package:flutter/material.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:registro/dao/sesion.dart';
import 'package:registro/util/screen.dart';
import 'package:registro/widgets/botonPersonalizado.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Future main() async {
    DotEnv().load('config.env');
    Screen.width = MediaQuery.of(context).size.width;
    Screen.height = MediaQuery.of(context).size.height;
  }

  @override
  Widget build(BuildContext context) {
    print("home");

    main();
    return Container(
      decoration: BoxDecoration(
        image: DecorationImage(
          image: AssetImage("images/background_home.jpg"),
          fit: BoxFit.cover,
        ),
      ),
      child: Scaffold(
        backgroundColor: Colors.transparent,
        appBar: AppBar(
          backgroundColor: Colors.transparent,
          elevation: 0.0,
        ),
        body: Container(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.spaceAround,
            mainAxisSize: MainAxisSize.min,
            //crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              SizedBox(
                height: Screen.height * 0.05,
              ),
              _loginButton(),
              _registroButton(),
              Text(
                "#MantengaSuDistancia",
                style: TextStyle(
                  fontSize: 18.0,
                  color: Colors.white,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _loginButton() {
    return botonPrincipal(_loginButtonAccion, "Login");
  }

  _loginButtonAccion() {
    Navigator.of(context).pushNamed('/login');
  }

  Widget _registroButton() {
    return botonSecundario(_registerButtonAccion, "Registro");
  }

  _registerButtonAccion() {
    Navigator.of(context).pushNamed('/registro');
  }
}
