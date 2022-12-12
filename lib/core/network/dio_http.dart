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
  String token = pref.getString(PrefKey.PREF_ACCESS_TOKEN)??'';
  dio.interceptors.add(InterceptorsWrapper(
      onRequest: (RequestOptions options,RequestInterceptorHandler handler) {
        options.headers["Authorization"] = "Bearer ${token}"  ;
        return handler.next(options);
      }, onResponse: (Response response,ResponseInterceptorHandler handler) {
    return handler.next(response);
  }, onError: (DioError error,ErrorInterceptorHandler handler) async {
    // RequestOptions origin = error.response!.requestOptions;
    // if (error.response?.statusCode == 401) {
      // try {
      //   Response<dynamic> data = await dio.get("your_refresh_url");
      //   token = data.data['newToken'];
      //   _customSharedPreferences.setToken(data.data['newToken']);
      //   origin.headers["Authorization"] = "Bearer " + data.data['newToken'];
      //   return dio.request(origin.path, options: origin);
      // } catch (err) {
      //   return err;
      // }
    // }
    return handler.next(error);
  }));
}
