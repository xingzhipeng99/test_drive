import 'package:flutter/widgets.dart';
import 'package:json_annotation/json_annotation.dart';

part 'product.g.dart';

@JsonSerializable()
class Product with ChangeNotifier {
  int id;
  String title;
  String description;
  String category;
  double price;
  double rating;
  List<String> tags;
  String thumbnail;

  Product(
    this.id,
    this.title,
    this.description,
    this.category,
    this.price,
    this.rating,
    this.tags,
    this.thumbnail,
  );

  factory Product.fromJson(Map<String, dynamic> json) =>
      _$ProductFromJson(json);

  Map<String, dynamic> toJson() => _$ProductToJson(this);
}
