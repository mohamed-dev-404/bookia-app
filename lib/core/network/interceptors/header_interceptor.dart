import 'package:bookia/core/cache/secure_storage/secure_storage_service.dart';
import 'package:bookia/core/constants/api_keys.dart';
import 'package:dio/dio.dart';

class HeaderInterceptor extends Interceptor {
  @override
  void onRequest(
    RequestOptions options,
    RequestInterceptorHandler handler,
  ) async {
    final String? accessToken = await SecureStorageService.instance
        .getAccessToken();

    options.headers[ApiKeys.authorization] = accessToken != null
        ? 'Bearer $accessToken'
        : null;
    super.onRequest(options, handler);
  }
}
