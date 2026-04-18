import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/features/auth/data/models/auth_response_model/user.dart';

class ProfileResponse {
  User? data;
  String? message;
  List<dynamic>? error;
  int? status;

  ProfileResponse({this.data, this.message, this.error, this.status});

  factory ProfileResponse.fromJson(Map<String, dynamic> json) {
    return ProfileResponse(
      data: json[ApiKeys.data] == null
          ? null
          : User.fromJson(json[ApiKeys.data] as Map<String, dynamic>),
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
