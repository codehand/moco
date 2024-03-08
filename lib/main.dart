import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/messages.dart';
import 'package:moco/screen/lazy_binding.dart';
import 'package:moco/screen/lazy_controller.dart';
import 'package:moco/screen/localization_controller.dart';
import 'package:moco/screen/splash/splash_controller.dart';
import 'package:moco/utils/app.dart';
import 'package:moco/utils/helper/custom_scroll_behavior.dart';
import 'package:moco/utils/route.dart';
import 'package:url_strategy/url_strategy.dart';

Future<void> main() async {
  setPathUrlStrategy();
  
  WidgetsFlutterBinding.ensureInitialized();

  await initController();

  Map<String, Map<String,String>> languages = await loadLocale();
  FlutterError.onError = (details) {
    FlutterError.presentError(details);
  };

  runApp(MyApp(languages: languages));
}

class MyApp extends StatelessWidget {
  final Map<String, Map<String,String>>? languages;

  const MyApp({super.key, @required this.languages});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return GetBuilder<LocalizationController>(builder: (localizeController) {
      return GetBuilder<SplashController>(builder: (splashController) {
        return GetMaterialApp(
          title: 'Moco',
          navigatorKey: Get.key,
          theme: ThemeData(
            colorSchemeSeed: const Color.fromRGBO(231,89,54,1.00), // pantone-17-1461-tpx https://icolorpalette.com/color/pantone-17-1461-tpx
            useMaterial3: true,
            visualDensity: VisualDensity.standard, // btn larger
          ),
          scrollBehavior: CustomScrollBehavior(),
          initialRoute: RouteHelper.main,
          getPages: RouteHelper.routes,
          initialBinding: InitialBinding(),
          translations: Messages(languages: languages),
          locale: localizeController.locale,
          fallbackLocale: Locale(AppConstants.languages[0].languageCode!, AppConstants.languages[0].countryCode),
        );
      });
    });
  }
}
