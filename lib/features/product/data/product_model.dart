// To parse this JSON data, do
//
//     final productModel = productModelFromJson(jsonString);

import 'dart:convert';

List<ProductModel> productModelFromJson(String str) => List<ProductModel>.from(json.decode(str).map((x) => ProductModel.fromJson(x)));

String productModelToJson(List<ProductModel> data) => json.encode(List<dynamic>.from(data.map((x) => x.toJson())));

class ProductModel {
    final int? id;
    final String? title;
    final int? price;
    final String? description;
    final List<String>? images;
    final DateTime? creationAt;
    final DateTime? updatedAt;
    final Category? category;

    ProductModel({
        this.id,
        this.title,
        this.price,
        this.description,
        this.images,
        this.creationAt,
        this.updatedAt,
        this.category,
    });

    ProductModel copyWith({
        int? id,
        String? title,
        int? price,
        String? description,
        List<String>? images,
        DateTime? creationAt,
        DateTime? updatedAt,
        Category? category,
    }) => 
        ProductModel(
            id: id ?? this.id,
            title: title ?? this.title,
            price: price ?? this.price,
            description: description ?? this.description,
            images: images ?? this.images,
            creationAt: creationAt ?? this.creationAt,
            updatedAt: updatedAt ?? this.updatedAt,
            category: category ?? this.category,
        );

    factory ProductModel.fromJson(Map<String, dynamic> json) => ProductModel(
        id: json["id"],
        title: json["title"],
        price: json["price"],
        description: json["description"],
        images: json["images"] == null ? [] : List<String>.from(json["images"]!.map((x) => x)),
        creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
        category: json["category"] == null ? null : Category.fromJson(json["category"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "title": title,
        "price": price,
        "description": description,
        "images": images == null ? [] : List<dynamic>.from(images!.map((x) => x)),
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
        "category": category?.toJson(),
    };
}

class Category {
    final int? id;
    final Name? name;
    final String? image;
    final DateTime? creationAt;
    final DateTime? updatedAt;

    Category({
        this.id,
        this.name,
        this.image,
        this.creationAt,
        this.updatedAt,
    });

    Category copyWith({
        int? id,
        Name? name,
        String? image,
        DateTime? creationAt,
        DateTime? updatedAt,
    }) => 
        Category(
            id: id ?? this.id,
            name: name ?? this.name,
            image: image ?? this.image,
            creationAt: creationAt ?? this.creationAt,
            updatedAt: updatedAt ?? this.updatedAt,
        );

    factory Category.fromJson(Map<String, dynamic> json) => Category(
        id: json["id"],
        name: nameValues.map[json["name"]]!,
        image: json["image"],
        creationAt: json["creationAt"] == null ? null : DateTime.parse(json["creationAt"]),
        updatedAt: json["updatedAt"] == null ? null : DateTime.parse(json["updatedAt"]),
    );

    Map<String, dynamic> toJson() => {
        "id": id,
        "name": nameValues.reverse[name],
        "image": image,
        "creationAt": creationAt?.toIso8601String(),
        "updatedAt": updatedAt?.toIso8601String(),
    };
}

enum Name {
    CLOTHES,
    ELECTRONICS,
    MISCELLANEOUS,
    SHOES
}

final nameValues = EnumValues({
    "Clothes": Name.CLOTHES,
    "Electronics": Name.ELECTRONICS,
    "Miscellaneous": Name.MISCELLANEOUS,
    "Shoes": Name.SHOES
});

class EnumValues<T> {
    Map<String, T> map;
    late Map<T, String> reverseMap;

    EnumValues(this.map);

    Map<T, String> get reverse {
            reverseMap = map.map((k, v) => MapEntry(v, k));
            return reverseMap;
    }
}
