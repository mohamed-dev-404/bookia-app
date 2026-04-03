import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/core/network/dio_consumer.dart';
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

  // getIt.registerLazySingleton<AuthRepo>(
  //   () => AuthRepoImpl(getIt<ApiConsumer>()),
  // );
}
