import 'dart:developer';
import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:dio/dio.dart';
import 'package:iroid/constants/app_strings.dart';
import 'package:iroid/data/network/service/app_url.dart';

class ApiService {
  static final _options = BaseOptions(
    baseUrl: AppUrl.baseUrl,
    // connectTimeout: const Duration(milliseconds: AppUrl.connectionTimeout),
    // receiveTimeout: const Duration(milliseconds: AppUrl.receiveTimeout),
    connectTimeout: const Duration(milliseconds: AppUrl.connectionTimeout),
    receiveTimeout: const Duration(milliseconds: AppUrl.receiveTimeout),
    responseType: ResponseType.json,
  );

  // dio instance
  final Dio _dio = Dio(_options)..interceptors.add(LogInterceptor());

  // Internet connectivity check
  static Future<bool> isInternetConnected() async {
    var connectivityResult = await Connectivity().checkConnectivity();
    return connectivityResult != ConnectivityResult.none;
  }

  // GET request
  Future<Response> get(
    String url, {
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }

    try {
      final Response response = await _dio.get(
        url,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      log(e.toString());
      rethrow;
    }
  }

  // POST request 
  Future<Response> post(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }
    try {
      final Response response = await _dio.post(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // PUT request
  Future<Response> put(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }
    try {
      final Response response = await _dio.put(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  //PATCH request
  Future<Response> patch(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }
    try {
      final Response response = await _dio.patch(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
        onSendProgress: onSendProgress,
        onReceiveProgress: onReceiveProgress,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }

  // DELETE request
  Future<Response> delete(
    String url, {
    dynamic data,
    Map<String, dynamic>? queryParameters,
    Options? options,
    CancelToken? cancelToken,
    ProgressCallback? onSendProgress,
    ProgressCallback? onReceiveProgress,
  }) async {
    bool isConnected = await isInternetConnected();
    if (!isConnected) {
      throw DioException(
        requestOptions: RequestOptions(path: url),
        error: AppStrings.noInternetConnection,
      );
    }
    try {
      final Response response = await _dio.delete(
        url,
        data: data,
        queryParameters: queryParameters,
        options: options,
        cancelToken: cancelToken,
      );
      return response;
    } catch (e) {
      rethrow;
    }
  }
}