
import 'package:json_annotation/json_annotation.dart';
part 'category_listing_response.g.dart';

@JsonSerializable()

class CategoryListingResponse {
  List<CategoryProducts>? products;
  int? total;
  int? skip;
  int? limit;

  CategoryListingResponse({this.products, this.total, this.skip, this.limit});

  factory CategoryListingResponse.fromJson(Map<String, dynamic> json) => _$CategoryListingResponseFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryListingResponseToJson(this);
}

@JsonSerializable()

class CategoryProducts {
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

  CategoryProducts(
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

  factory CategoryProducts.fromJson(Map<String, dynamic> json) => _$CategoryProductsFromJson(json);
  Map<String, dynamic> toJson() => _$CategoryProductsToJson(this);

}