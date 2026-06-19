import 'package:bookia/core/constants/api_keys.dart';

class SliderModel {
  String? image;

  SliderModel({this.image});

  factory SliderModel.fromJson(Map<String, dynamic> json) => SliderModel(
        image: json[ApiKeys.image] as String?,
      );

  Map<String, dynamic> toJson() => {
        ApiKeys.image: image,
      };
}
