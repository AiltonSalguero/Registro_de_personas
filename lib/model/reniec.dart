class Reniec {
  String data;
  bool success;
  String mensaje;

  Reniec.fromJson(Map<String, dynamic> json) {
    data = json['data'];
    success = json['success'];
    mensaje = json['mensaje'];
  }

  Map<String, dynamic> toJson() {
    final data = Map<String, dynamic>();
    data['data'] = this.data;
    data['success'] = this.success;
    data['mensaje'] = this.mensaje;
    return data;
  }
}

class ListaReniecs {
  List<Reniec> lista = List<Reniec>();

  ListaReniecs({this.lista});

  ListaReniecs.fromJson(List<dynamic> json) {
    if (json != null) {
      json.forEach((v) {
        lista.add(Reniec.fromJson(v));
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
