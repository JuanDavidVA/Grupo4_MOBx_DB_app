import 'dart:convert';

import 'models.dart';

class Character {
    int id;
    String name;
    String ki;
    String maxKi;
    String race;
    String gender;
    String description;
    String image;
    String affiliation;
    dynamic deletedAt;

    Character({
        required this.id,
        required this.name,
        required this.ki,
        required this.maxKi,
        required this.race,
        required this.gender,
        required this.description,
        required this.image,
        required this.affiliation,
        required this.deletedAt,
    });

    factory Character.fromRawJson(String str) => Character.fromJson(json.decode(str));

    String toRawJson() => json.encode(toJson());

    factory Character.fromJson(Map<String, dynamic> json) => Character(
        id: json["id"],
        name: json["name"],
        ki: json["ki"],
        maxKi: json["maxKi"],
        race: json["race"],
        gender: json["gender"]!,
        description: json["description"],
        image: json["image"],
        affiliation: json["affiliation"]!,
        deletedAt: json["deletedAt"],
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": name,
        "ki": ki,
        "maxKi": maxKi,
        "race": race,
        "gender": gender,
        "description": description,
        "image": image,
        "affiliation": affiliation,
        "deletedAt": deletedAt,
    };
}