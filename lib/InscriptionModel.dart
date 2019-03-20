import 'dart:convert';

Inscription serviceFromJson(String str) {
  final jsonData = json.decode(str);
  return Inscription.fromMap(jsonData);
}

String serviceToJson(Inscription data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Inscription {
  int id;
  String data;
  int idService;

  Inscription({
    this.id,
    this.data,
    this.idService
  });

  factory Inscription.fromMap(Map<String, dynamic> json) => new Inscription(
    id: json["id"],
    data: json["data"],
    idService: json['idService'],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "data": data,
    "idService": idService,
  };
}