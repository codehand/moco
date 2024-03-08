import 'package:moco/services/api.dart';
import 'package:moco/utils/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

class SplashRepo {
  APIClient apiClient;
  final SharedPreferences sharedPreferences;

  SplashRepo({ required this.apiClient, required this.sharedPreferences});

  Future<bool> initSharedData() async {
    if(!sharedPreferences.containsKey(AppConstants.COUNTRY_CODE)) {
      sharedPreferences.setString(AppConstants.COUNTRY_CODE, AppConstants.languages[0].countryCode!);
    }
    if(!sharedPreferences.containsKey(AppConstants.LANGUAGE_CODE)) {
      sharedPreferences.setString(AppConstants.LANGUAGE_CODE, AppConstants.languages[0].languageCode!);
    }
    return Future.value(true);
  }
}