import 'package:bookia/core/constants/api_keys.dart';
import 'user.dart';

class Data {
  User? user;
  String? token;

  Data({this.user, this.token});

  factory Data.fromJson(Map<String, dynamic> json) => Data(
    user: json[ApiKeys.user] == null
        ? null
        : User.fromJson(json[ApiKeys.user] as Map<String, dynamic>),
    token: json[ApiKeys.token] as String?,
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.user: user?.toJson(),
    ApiKeys.token: token,
  };
}
