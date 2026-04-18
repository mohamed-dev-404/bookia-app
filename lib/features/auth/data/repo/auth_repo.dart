import 'package:bookia/features/auth/data/models/auth_response_model/auth_response_model.dart';
import 'package:dartz/dartz.dart';

abstract class AuthRepo {
  //! login
  Future<Either<String, AuthResponseModel>> login({
    required String email,
    required String password,
  });

  //! register
  Future<Either<String, AuthResponseModel>> register({
    required String name,
    required String email,
    required String password,
    required String passwordComfirmation,
  });

  //! logout
  Future<Either<String, AuthResponseModel>> logout();

  //! forget-password
  Future<Either<String, AuthResponseModel>> forgetPassword({
    required String email,
  });

  //! check-forget-password (verify code)
  Future<Either<String, AuthResponseModel>> checkForgetPassword({
    required String email,
    required String verifyCode,
  });

  //! reset-password
  Future<Either<String, AuthResponseModel>> resetPassword({
    required String verifyCode,
    required String password,
    required String passwordComfirmation,
  });
}
