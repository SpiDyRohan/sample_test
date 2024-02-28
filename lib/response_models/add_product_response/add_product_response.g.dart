// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'add_product_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

AddProductResponse _$AddProductResponseFromJson(Map<String, dynamic> json) =>
    AddProductResponse(
      id: json['id'] as int?,
      title: json['title'] as String?,
      price: json['price'],
      stock: json['stock'],
      rating: json['rating'],
      description: json['description'] as String?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
    );

Map<String, dynamic> _$AddProductResponseToJson(AddProductResponse instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'price': instance.price,
      'stock': instance.stock,
      'rating': instance.rating,
      'description': instance.description,
      'brand': instance.brand,
      'category': instance.category,
    };
