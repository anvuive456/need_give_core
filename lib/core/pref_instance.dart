import 'package:need_give_core/core/app_constants.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefInstance {

  saveAccessToken(String accessToken) async {
    var prefs = await SharedPreferences.getInstance();
    prefs.setString(PrefKey.PREF_ACCESS_TOKEN, accessToken);
  }
}