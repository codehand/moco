
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/screen/bottom_nav/bottom_nav_binding.dart';
import 'package:moco/screen/bottom_nav/bottom_nav_screen.dart';
import 'package:moco/screen/home/home_screen.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/images.dart';
import 'package:moco/utils/route.dart';

class AddressAppBar extends StatelessWidget implements PreferredSizeWidget {
  final bool? backButton;
  AddressAppBar({this.backButton = false});

  @override
  Widget build(BuildContext context) {
    return AppBar(
      backgroundColor: Get.isDarkMode ? Theme.of(context).cardColor.withOpacity(.2) : Theme.of(context).primaryColor,
      shape: Border( 
        bottom: BorderSide( 
          width: .4,
          color: Theme.of(context).primaryColorLight.withOpacity(.2),
        )
      ),
      elevation: 0,
      leadingWidth: backButton! ? Dimensions.PADDING_SIZE_LARGE : 0,
      leading: backButton! ? 
        IconButton(onPressed: () {
          if (Navigator.of(context).canPop()) {
            Navigator.of(context).pop();
          } else {
            Get.offAll(BottomNavScreen(
              pageIndex: 0,
            ),
            binding: BottomNavBinding(),);
          }
        }, 
        icon: const Icon(Icons.arrow_back_ios), 
        color: Theme.of(context).cardColor) : const SizedBox(),
      title: Row( 
        children: [
          Expanded(child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () => {},
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: Dimensions.PADDING_SIZE_SMALL),
                InkWell(
                  onTap: () => Get.toNamed(RouteHelper.getInitialRoute()),
                  child: Image.asset(Get.isDarkMode ? Images.webAppBarLogoDart : Images.webAppBarLogo, width: 50),
                ),
              ],
            ),
          )),
          InkWell(
            hoverColor: Colors.transparent,
            onTap: () => {
              // Redirect to notification screen
            },
            child: const Icon(Icons.notifications, size: 40, color: Colors.white),
          ),
        ],
      ),
    );
  }

  @override
  Size get preferredSize => Size(Dimensions.WEB_MAX_WIDTH, GetPlatform.isDesktop ? 70 : 56);
}