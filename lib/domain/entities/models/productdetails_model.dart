// To parse this JSON data, do
//
//     final productdetailsModel = productdetailsModelFromJson(jsonString);

import 'package:meta/meta.dart';
import 'dart:convert';

ProductdetailsModel productdetailsModelFromJson(String str) => ProductdetailsModel.fromJson(json.decode(str));

String productdetailsModelToJson(ProductdetailsModel data) => json.encode(data.toJson());

class ProductdetailsModel {
  ProductdetailsModel({
    required this.id,
    required this.title,
    required this.price,
    required this.description,
    required this.category,
    required this.image,
    required this.rating,
  });

  final int id;
  final String title;
  final double price;
  final String description;
  final String category;
  final String image;
  final Rating rating;

  factory ProductdetailsModel.fromJson(Map<String, dynamic> json) => ProductdetailsModel(
    id: json["id"],
    title: json["title"],
    price: json["price"].toDouble(),
    description: json["description"],
    category: json["category"],
    image: json["image"],
    rating: Rating.fromJson(json["rating"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "title": title,
    "price": price,
    "description": description,
    "category": category,
    "image": image,
    "rating": rating.toJson(),
  };
}

class Rating {
  Rating({
    required this.rate,
    required this.count,
  });

  final double? rate;
  final int? count;

  factory Rating.fromJson(Map<String, dynamic> json) => Rating(
    rate: json["rate"].toDouble(),
    count: json["count"],
  );

  Map<String, dynamic> toJson() => {
    "rate": rate,
    "count": count,
  };
}
