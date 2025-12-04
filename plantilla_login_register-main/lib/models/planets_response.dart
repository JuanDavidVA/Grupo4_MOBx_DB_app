import 'package:plantilla_login_register/models/models.dart';
import 'dart:convert';

class GetPlanets {
    List<Planets> items;
    Meta meta;
    Links links;

    GetPlanets({
        required this.items,
        required this.meta,
        required this.links,
    });

    factory GetPlanets.fromRawJson(String str) => GetPlanets.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory GetPlanets.fromJson(Map<String, dynamic> json) => GetPlanets(
        items: List<Planets>.from(json["items"].map((x) => Planets.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        links: Links.fromJson(json["links"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    //     "meta": meta.toJson(),
    //     "links": links.toJson(),
    // };
}
