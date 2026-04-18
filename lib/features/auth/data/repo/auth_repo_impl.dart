import 'package:bookia/core/cache/secure_storage/secure_storage_service.dart';
import 'package:bookia/core/cache/shred_pref/shared_pref_service.dart';
import 'package:bookia/core/constants/api_endpoints.dart';
import 'package:bookia/core/constants/api_keys.dart';
import 'package:bookia/core/errors/exceptions/api_exception.dart';
import 'package:bookia/core/functions/build_token.dart';
import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/features/auth/data/models/auth_response_model/auth_response_model.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:dartz/dartz.dart';

class AuthRepoImpl implements AuthRepo {
  final ApiConsumer api;

  AuthRepoImpl(this.api);

  @override
  Future<Either<String, AuthResponseModel>> login({
    required String email,
    required String password,
  }) async {
    try {
      // hit login request
      final response = await api.post(
        EndPoints.login,
        data: {
          ApiKeys.email: email,
          ApiKeys.password: password,
        },
      );

      //parsing and initialize authResponseModel
      final AuthResponseModel authResponseModel = AuthResponseModel.fromJson(
        response,
      );

      //cache token and user data
      await _cacheUserData(authResponseModel);

      return Right(authResponseModel); // success case, return authResponseModel
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordComfirmation,
  }) async {
    try {
      // hit register request
      final response = await api.post(
        EndPoints.register,
        data: {
          ApiKeys.name: name,
          ApiKeys.email: email,
          ApiKeys.password: password,
          ApiKeys.passwordComfirmation: passwordComfirmation,
        },
      );

      //parsing and initialize authResponseModel
      final AuthResponseModel authResponseModel = AuthResponseModel.fromJson(
        response,
      );

      //cache token and user data
      await _cacheUserData(authResponseModel);

      return Right(authResponseModel); // success case, return authResponseModel
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> logout() async {
    final token = await SecureStorageService.instance.getAccessToken();
    try {
      // hit logout request
      final response = await api.post(
        EndPoints.logout,
        headers: {
          ApiKeys.authorization: buildToken(token),
        },
      );

      //parsing and initialize authResponseModel
      final AuthResponseModel authResponseModel = AuthResponseModel.fromJson(
        response,
      );

      return Right(authResponseModel); // success case, return authResponseModel
    } on ApiException catch (e) {
      return Left(e.errorModel.errorMessage); // failure case
    } catch (e) {
      return Left(e.toString()); // failure case
    }
  }

  @override
  Future<Either<String, AuthResponseModel>> forgetPassword({
    required String email,
  }) {
    // TODO: implement forgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, AuthResponseModel>> checkForgetPassword({
    required String email,
    required String verifyCode,
  }) {
    // TODO: implement checkForgetPassword
    throw UnimplementedError();
  }

  @override
  Future<Either<String, AuthResponseModel>> resetPassword({
    required String verifyCode,
    required String password,
    required String passwordComfirmation,
  }) {
    // TODO: implement resetPassword
    throw UnimplementedError();
  }

  //! ===============================
  //! Helper Methods
  //! ===============================

  Future<void> _cacheUserData(AuthResponseModel authResponseModel) async {
    await SecureStorageService.instance.saveAccessToken(
      authResponseModel.data?.token,
    );
    await SharedPrefService.saveUserData(authResponseModel.data?.user);
  }
}
