// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'category_listing_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

CategoryListingResponse _$CategoryListingResponseFromJson(
        Map<String, dynamic> json) =>
    CategoryListingResponse(
      products: (json['products'] as List<dynamic>?)
          ?.map((e) => CategoryProducts.fromJson(e as Map<String, dynamic>))
          .toList(),
      total: json['total'] as int?,
      skip: json['skip'] as int?,
      limit: json['limit'] as int?,
    );

Map<String, dynamic> _$CategoryListingResponseToJson(
        CategoryListingResponse instance) =>
    <String, dynamic>{
      'products': instance.products,
      'total': instance.total,
      'skip': instance.skip,
      'limit': instance.limit,
    };

CategoryProducts _$CategoryProductsFromJson(Map<String, dynamic> json) =>
    CategoryProducts(
      id: json['id'] as int?,
      title: json['title'] as String?,
      description: json['description'] as String?,
      price: json['price'] as int?,
      discountPercentage: (json['discountPercentage'] as num?)?.toDouble(),
      rating: (json['rating'] as num?)?.toDouble(),
      stock: json['stock'] as int?,
      brand: json['brand'] as String?,
      category: json['category'] as String?,
      thumbnail: json['thumbnail'] as String?,
      images:
          (json['images'] as List<dynamic>?)?.map((e) => e as String).toList(),
    );

Map<String, dynamic> _$CategoryProductsToJson(CategoryProducts instance) =>
    <String, dynamic>{
      'id': instance.id,
      'title': instance.title,
      'description': instance.description,
      'price': instance.price,
      'discountPercentage': instance.discountPercentage,
      'rating': instance.rating,
      'stock': instance.stock,
      'brand': instance.brand,
      'category': instance.category,
      'thumbnail': instance.thumbnail,
      'images': instance.images,
    };
