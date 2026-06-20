import 'package:bookia/core/constants/api_endpoints.dart';
import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/core/errors/exceptions/api_exception.dart';
import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/features/home/data/model/best_seller_response/best_seller_list_model.dart';
import 'package:bookia/features/home/data/model/sliders_response/slider_list_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';

class HomeRepoImpl implements HomeRepo {
  final ApiConsumer api;

  HomeRepoImpl(this.api);

  @override
  Future<Either<String, BestSellerListModel>> getBestSellers() async {
    try {
      // Make the API call to fetch best sellers
      final response = await api.get(EndPoints.getBestSeller);

      // Parse the response and convert it to BestSellerListModel
      final BestSellerListModel bestSellerListModel =
          BestSellerListModel.fromJson(
            response[ApiKeys.data],
          );

      // Return the bestSellerListModel wrapped in a Right to indicate success
      return Right(bestSellerListModel);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }

  @override
  Future<Either<String, SliderListModel>> getSliders() async {
    try {
      // Make the API call to fetch sliders
      final response = await api.get(EndPoints.getSliders);
      // Parse the response and convert it to SliderListModel
      final SliderListModel sliderListModel = SliderListModel.fromJson(
        response[ApiKeys.data],
      );

      // Return the sliderListModel wrapped in a Right to indicate success
      return Right(sliderListModel);
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }
}
