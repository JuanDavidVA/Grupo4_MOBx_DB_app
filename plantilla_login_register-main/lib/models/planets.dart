import 'dart:convert';

class Planets {
    int id;
    String name;
    bool isDestroyed;
    String description;
    String image;
    dynamic deletedAt;

    Planets({
        required this.id,
        required this.name,
        required this.isDestroyed,
        required this.description,
        required this.image,
        required this.deletedAt,
    });

    factory Planets.fromRawJson(String str) => Planets.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Planets.fromJson(Map<String, dynamic> json) => Planets(
        id: json["id"],
        name: json["name"],
        isDestroyed: json["isDestroyed"],
        description: json["description"],
        image: json["image"],
        deletedAt: json["deletedAt"],
    );

    // Map<String, dynamic> toJson() => {
    //     "id": id,
    //     "name": name,
    //     "isDestroyed": isDestroyed,
    //     "description": description,
    //     "image": image,
    //     "deletedAt": deletedAt,
    // };
}
