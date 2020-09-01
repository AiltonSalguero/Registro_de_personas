import 'package:registro/dao/dao_http.dart';
import 'package:registro/model/registro_comprador.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';

class RegistroCompradorDao {
  static String apiUrl = DotEnv().env['API_URL'];
  static Future<RegistroComprador> getCompradorByDni(String dni) async {
    var data = await DaoHttp.jsonDecodedHttpGet("${RegistroCompradorDao.apiUrl}/comprador?dniComprador=$dni");
    print(data);
    return ListaRegistroComprador.fromJson(data).lista[0];
  }

  static Future<void> postComprador(RegistroComprador comprador) async {
    DaoHttp.httpPost("${RegistroCompradorDao.apiUrl}/comprador", comprador);
  }

  static Future<void> postRegistroComprador(RegistroComprador comprador, int idMercado) async {
    DaoHttp.httpPost("${RegistroCompradorDao.apiUrl}/comprador?idMercado=$idMercado", comprador);
  }

  static Future<bool> existeRegistroComprador(String dni, int idMercado) async{
    var data = await DaoHttp.jsonDecodedHttpGet("${RegistroCompradorDao.apiUrl}/comprador?dniComprador=$dni&idMercado=$idMercado");
    bool existe;
    ListaRegistroComprador.fromJson(data).lista.isEmpty? existe = false:existe = true;
    return existe;
  }
}
