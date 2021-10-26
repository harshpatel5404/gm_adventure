// To parse this JSON data, do
//
//     final topGame = topGameFromMap(jsonString);

import 'dart:convert';

class TopGame {
  TopGame({
    required this.status,
    required this.message,
    required this.data,
  });

  final bool status;
  final String message;
  final List<Datum> data;

  factory TopGame.fromJson(String str) => TopGame.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory TopGame.fromMap(Map<String, dynamic> json) => TopGame(
        status: json["status"],
        message: json["message"],
        data: List<Datum>.from(json["data"].map((x) => Datum.fromMap(x))),
      );

  Map<String, dynamic> toMap() => {
        "status": status,
        "message": message,
        "data": List<dynamic>.from(data.map((x) => x.toMap())),
      };
}

class Datum {
  Datum({
    required this.id,
    required this.name,
    required this.catId,
    required this.catName,
    required this.rating,
    required this.description,
    required this.website,
    required this.image,
    required this.icon,
    required this.top,
  });

  final int id;
  final String name;
  final String catId;
  final String catName;
  final String rating;
  final String description;
  final String website;
  final String image;
  final String icon;
  final bool top;

  factory Datum.fromJson(String str) => Datum.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Datum.fromMap(Map<String, dynamic> json) => Datum(
        id: json["id"],
        name: json["name"],
        catId: json["cat_id"],
        catName: json["cat_name"],
        rating: json["rating"],
        description: json["description"],
        website: json["website"],
        image: json["image"],
        icon: json["icon"],
        top: json["top"],
      );

  Map<String, dynamic> toMap() => {
        "id": id,
        "name": name,
        "cat_id": catId,
        "cat_name": catName,
        "rating": rating,
        "description": description,
        "website": website,
        "image": image,
        "icon": icon,
        "top": top,
      };
}
