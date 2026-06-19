import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/features/home/data/model/sliders_response/slider_model.dart';

class SliderListModel {
  List<SliderModel>? sliders;

  SliderListModel({this.sliders});

  factory SliderListModel.fromJson(Map<String, dynamic> json) {
    return SliderListModel(
      sliders: (json[ApiKeys.sliders] as List<dynamic>?)
          ?.map((item) => SliderModel.fromJson(item as Map<String, dynamic>))
          .toList(),
    );
  }

  Map<String, dynamic> toJson() => {
        ApiKeys.sliders: sliders?.map((item) => item.toJson()).toList(),
      };
}
