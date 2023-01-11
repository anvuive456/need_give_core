class ApiPath {
  // static const String BASE_URL =
  //     'https://need-give-server.onrender.com'; //server
  // static const String BASE_URL = 'https://www.needngive.site/'; //prod
  static const String BASE_URL = 'http://localhost:8000'; //local
  static const String API = '/api';

  static const String V = '/v1';

  //auth
  static const String sign_in = BASE_URL + API + V + '/auth/sign-in';
  static const String sign_up_donor =
      BASE_URL + API + V + '/auth/donor/sign-up';
  static const String sign_up_needer =
      BASE_URL + API + V + '/auth/needer/sign-up';

  //charity
  static String charityByUserId(int id) =>
      BASE_URL + API + V + '/user/${id}/charity';
  static const String charity = BASE_URL + API + V + '/charity';

  static String charityByRequestId(int id) =>
      BASE_URL + API + V + '/request/${id}/charity';

  //request
  static const String request = BASE_URL + API + V + '/request';

  static String requestByUserId(int id) =>
      BASE_URL + API + V + '/user/${id}/request';

  static const String requestForDonor = BASE_URL + API + V + '/donor/request';

  //user
  static const String update_profile = BASE_URL + API + V + '/user';
  static const String profile = BASE_URL + API + V + '/user/me';

  //upload media
  static const String upload_single_image =
      BASE_URL + API + V + '/media/single';
  static const String upload_multi_image = BASE_URL + API + V + '/media/multi';
}
