import 'dart:convert';

Service serviceFromJson(String str) {
  final jsonData = json.decode(str);
  return Service.fromMap(jsonData);
}

String serviceToJson(Service data) {
  final dyn = data.toMap();
  return json.encode(dyn);
}

class Service {
  int id;
  String name;

  Service({
    this.id,
    this.name,
  });

  factory Service.fromMap(Map<String, dynamic> json) => new Service(
    id: json["id"],
    name: json["first_name"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "name": name,
  };
}