import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/components/address_app_bar.dart';
import 'package:moco/screen/home/widget/vertical_scroll_product.dart';
import 'package:moco/screen/product/product_controller.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/styles.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super (key: key);

  @override
  State<HomeScreen> createState() => HomeScreenState();
}

class HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final ScrollController scrollController = ScrollController();
    return FutureBuilder(
      future: Get.find<ProductController>().getProductList(1, false),
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          // Loading state
          return const CircularProgressIndicator();
        } else if (snapshot.hasError) {
          // Error state
          return Text('Error: ${snapshot.error}');
        } else {
          return Container(
            child: Container(
              child: Scaffold( 
                resizeToAvoidBottomInset: false,
                appBar: AddressAppBar(backButton: false),
                endDrawer: null, // only support mobile 
                body: SafeArea(child: RefreshIndicator(
                  onRefresh: () async { 
                    await Get.find<ProductController>().getProductList(1, true);
                  },
                  child: GestureDetector(
                    child: GetBuilder<ProductController>(
                      builder: (productController) {
                        return CustomScrollView(
                          controller: scrollController,
                          physics: const AlwaysScrollableScrollPhysics(),
                          slivers: [
                            const SliverToBoxAdapter(child: SizedBox(height: Dimensions.PADDING_SIZE_SMALL,),),
                            SliverPersistentHeader(
                              pinned: true,
                              delegate: SliverDelegate(
                                child: InkWell(
                                  onTap: () => {},
                                  child: Padding(
                                    padding: const EdgeInsets.only(
                                        left: Dimensions.PADDING_SIZE_DEFAULT,
                                        right: Dimensions.PADDING_SIZE_DEFAULT,
                                        top: Dimensions.PADDING_SIZE_EXTRA_SMALL,
                                      ),
                                    child: Container(
                                      padding: const EdgeInsets.only(
                                          left: Dimensions.PADDING_SIZE_DEFAULT,
                                          right: Dimensions.PADDING_SIZE_EXTRA_SMALL),
                                      alignment: Alignment.center,
                                      decoration: BoxDecoration(boxShadow:Get.isDarkMode ? null: [BoxShadow(color: Theme.of(context).primaryColor, blurRadius: 5, spreadRadius: 1)],
                                          borderRadius: BorderRadius.circular(22),
                                          color: Theme.of(context).cardColor
                                      ),
                                      child: SizedBox(
                                        child: TextField(
                                          style: ubuntuRegular.copyWith(color: Theme.of(context).hintColor),
                                          onSubmitted: (value) {
                                            // REDIRECT SCREEN SEARCH
                                          },
                                          cursorColor: Theme.of(context).hintColor,
                                          autofocus: false,
                                          textAlignVertical: TextAlignVertical.center,
                                          textInputAction: TextInputAction.newline,
                                          decoration: InputDecoration(
                                            hintText: 'search_services'.tr,
                                            border: OutlineInputBorder(
                                                borderRadius: BorderRadius.circular(22),
                                                borderSide: BorderSide.none,
                                            ),
                                            focusedBorder: OutlineInputBorder( // Remove shadow when focused
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: BorderSide.none,
                                            ),
                                            enabledBorder: OutlineInputBorder( // Remove shadow when not focused
                                              borderRadius: BorderRadius.circular(22),
                                              borderSide: BorderSide.none,
                                            ),
                                            fillColor: Get.isDarkMode
                                                ? Theme.of(context).hintColor.withOpacity(0.2)
                                                : Theme.of(context).primaryColorDark.withOpacity(0.01),
                                            isDense: true,
                                            hintStyle: Theme.of(context).textTheme.headline2!.copyWith(fontSize: Dimensions.fontSizeLarge, color: Theme.of(context).hintColor),
                                            filled: false,
                                            prefixIconConstraints: const BoxConstraints(minWidth: 23, maxHeight: 20),
                                            prefixIcon: Padding(
                                              padding: const EdgeInsets.symmetric(horizontal: Dimensions.PADDING_SIZE_MINI),
                                              child: Icon(Icons.search,color: Theme.of(context).hintColor,),
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                              )
                            ),
                            SliverToBoxAdapter(
                              child: Center(
                                child: SizedBox(
                                  width:  Dimensions.WEB_MAX_WIDTH,
                                  child: Column(
                                    children: [
                                      const SizedBox(height: Dimensions.PADDING_SIZE_DEFAULT),
                                      VerticalScrollProductView(products: productController.products),
                                    ],
                                  ),
                                ),
                              ),
                            )
                          ],
                        );
                      },
                    ),
                  ), 
                  )
                )),
          ),
          );
        }
      }
    );
  }
}


class SliverDelegate extends SliverPersistentHeaderDelegate {
  Widget child;

  SliverDelegate({required this.child});

  @override
  Widget build(
      BuildContext context, double shrinkOffset, bool overlapsContent) {
    return child;
  }

  @override
  double get maxExtent => 50;

  @override
  double get minExtent => 50;

  @override
  bool shouldRebuild(SliverDelegate oldDelegate) {
    return oldDelegate.maxExtent != 50 ||
        oldDelegate.minExtent != 50 ||
        child != oldDelegate.child;
  }
}