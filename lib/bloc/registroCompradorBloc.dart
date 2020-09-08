import 'dart:async';
import 'package:registro/model/registro_comprador.dart';

class RegistroCompradorBloc {
    // RegistroComprador
  final _registroCompradorStreamController = StreamController<RegistroComprador>();
  Stream<RegistroComprador> get registroCompradorStream => _registroCompradorStreamController.stream;
  StreamSink<RegistroComprador> get registroCompradorSink => _registroCompradorStreamController.sink;

  // Variar aforo
  final _aumentarAforoActualSC = StreamController<RegistroComprador>();
  final _disminuirAforoActualSC = StreamController<RegistroComprador>();

  StreamSink<RegistroComprador> get aumentarAforoActual => _aumentarAforoActualSC.sink;
  StreamSink<RegistroComprador> get disminuirAforoActual => _disminuirAforoActualSC.sink;

  RegistroCompradorBloc() {
   // _registroCompradorStreamController.add(registroCompradorActual);

    _aumentarAforoActualSC.stream.listen(_aumentarAforoActual);
    _disminuirAforoActualSC.stream.listen(_disminuirAforoActual);
  }

  // Funciones
  _aumentarAforoActual(RegistroComprador merado) {
    //registroCompradorActual.aforoActual++;
    //registroCompradorSink.add(registroCompradorActual);
  }
  _disminuirAforoActual(RegistroComprador merado) {
    print("dism");
    // registroCompradorActual.aforoActual--;
    //registroCompradorSink.add(registroCompradorActual);
  }

  // dispose
  void dispose(){
    _registroCompradorStreamController.close();
    _aumentarAforoActualSC.close();
    _disminuirAforoActualSC.close();
  }
}
