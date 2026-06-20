import 'package:bookia/features/home/data/model/best_seller_response/best_seller_list_model.dart';
import 'package:bookia/features/home/data/model/best_seller_response/best_seller_model.dart';
import 'package:bookia/features/home/data/model/sliders_response/slider_list_model.dart';
import 'package:bookia/features/home/data/model/sliders_response/slider_model.dart';
import 'package:bookia/features/home/data/repo/home_repo.dart';
import 'package:dartz/dartz.dart';
import 'package:flutter_bloc/flutter_bloc.dart';

part 'home_state.dart';

class HomeCubit extends Cubit<HomeState> {
  HomeRepo homeRepo;
  HomeCubit(this.homeRepo) : super(HomeInitial());

  List<SliderModel> sliders = [];
  List<BestSellerModel> bestSellers = [];

  Future<void> loadHomeData() async {
    emit(HomeLoading());

    //? hit both endpoints simultaneously (in parallel) using Future.wait
    final result = await Future.wait([
      homeRepo.getSliders(),
      homeRepo.getBestSellers(),
    ]);

    //? Extract the results for sliders and best sellers
    final slidersResult = result[0] as Either<String, SliderListModel>;
    final bestSellersResult = result[1] as Either<String, BestSellerListModel>;

    //? Initialize variables to track loading status and error messages
    bool hasAnySuccess = false;
    final errors = <String>[];

    //? Handle the results for sliders and best sellers
    slidersResult.fold(
      (errMessage) {
        errors.add(errMessage);
      },
      (sliderListModel) {
        sliders = sliderListModel.sliders ?? [];
        hasAnySuccess = true;
      },
    );

    bestSellersResult.fold(
      (errMessage) {
        errors.add(errMessage);
      },
      (bestSellerListModel) {
        bestSellers = bestSellerListModel.products ?? [];
        hasAnySuccess = true;
      },
    );

    final errorMessage = errors.join('\n');

    //? Emit the appropriate state based on the results
    if (hasAnySuccess) {
      emit(
        HomeLoadedSuccessfully(
          warningMessage: errors.isEmpty ? null : errorMessage,
        ),
      );
    } else {
      emit(
        HomeFailure(errorMessage),
      );
    }
  }
}
