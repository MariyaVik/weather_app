import 'package:dio/dio.dart';

class DioClient {
  final Dio _dio;
  // Dio get dio => _dio;
  final String baseUrl;
  final String apiKey;
  final String apiKeyName;
  DioClient(
      {required this.baseUrl, required this.apiKey, this.apiKeyName = 'apiKey'})
      : _dio = Dio(
          BaseOptions(
              connectTimeout: const Duration(milliseconds: 8000),
              receiveTimeout: const Duration(milliseconds: 3000),
              baseUrl: baseUrl,
              queryParameters: {
                apiKeyName: apiKey,
              }),
        );

  Future<Response> get(
    String path, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    final combinedQueryParameters = {
      ..._dio.options.queryParameters,
      if (queryParameters != null) ...queryParameters,
    };

    return _dio.get(
      path,
      queryParameters: combinedQueryParameters,
      options: options,
      cancelToken: cancelToken,
      onReceiveProgress: onReceiveProgress,
    );
  }
}
