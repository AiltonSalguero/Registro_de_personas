import 'package:flutter/material.dart';
import 'package:registro/pages/home.dart';
import 'package:registro/pages/login.dart';
import 'package:registro/pages/principal.dart';
import 'package:registro/pages/salidaPage.dart';

/*
  Clase principal, donde se inicia la aplicacion
*/
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Registro',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomePage(),
        '/login': (context) => LoginPage(),
        '/principal': (context) => PrincipalPage(),
        '/salida': (context) => SalidaPage(),
      },
      initialRoute: '/',
    );
  }
}
