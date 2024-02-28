
import 'package:json_annotation/json_annotation.dart';
part 'product_list_response.g.dart';

@JsonSerializable()
class ProductListResponse {
  List<Products>? products;
  int? total;
  int? skip;
  int? limit;

  ProductListResponse({this.products, this.total, this.skip, this.limit});
  factory ProductListResponse.fromJson(Map<String, dynamic> json) => _$ProductListResponseFromJson(json);
  Map<String, dynamic> toJson() => _$ProductListResponseToJson(this);

}

@JsonSerializable()
class Products {
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

  Products(
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

  factory Products.fromJson(Map<String, dynamic> json) => _$ProductsFromJson(json);
  Map<String, dynamic> toJson() => _$ProductsToJson(this);

}