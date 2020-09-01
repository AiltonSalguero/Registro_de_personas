import 'dart:convert';
import 'package:http/http.dart' as http;

/*
  Clase que maneja las peticiones generales
*/
class DaoHttp {
  static jsonDecodedHttpGet(String apiUrl) async {
    var response = await http.get(
      apiUrl,
      headers: {
        'Content-type': 'application/json',
        //'x-api-key': apiKey,
      },
    );
    return json.decode(response.body);
  }

  static httpPost(String apiUrl, var objeto) {
    http.post(
      apiUrl,
      body: jsonEncode(objeto.toJson(), toEncodable: _myEncode),
      headers: {
        'Content-type': 'application/json',
        //'x-api-key': apiKey,
        'Accept': 'application/json'
      },
    );
  }

  static dynamic _myEncode(dynamic item) {
    if (item is DateTime) {
      return item.toIso8601String();
    }
    return item;
  }

  static httpPut(String apiUrl) {
    http.put(
      apiUrl,
      headers: {
        'Content-type': 'application/json',
        //'x-api-key': apiKey,
        'Accept': 'application/json'
      },
    );
  }

  static httpDelete(String apiUrl) {
    http.delete(
      apiUrl,
      headers: {
        'Content-type': 'application/json',
        //'x-api-key': apiKey,
      },
    );
  }
}
