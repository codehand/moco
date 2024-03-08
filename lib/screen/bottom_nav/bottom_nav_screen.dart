
import 'dart:async';

import 'package:flutter/material.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:get/get.dart';
import 'package:moco/main.dart';
import 'package:moco/screen/home/home_screen.dart';
import 'package:moco/screen/offer/offer_screen.dart';
import 'package:moco/screen/order/order_screen.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/images.dart';
import 'package:moco/utils/styles.dart';

import 'bottom_nav_controller.dart';

class BottomNavScreen extends StatefulWidget {
  final int pageIndex;
    const BottomNavScreen({super.key, required this.pageIndex});

  @override
  State<BottomNavScreen> createState() => _BottomNavScreenState();
}

class _BottomNavScreenState extends State<BottomNavScreen> {
  final int _pageIndex = 0;
  final GlobalKey<ScaffoldMessengerState> _scaffoldKey = GlobalKey();
  bool _canExit = GetPlatform.isWeb ? true : false;

  @override
  Widget build(BuildContext context) {
    bool isUserLoggedIn = true;
    return WillPopScope(
      onWillPop: () async {
        if (_pageIndex != 0) {
          Get.find<BottomNavController>().changePage(BnbItem.home);
          return false;
        } else {
          if (_canExit) {
            return true;
          } else {
            Fluttertoast.showToast(
                msg: 'back_press_again_to_exit'.tr,
                toastLength: Toast.LENGTH_SHORT,
                gravity: ToastGravity.BOTTOM,
                timeInSecForIosWeb: 1,
                backgroundColor: Colors.green,
                textColor: Colors.white,
                fontSize: 16.0);
            _canExit = true;
            Timer(const Duration(seconds: 2), () {
              _canExit = false;
            });
            return false;
          }
        }
      },
      child: Scaffold(
        key: _scaffoldKey,
        floatingActionButton: ResponsiveHelper.isDesktop(context)
            ? null
            : InkWell(
          onTap: () => Get.toNamed('RouteHelper.getCartRoute()'),
          child: Container(
            height: 70,
            width: 70,
            alignment: Alignment.center,
            decoration: BoxDecoration(
              color: _pageIndex == 2
                  ? null
                  : Get.isDarkMode
                  ? Theme.of(context).colorScheme.primary
                  : Theme.of(context).colorScheme.secondaryContainer,
              shape: BoxShape.circle,
              gradient: _pageIndex == 2
                  ? const LinearGradient(
                colors: [Color(0xFFFBBB00), Color(0xFFFF833D)],
                begin: Alignment.topCenter,
                end: Alignment.bottomCenter,
              )
                  : null,
            ),
            child: const Text("ORDER"),
          ),
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.miniCenterDocked,
        bottomNavigationBar: ResponsiveHelper.isDesktop(context) ? const SizedBox() :
        SafeArea(
          child: Container(
            height: ResponsiveHelper.isMobile(context) ?  55  : 60 + MediaQuery.of(context).padding.top,
            alignment: Alignment.center,
            padding: const EdgeInsets.all(Dimensions.PADDING_SIZE_EXTRA_SMALL),
            color:Get.isDarkMode ? Theme.of(context).cardColor.withOpacity(.5) : Theme.of(context).primaryColor,
            child: Row(children: [
              _bnbItem(
                  icon: Images.home,
                  bnbItem: BnbItem.home,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.home);
                  },
                  context: context),
              _bnbItem(
                  icon: Images.history,
                  bnbItem: BnbItem.history,
                  onTap: () {
                    // if (!_isUserLoggedIn) {
                    //   Get.toNamed(
                    //       RouteHelper.getNotLoggedScreen('my_bookings'.tr));
                    // } else {
                      Get.find<BottomNavController>().changePage(BnbItem.history);
                    // }
                  },
                  context: context),
              _bnbItem(
                  icon: '',
                  bnbItem: BnbItem.cart,
                  onTap: () {
                    if (!isUserLoggedIn) {
                      // Get.toNamed(
                      //     RouteHelper.getSignInRoute(RouteHelper.main));
                    } else {
                      Get.find<BottomNavController>().changePage(BnbItem.cart);
                    }
                  },
                  context: context),
              _bnbItem(
                  icon: Images.offerMenu,
                  bnbItem: BnbItem.offers,
                  onTap: () {
                    Get.find<BottomNavController>().changePage(BnbItem.offers);
                  },
                  context: context),
              _bnbItem(
                  icon: Images.menu,
                  bnbItem: BnbItem.more,
                  onTap: () {
                    // Get.bottomSheet(MenuScreen(),
                    //     backgroundColor: Colors.transparent,
                    //     isScrollControlled: true);
                  },
                  context: context),
            ]),
          ),
        ),
        body: Obx(() => _bottomNavigationView()),
      ),
    );
  }

  Widget _bnbItem({
    required String icon,
    required BnbItem bnbItem,
    required GestureTapCallback onTap,
    context}) {
    return Obx(() => Expanded(
        child: InkWell(
          onTap: onTap, //bnbItem != BnbItem.cart ? onTap : null,
          child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
            icon.isEmpty ? const SizedBox(width: 20, height: 20) : Image.asset(
              icon,
              width: 18,
              height: 18,
              color: Get.find<BottomNavController>().currentPage.value == bnbItem
                  ? Colors.white
                  : Theme.of(context).secondaryHeaderColor,
            ),
            const SizedBox(height: Dimensions.PADDING_SIZE_EXTRA_SMALL),
            Text(bnbItem != BnbItem.cart ? bnbItem.name.tr.toUpperCase() : '',
                style: ubuntuRegular.copyWith(
                  fontSize: Dimensions.fontSizeSmall,
                  color: Get.find<BottomNavController>().currentPage.value == bnbItem
                      ? Colors.white
                      : Theme.of(context).secondaryHeaderColor,
                )),
          ]),
        )));
  }

  _bottomNavigationView() {
    // PriceConverter.getCurrency();
    switch (Get.find<BottomNavController>().currentPage.value) {
      case BnbItem.home:
        return const HomeScreen();
      case BnbItem.history:
        return const OrderScreen();
      case BnbItem.cart:
        return const Text("Make order screen");
      case BnbItem.offers:
        return const OfferScreen();
      //no page will will be return shows only menu dialog from _bnbItem tap
      case BnbItem.more:
        break;
    }
  }
}

