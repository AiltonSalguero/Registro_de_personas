import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:registro/model/reniec.dart';

class ReniecDao {
  static String apiUrl =
      "https://aplicaciones007.jne.gob.pe/srop_publico/Consulta/api/AfiliadoApi/GetNombresCiudadano";
  static String apiKey =
      "Dmfiv1Unnsv8I9EoXEzbyQExSD8Q1UY7viyyf_347vRCfO-1xGFvDddaxDAlvm0cZ8XgAKTaWclVFnnsGgoy4aLlBGB5m-E8rGw_ymEcCig1:eq4At-H2zqgXPrPnoiDGFZH0Fdx5a-1UiyVaR4nQlCvYZzAhzmvWxLwkUk6-yORYrBBxEnoG5sm-Hkiyc91so6-nHHxIeLee5p700KE47Cw1";

  static Future<Reniec> getNombresByDni(String dniReniec) async {
    var response = await http.post(
      apiUrl,
      headers: {
        'Content-type': 'application/json',
        'Requestverificationtoken': apiKey,
      },
      body: jsonEncode({"CODDNI": dniReniec}),
    );
    Reniec persona = Reniec.fromJson(json.decode(response.body));
    return persona;
  }

  static Future<bool> validarDni(String dniReniec) async {
    var response = await http.post(
      apiUrl,
      headers: {
        'Content-type': 'application/json',
        'Requestverificationtoken': apiKey,
      },
      body: jsonEncode({"CODDNI": dniReniec}),
    );
    Reniec persona = Reniec.fromJson(json.decode(response.body));
    print(persona.success);
    return persona.success;
  }
}
