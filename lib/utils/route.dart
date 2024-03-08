import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/screen/bottom_nav/bottom_nav_binding.dart';
import 'package:moco/screen/bottom_nav/bottom_nav_screen.dart';

class RouteHelper {
  static const String initial = '/';
  static const String splash = '/splash';
  static const String signIn = '/sign-in';
  static const String signUp = '/sign-up';
  static const String main = '/main';
  static const String orders = '/orders';
  static const String home = '/home';

  //
  static String getInitialRoute() => initial;

  static List<GetPage> routes = [
    GetPage(name: initial, binding: BottomNavBinding(), page: () => getRoute(BottomNavScreen(
      pageIndex: Get.parameters['page'] == 'home' ? 0 :
      Get.parameters['page'] == 'orders' ? 1 :
      Get.parameters['page'] == 'cart' ? 2 :
      Get.parameters['page'] == 'order' ? 3 :
      Get.parameters['page'] == 'menu' ? 4 : 0,
    ))),
    GetPage(name: main, binding: BottomNavBinding(), page: () => getRoute(BottomNavScreen(
      pageIndex: Get.parameters['page'] == 'home' ? 0 :
      Get.parameters['page'] == 'orders' ? 1 :
      Get.parameters['page'] == 'cart' ? 2 :
      Get.parameters['page'] == 'order' ? 3 :
      Get.parameters['page'] == 'menu' ? 4 : 0,
    ))),
    GetPage(name: orders, binding: BottomNavBinding(), page: () => getRoute(BottomNavScreen(
      pageIndex: Get.parameters['page'] == 'home' ? 0 :
      Get.parameters['page'] == 'orders' ? 1 :
      Get.parameters['page'] == 'cart' ? 2 :
      Get.parameters['page'] == 'order' ? 3 :
      Get.parameters['page'] == 'menu' ? 4 : 0,
    ))),
    GetPage(name: home, binding: BottomNavBinding(), page: () => getRoute(const BottomNavScreen(
      pageIndex: 0,
    ))),
  ];

  static getRoute(Widget navigateTo) {
    return  navigateTo;
   }
}