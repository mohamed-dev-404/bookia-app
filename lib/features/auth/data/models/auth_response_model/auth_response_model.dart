import 'package:bookia/core/constants/api_keys.dart';
import 'data.dart';

class AuthResponseModel {
  Data? data;
  String? message;
  List<dynamic>? error;
  int? status;

  AuthResponseModel({this.data, this.message, this.error, this.status});

  factory AuthResponseModel.fromJson(Map<String, dynamic> json) {
    return AuthResponseModel(
      data: json[ApiKeys.data] == null
          ? null
          : Data.fromJson(json[ApiKeys.data] as Map<String, dynamic>),
      message: json[ApiKeys.message] as String?,
      error: json[ApiKeys.error] as List<dynamic>?,
      status: json[ApiKeys.status] as int?,
    );
  }

  Map<String, dynamic> toJson() => {
    ApiKeys.data: data?.toJson(),
    ApiKeys.message: message,
    ApiKeys.error: error,
    ApiKeys.status: status,
  };
}
