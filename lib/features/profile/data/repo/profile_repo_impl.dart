import 'package:bookia/core/cache/secure_storage/secure_storage_service.dart';
import 'package:bookia/core/cache/shred_pref/shared_pref_service.dart';
import 'package:bookia/core/constants/api_endpoints.dart';
import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/core/errors/exceptions/api_exception.dart';
import 'package:bookia/core/functions/build_token.dart';
import 'package:bookia/features/profile/data/models/profile_response.dart';
import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/features/profile/data/repo/profile_repo.dart';
import 'package:dartz/dartz.dart';

class ProfileRepoImpl implements ProfileRepo {
  final ApiConsumer api;

  ProfileRepoImpl(this.api);

  @override
  Future<Either<String, ProfileResponse>> getProfile() async {
    final token = await SecureStorageService.instance.getAccessToken();
    try {
      // hit get profile request
      final response = await api.get(
        EndPoints.getProfile,
        headers: {
          ApiKeys.authorization: buildToken(token),
        },
      );

      //parsing and initialize profileResponseModel
      final ProfileResponse profileResponseModel = ProfileResponse.fromJson(
        response,
      );

      //cache user data
      await _cacheUserData(profileResponseModel);

      return Right(
        profileResponseModel,
      ); // success case, return profileResponseModel
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }

  //! ===============================
  //! Helper Methods
  //! ===============================

  Future<void> _cacheUserData(ProfileResponse profileResponseModel) async {
    await SharedPrefService.saveUserData(profileResponseModel.data);
  }
}
