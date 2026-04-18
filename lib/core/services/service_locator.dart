import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/core/network/dio_consumer.dart';
import 'package:bookia/features/auth/data/repo/auth_repo.dart';
import 'package:bookia/features/auth/data/repo/auth_repo_impl.dart';
import 'package:bookia/features/auth/presentation/view_model/forget_password_cubit/forget_password_cubit.dart';
import 'package:bookia/features/auth/presentation/view_model/login_cubit/login_cubit.dart';
import 'package:bookia/features/auth/presentation/view_model/register_cubit/register_cubit.dart';
import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

/// This file is responsible for registering all the services
/// that will be used in the app using GetIt package for [dependency_injection].
final GetIt getIt = GetIt.instance;

//* This function will be called in the main function before running the app
void setupServiceLocator() {
  //! shared network services
  getIt.registerLazySingleton<Dio>(() => Dio());
  getIt.registerLazySingleton<ApiConsumer>(() => DioConsumer(getIt<Dio>()));

  //! Auth Feature

  //? Auth Repo
  getIt.registerLazySingleton<AuthRepo>(
    () => AuthRepoImpl(getIt<ApiConsumer>()),
  );

  //? Login Cubit
  getIt.registerLazySingleton<LoginCubit>(
    () => LoginCubit(authRepo: getIt<AuthRepo>()),
  );

  //? Register Cubit
  getIt.registerLazySingleton<RegisterCubit>(
    () => RegisterCubit(authRepo: getIt<AuthRepo>()),
  );

  //? Forget Password Cubit
  getIt.registerLazySingleton<ForgetPasswordCubit>(
    () => ForgetPasswordCubit(authRepo: getIt<AuthRepo>()),
  );
}
