/*
   Un libro solo le pertenece a un usuario
   
   Por limpiar
*/
class Comprador {
  String dni;
  String nombres;
  String apellidos;
  var fechaIngreso;
  var fechaSalida;

  Comprador(this.dni, this.nombres, this.apellidos) {
    this.fechaIngreso = DateTime.parse("2020-05-20 13:18:04Z");  
    this.fechaSalida = DateTime.parse("2020-05-20 13:30:06Z");  
  }

  Comprador.fromJson(Map<String, dynamic> json) {
    dni = json['dni'];
    nombres = json['nombres'];
    apellidos = json['apellidos'];
    fechaIngreso = json['fechaIngreso'];
    fechaSalida = json['fechaSalida'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['dni'] = this.dni;
    data['nombres'] = this.nombres;
    data['apellidos'] = this.apellidos;
    data['fechaIngreso'] = this.fechaIngreso;
    data['fechaSalida'] = this.fechaSalida;
    return data;
  }
}

class ListaCompradores {
  List<Comprador> lista = List<Comprador>();

  ListaCompradores({this.lista});

  ListaCompradores.fromJson(List<dynamic> json) {
    if (json != null) {
      json.forEach((v) {
        lista.add(Comprador.fromJson(v));
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
