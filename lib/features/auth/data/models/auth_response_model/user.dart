import 'package:bookia/core/constants/api_keys.dart';

class User {
  int? id;
  String? name;
  String? email;
  dynamic address;
  dynamic city;
  dynamic phone;
  bool? emailVerified;
  String? image;

  User({
    this.id,
    this.name,
    this.email,
    this.address,
    this.city,
    this.phone,
    this.emailVerified,
    this.image,
  });

  factory User.fromJson(Map<String, dynamic> json) => User(
    id: json[ApiKeys.authId] as int?,
    name: json[ApiKeys.name] as String?,
    email: json[ApiKeys.email] as String?,
    address: json[ApiKeys.address] as dynamic,
    city: json[ApiKeys.city] as dynamic,
    phone: json[ApiKeys.phone] as dynamic,
    emailVerified: json[ApiKeys.emailVerified] as bool?,
    image: json[ApiKeys.image] as String?,
  );

  Map<String, dynamic> toJson() => {
    ApiKeys.authId: id,
    ApiKeys.name: name,
    ApiKeys.email: email,
    ApiKeys.address: address,
    ApiKeys.city: city,
    ApiKeys.phone: phone,
    ApiKeys.emailVerified: emailVerified,
    ApiKeys.image: image,
  };
}
