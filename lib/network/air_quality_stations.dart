class AirQualityStations {
  int id;
  String stationName;
  String gegrLat;
  String gegrLon;
  City city;
  String addressStreet;

  AirQualityStations(
      {this.id,
      this.stationName,
      this.gegrLat,
      this.gegrLon,
      this.city,
      this.addressStreet});

  AirQualityStations.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    stationName = json['stationName'];
    gegrLat = json['gegrLat'];
    gegrLon = json['gegrLon'];
    city = json['city'] != null ? new City.fromJson(json['city']) : null;
    addressStreet = json['addressStreet'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['stationName'] = this.stationName;
    data['gegrLat'] = this.gegrLat;
    data['gegrLon'] = this.gegrLon;
    if (this.city != null) {
      data['city'] = this.city.toJson();
    }
    data['addressStreet'] = this.addressStreet;
    return data;
  }
}

class City {
  int id;
  String name;
  Commune commune;

  City({this.id, this.name, this.commune});

  City.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    commune =
        json['commune'] != null ? new Commune.fromJson(json['commune']) : null;
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    if (this.commune != null) {
      data['commune'] = this.commune.toJson();
    }
    return data;
  }
}

class Commune {
  String communeName;
  String districtName;
  String provinceName;

  Commune({this.communeName, this.districtName, this.provinceName});

  Commune.fromJson(Map<String, dynamic> json) {
    communeName = json['communeName'];
    districtName = json['districtName'];
    provinceName = json['provinceName'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['communeName'] = this.communeName;
    data['districtName'] = this.districtName;
    data['provinceName'] = this.provinceName;
    return data;
  }
}
