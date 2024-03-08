import 'package:get/get.dart';
import 'package:moco/screen/offer/offer_controller.dart';
import 'package:moco/screen/offer/offer_repo.dart';
import 'package:moco/screen/order/order_controller.dart';
import 'package:moco/screen/order/order_repo.dart';
import 'package:moco/screen/product/product_controller.dart';
import 'package:moco/screen/product/product_repo.dart';
import 'package:moco/screen/splash/splash_controller.dart';
import 'package:moco/screen/splash/splash_repo.dart';

class InitialBinding extends Bindings {
  @override
  void dependencies() async {
    //common controller
    Get.lazyPut(() => SplashController(splashRepo: SplashRepo(apiClient: Get.find(), sharedPreferences: Get.find())));

    // logic controller
    Get.lazyPut(() => ProductController(productRepo: ProductRepo(apiClient: Get.find())));
    Get.lazyPut(() => OrderController(orderRepo: OrderRepo(apiClient: Get.find())));
    Get.lazyPut(() => OfferController(offerRepo: OfferRepo(apiClient: Get.find())));
  }
}