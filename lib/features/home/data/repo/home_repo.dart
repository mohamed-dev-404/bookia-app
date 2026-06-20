import 'package:bookia/features/home/data/model/best_seller_response/best_seller_list_model.dart';
import 'package:bookia/features/home/data/model/sliders_response/slider_list_model.dart';
import 'package:dartz/dartz.dart';

abstract class HomeRepo {
  // * get sliders
  Future<Either<String, SliderListModel>> getSliders();
  // * get best sellers
  Future<Either<String, BestSellerListModel>> getBestSellers();
}
