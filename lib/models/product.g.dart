// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'product.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

Product _$ProductFromJson(Map<String, dynamic> json) => Product(
      (json['id'] as num).toInt(),
      json['title'] as String,
      json['description'] as String,
      json['category'] as String,
      (json['price'] as num).toDouble(),
      (json['rating'] as num).toDouble(),
      (json['tags'] as List<dynamic>).map((e) => e as String).toList(),
      json['thumbnail'] as String,
    );

Map<String, dynamic> _$ProductToJson(Product instance) => <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'category': instance.category,
      'price': instance.price,
      'rating': instance.rating,
      'tags': instance.tags,
      'thumbnail': instance.thumbnail,
    };
