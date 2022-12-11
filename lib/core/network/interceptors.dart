import 'package:dio/dio.dart';
import 'package:need_give_core/core/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class AuthInterceptor implements QueuedInterceptor{
  final SharedPreferences prefs;
  AuthInterceptor(this.prefs);
  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
   return handler.next(err);
  }

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    String? token = prefs.getString(PrefKey.PREF_ACCESS_TOKEN);
    if(token !=null){
      options.headers['Authorization'] = 'Bearer '+ token;
    }

    return handler.next(options);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    return handler.next(response);
  }

}