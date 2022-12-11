class ApiPath {
  static const String BASE_URL =
      'https://need-give-server.onrender.com'; //server
  // static const String BASE_URL = 'https://www.needngive.site/'; //prod
  // static const String BASE_URL = 'http://10.0.2.2:3000'; //local
  static const String API = '/api';

  static const String V = '/v1';

  //auth
  static const String sign_in = BASE_URL + API + V + '/auth/sign-in';
  static const String sign_up = BASE_URL + API + V + '/auth/sign-up';

  static const String charity = BASE_URL + API + V + '/charity';
  static const String profile = BASE_URL + API + V + '/user/me';
}
