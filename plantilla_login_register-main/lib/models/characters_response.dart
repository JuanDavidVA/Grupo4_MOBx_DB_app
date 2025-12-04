import 'dart:convert';
import 'models.dart';

class GetCharacters {
    List<Character> items;
    Meta meta;
    Links links;

    GetCharacters({
        required this.items,
        required this.meta,
        required this.links,
    });

    factory GetCharacters.fromRawJson(String str) => GetCharacters.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory GetCharacters.fromJson(Map<String, dynamic> json) => GetCharacters(
        items: List<Character>.from(json["items"].map((x) => Character.fromJson(x))),
        meta: Meta.fromJson(json["meta"]),
        links: Links.fromJson(json["links"]),
    );

    // Map<String, dynamic> toJson() => {
    //     "items": List<dynamic>.from(items.map((x) => x.toJson())),
    //     "meta": meta.toJson(),
    //     "links": links.toJson(),
    // };
}
