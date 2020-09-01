/*
   Un libro solo le pertenece a un usuario
   
   Por limpiar
*/
class RegistroComprador {
  int idMercado;
  String dniComprador;
  String nombres;
  String apellidos;
  var fechaIngreso;
  var fechaSalida;

  RegistroComprador() {
    this.dniComprador = "";
    this.nombres = "";
    this.apellidos = "";
  }

  RegistroComprador.fromJson(Map<String, dynamic> json) {
    idMercado = json["idMercado"];
    dniComprador = json['dniComprador'];
    nombres = json['nombres'];
    apellidos = json['apellidos'];
    fechaIngreso = json['fechaIngreso'];
    fechaSalida = json['fechaSalida'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data["idMercado"] = this.idMercado;
    data['dniComprador'] = this.dniComprador;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['fechaIngreso'] = this.fechaIngreso;
    data['fechaSalida'] = this.fechaSalida;
    return data;
  }
}

class ListaRegistroComprador {
  List<RegistroComprador> lista = List<RegistroComprador>();

  ListaRegistroComprador({this.lista});

  ListaRegistroComprador.fromJson(List<dynamic> json) {
    if (json != null) {
      json.forEach((v) {
        lista.add(RegistroComprador.fromJson(v));
      });
    }
  }

  List<dynamic> toJson() {
    List<dynamic> data = List<dynamic>();
    if (this.lista.isNotEmpty) {
      data = this.lista.map((v) => v.toJson()).toList();
    }
    return data;
  }
}
