import 'dart:async';
import 'dart:io';

import 'package:creativenasa/data/api/nasa/nasa_credentials.dart';
import 'package:creativenasa/data/api/nasa/nasa_endpoints.dart';
import 'package:dio/dio.dart';
import 'package:dio/io.dart';

class NasaClient extends DioForNative {

  NasaClient({
    BaseOptions? options,
  }) : super(options ?? baseOptions) {
    interceptors.add(NasaAuthInterceptor());
  }

  static const Duration _defaultTimeout = Duration(seconds: 15);

  static final BaseOptions baseOptions = BaseOptions(
    baseUrl: NasaEndpoints.baseUrl,
    headers: {
      HttpHeaders.contentTypeHeader: 'application/json; charset=utf-8',
      HttpHeaders.acceptHeader: 'application/json',
    },
    connectTimeout: _defaultTimeout,
    sendTimeout: _defaultTimeout,
    receiveTimeout: _defaultTimeout,
  );

}

class NasaAuthInterceptor extends Interceptor {

  @override
  FutureOr<dynamic> onRequest(
      RequestOptions options,
      RequestInterceptorHandler handler,
  ) async {
    options.queryParameters.addEntries([
      MapEntry('api_key', NasaCredentials.apiKey),
    ]);

    super.onRequest(options, handler);
  }

}