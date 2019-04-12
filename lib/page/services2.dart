class Services2 {
  List<Services> services;

  Services2({this.services});

  fromJson(Map<String, dynamic> json) {
    if (json['services'] != null) {
      services = new List<Services>();
      json['services'].forEach((v) {
        services.add(new Services.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.services != null) {
      data['services'] = this.services.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Services {
  String title;
  List<Elements> elements;

  Services({this.title, this.elements});

  Services.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['elements'] != null) {
      elements = new List<Elements>();
      json['elements'].forEach((v) {
        elements.add(new Elements.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.elements != null) {
      data['elements'] = this.elements.map((v) => v.toJson()).toList();
    }
    return data;
  }
}

class Elements {
  String section;
  String type;
  List<String> value;
  String mandatory;

  Elements({this.section, this.type, this.value, this.mandatory});

  Elements.fromJson(Map<String, dynamic> json) {
    section = json['section'];
    type = json['type'];
    value = json['value'].cast<String>();
    mandatory = json['mandatory'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['section'] = this.section;
    data['type'] = this.type;
    data['value'] = this.value;
    data['mandatory'] = this.mandatory;
    return data;
  }
}
