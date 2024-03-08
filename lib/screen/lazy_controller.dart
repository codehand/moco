import 'dart:convert';

import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:moco/models/language.dart';
import 'package:moco/screen/localization_controller.dart';
import 'package:moco/screen/splash/splash_controller.dart';
import 'package:moco/screen/splash/splash_repo.dart';
import 'package:moco/screen/theme_controller.dart';
import 'package:moco/services/api.dart';
import 'package:moco/utils/app.dart';
import 'package:shared_preferences/shared_preferences.dart';

Future<void> initController() async {
  //those binding are used before called GetMaterial app
  final sharedPreferences = await SharedPreferences.getInstance();
  Get.lazyPut(() => sharedPreferences);
  Get.lazyPut(() => APIClient(appBaseUrl: AppConstants.BASE_URL, sharedPreferences: Get.find()));
  Get.lazyPut(() => SplashController(splashRepo: SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));
  Get.lazyPut(() => ThemeController(sharedPreferences: Get.find()));
  Get.lazyPut(() => LocalizationController(sharedPreferences: sharedPreferences, apiClient: Get.find()));
}

Future<Map<String, Map<String,String>>> loadLocale() async {
  Map<String, Map<String,String>> languages = Map();
  for(LanguageModel lang in AppConstants.languages) {
    String jsonString = await rootBundle.loadString('assets/language/${lang.languageCode}.json');
    Map<String, dynamic> mappedJson = json.decode(jsonString);
    Map<String, String> dataJson = Map();
    mappedJson.forEach((key, value) {
      dataJson[key] = value.toString();
    });
    languages['${lang.languageCode}_${lang.countryCode}'] = dataJson;
  }
  return languages;
}