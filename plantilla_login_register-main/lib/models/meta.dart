import 'dart:convert';

class Meta {
    int totalItems;
    int itemCount;
    int itemsPerPage;
    int totalPages;
    int currentPage;

    Meta({
        required this.totalItems,
        required this.itemCount,
        required this.itemsPerPage,
        required this.totalPages,
        required this.currentPage,
    });

    factory Meta.fromRawJson(String str) => Meta.fromJson(json.decode(str));

    //String toRawJson() => json.encode(toJson());

    factory Meta.fromJson(Map<String, dynamic> json) => Meta(
        totalItems: json["totalItems"],
        itemCount: json["itemCount"],
        itemsPerPage: json["itemsPerPage"],
        totalPages: json["totalPages"],
        currentPage: json["currentPage"],
    );

    // Map<String, dynamic> toJson() => {
    //     "totalItems": totalItems,
    //     "itemCount": itemCount,
    //     "itemsPerPage": itemsPerPage,
    //     "totalPages": totalPages,
    //     "currentPage": currentPage,
    // };
}
