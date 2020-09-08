import 'dart:async';
import 'package:registro/dao/sesion.dart';
import 'package:registro/model/mercado.dart';

class MercadoBloc {
  

  // Mercado
  final _mercadoStreamController = StreamController<Mercado>();
  Stream<Mercado> get mercadoStream => _mercadoStreamController.stream;
  StreamSink<Mercado> get mercadoSink => _mercadoStreamController.sink;

  // Variar aforo
  final _aumentarAforoActualSC = StreamController<Mercado>();
  final _disminuirAforoActualSC = StreamController<Mercado>();

  StreamSink<Mercado> get aumentarAforoActual => _aumentarAforoActualSC.sink;
  StreamSink<Mercado> get disminuirAforoActual => _disminuirAforoActualSC.sink;

  MercadoBloc() {
    _mercadoStreamController.add(Sesion.mercadoActual);

    _aumentarAforoActualSC.stream.listen(_aumentarAforoActual);
    _disminuirAforoActualSC.stream.listen(_disminuirAforoActual);
  }

  // Funciones
  _aumentarAforoActual(Mercado merado) {
    Sesion.mercadoActual.aforoActual++;
    mercadoSink.add(Sesion.mercadoActual);
  }
  _disminuirAforoActual(Mercado merado) {
    print("dism");
     Sesion.mercadoActual.aforoActual--;
    mercadoSink.add(Sesion.mercadoActual);
  }

  // dispose
  void dispose(){
    _mercadoStreamController.close();
    _aumentarAforoActualSC.close();
    _disminuirAforoActualSC.close();
  }
}
