import 'package:bookia/core/constants/app_constants.dart';
import 'package:bookia/core/errors/exceptions/api_exception.dart';
import 'package:bookia/core/errors/handlers/dio_exception_handler.dart';
import 'package:bookia/core/errors/models/error_model.dart';
import 'package:bookia/core/network/api_consumer.dart';
import 'package:bookia/core/network/interceptors/header_interceptor.dart';
import 'package:bookia/core/network/interceptors/logger_interceptor.dart';
import 'package:bookia/core/network/interceptors/network_interceptor.dart';
import 'package:bookia/core/network/interceptors/retry_interceptor.dart';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';

class DioConsumer extends ApiConsumer {
  final Dio dio;

  DioConsumer(this.dio) {
    dio.options.baseUrl = AppConstants.baseUrl;
    dio.options
      ..connectTimeout = const Duration(seconds: 20)
      ..receiveTimeout = const Duration(seconds: 20);
    dio.interceptors.add(HeaderInterceptor());
    dio.interceptors.add(NetworkInterceptor(Connectivity()));
    dio.interceptors.add(RetryInterceptor(dio, maxRetries: 5));
    if (!kReleaseMode) {
      dio.interceptors.add(DioLogger());
    }
  }

  //! GET Request
  @override
  Future get(
    String path, {
    Object? data,
    Map<String, dynamic>? queryParameters,
  }) async {
    try {
      final response = await dio.get(
        path,
        data: data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleException(e);
    }
  }

  //! PATCH Request
  @override
  Future patch(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.patch(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleException(e);
    }
  }

  //! POST Request
  @override
  Future post(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.post(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleException(e);
    }
  }

  //! PUT Request
  @override
  Future put(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.put(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleException(e);
    }
  }

  //! DELETE Request
  @override
  Future delete(
    String path, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    bool isFormData = false,
  }) async {
    try {
      final response = await dio.delete(
        path,
        data: isFormData ? FormData.fromMap(data) : data,
        queryParameters: queryParameters,
      );
      return response.data;
    } catch (e) {
      _handleException(e);
    }
  }

  ///* helper method to handle exceptions and throw suitable ApiException
  Never _handleException(Object e) {
    if (e is DioException) {
      handleDioExceptions(
        e,
      ); // throw suitable ApiException based on DioException type
    }
    throw ApiException(errorModel: ErrorModel(errorMessage: e.toString()));
  }
}
