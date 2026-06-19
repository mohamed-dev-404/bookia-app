import 'package:bookia/core/constants/api_keys.dart';

class BestSellerModel {
  int? id;
  String? name;
  String? description;
  String? price;
  int? discount;
  double? priceAfterDiscount;
  int? stock;
  int? bestSeller;
  String? image;
  String? category;

  BestSellerModel({
    this.id,
    this.name,
    this.description,
    this.price,
    this.discount,
    this.priceAfterDiscount,
    this.stock,
    this.bestSeller,
    this.image,
    this.category,
  });

  factory BestSellerModel.fromJson(Map<String, dynamic> json) => BestSellerModel(
        id: json[ApiKeys.id] as int?,
        name: json[ApiKeys.name] as String?,
        description: json[ApiKeys.description] as String?,
        price: json[ApiKeys.price] as String?,
        discount: json[ApiKeys.discount] as int?,
        priceAfterDiscount: json[ApiKeys.priceAfterDiscount] == null
            ? null
            : (json[ApiKeys.priceAfterDiscount] as num?)?.toDouble(),
        stock: json[ApiKeys.stock] as int?,
        bestSeller: json[ApiKeys.bestSeller] as int?,
        image: json[ApiKeys.image] as String?,
        category: json[ApiKeys.category] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKeys.id: id,
        ApiKeys.name: name,
        ApiKeys.description: description,
        ApiKeys.price: price,
        ApiKeys.discount: discount,
        ApiKeys.priceAfterDiscount: priceAfterDiscount,
        ApiKeys.stock: stock,
        ApiKeys.bestSeller: bestSeller,
        ApiKeys.image: image,
        ApiKeys.category: category,
      };
}
