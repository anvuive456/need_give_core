import 'package:dio/dio.dart';

Dio dio = Dio(
  BaseOptions(
    connectTimeout: 5000,
    headers: {
      'Accept': 'application/json',
      // 'content-type': 'application/json',
    },
    // contentType: 'application/json',
  ),
);

void setBaseUrl(String baseUrl) {
  dio.options.baseUrl = baseUrl;
}

void setToken(String token) {
  if (dio.options.headers.containsKey('token')) {
    dio.options.headers.update('token', (value) => value = token);
  } else {
    dio.options.headers.addAll({'token': token});
  }
}
