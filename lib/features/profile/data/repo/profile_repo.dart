import 'package:bookia/features/profile/data/models/profile_response.dart';
import 'package:dartz/dartz.dart';

abstract class ProfileRepo {
  //! get profile
  Future<Either<String, ProfileResponse>> getProfile();
}
