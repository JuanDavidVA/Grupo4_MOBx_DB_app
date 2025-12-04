import 'dart:convert';

class Links {
    String first;
    String previous;
    String next;
    String last;

    Links({
        required this.first,
        required this.previous,
        required this.next,
        required this.last,
    });

    factory Links.fromRawJson(String str) => Links.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Links.fromJson(Map<String, dynamic> json) => Links(
        first: json["first"],
        previous: json["previous"],
        next: json["next"],
        last: json["last"],
    );

    // Map<String, dynamic> toJson() => {
    //     "first": first,
    //     "previous": previous,
    //     "next": next,
    //     "last": last,
    // };
}
