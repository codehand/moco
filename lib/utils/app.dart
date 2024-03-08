import 'package:moco/models/language.dart';
import 'package:moco/utils/images.dart';

class AppConstants {
  static const String TOKEN = 'moco_token';
  static const String LOCALIZATION_KEY = 'm-localization';
  static const String ZONE_ID = 'zoneId';
  static const String COUNTRY_CODE = 'm_country_code';
  static const String LANGUAGE_CODE = 'm_language_code';
  static const String THEME = 'moco_theme';
  
  // API 
  static const String BASE_URL = '127.0.0.1';

  static Map<String, String> configHeader = {
    'Content-Type': 'application/json',
  };

  static List<LanguageModel> languages = [
    LanguageModel(imageUrl: Images.us, languageName: 'English', countryCode: 'US', languageCode: 'en'),
  ];
}