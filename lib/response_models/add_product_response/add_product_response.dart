
import 'package:json_annotation/json_annotation.dart';
part 'add_product_response.g.dart';

@JsonSerializable()
class AddProductResponse {
  int? id;
  String? title;
  dynamic price;
  dynamic stock;
  dynamic rating;
  String? description;
  String? brand;
  String? category;

  AddProductResponse(
      {this.id,
        this.title,
        this.price,
        this.stock,
        this.rating,
        this.description,
        this.brand,
        this.category});

  factory AddProductResponse.fromJson(Map<String, dynamic> json) => _$AddProductResponseFromJson(json);
  Map<String, dynamic> toJson() => _$AddProductResponseToJson(this);
}