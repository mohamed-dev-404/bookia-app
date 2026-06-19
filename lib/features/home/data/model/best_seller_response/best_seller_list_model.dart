import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/features/home/data/model/best_seller_response/best_seller_model.dart';

class BestSellerListModel {
  List<BestSellerModel>? products;

  BestSellerListModel({this.products});

  factory BestSellerListModel.fromJson(Map<String, dynamic> json) {
    return BestSellerListModel(
      products: (json[ApiKeys.products] as List<dynamic>?)
          ?.map((item) => BestSellerModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.products: products?.map((item) => item.toJson()).toList(),
      };
}
