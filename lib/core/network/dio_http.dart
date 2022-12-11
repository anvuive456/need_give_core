import 'package:dio/dio.dart';
import 'package:need_give_core/core/app_constants.dart';
import 'package:need_give_core/core/network/interceptors.dart';
import 'package:shared_preferences/shared_preferences.dart';

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

void initInterceptors() async{
  var pref = await SharedPreferences.getInstance();
  dio.interceptors.add(AuthInterceptor(pref));
}
