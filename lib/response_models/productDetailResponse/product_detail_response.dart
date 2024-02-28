

import 'package:json_annotation/json_annotation.dart';
part 'product_detail_response.g.dart';

@JsonSerializable()
class ProductDetailResponse {
  int? id;
  String? title;
  String? description;
  int? price;
  double? discountPercentage;
  double? rating;
  int? stock;
  String? brand;
  String? category;
  String? thumbnail;
  List<String>? images;

  ProductDetailResponse(
      {this.id,
        this.title,
        this.description,
        this.price,
        this.discountPercentage,
        this.rating,
        this.stock,
        this.brand,
        this.category,
        this.thumbnail,
        this.images});

  factory ProductDetailResponse.fromJson(Map<String, dynamic> json) => _$ProductDetailResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductDetailResponseToJson(this);
}