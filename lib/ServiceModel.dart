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
  String title;

  Service({
    this.id,
    this.title,
  });

  factory Service.fromMap(Map<String, dynamic> json) => new Service(
    id: json["id"],
    title: json["title"],
  );

  Map<String, dynamic> toMap() => {
    "id": id,
    "title": title,
  };
}