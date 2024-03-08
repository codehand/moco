import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/models/voucher.dart';
import 'package:moco/screen/home/widget/product_horizontal_widget.dart';
import 'package:moco/screen/home/widget/voucher_horizontal_widget.dart';
import 'package:moco/screen/offer/offer_controller.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/images.dart';
import 'package:moco/utils/styles.dart';

class VerticalScrollOfferView extends GetView<OfferController> {
  final List<VoucherModel>? offers;

  VerticalScrollOfferView({required this.offers});

  @override
  Widget build(BuildContext context) {
    if(offers == null || offers!.isEmpty ) {
      return SizedBox(
        child: Text("Product not found", 
          style: ubuntuMedium.copyWith(fontSize: Dimensions.fontSizeExtraLarge),
        ),
      );
    }
    return Stack(
      children: [
        Container(
          child: GridView.builder(
            shrinkWrap: true,
            gridDelegate:
              const SliverGridDelegateWithFixedCrossAxisCount(
                crossAxisCount:1,
                crossAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                mainAxisSpacing: Dimensions.PADDING_SIZE_SMALL,
                childAspectRatio: 2.5,
              ),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: offers!.length,
            padding: EdgeInsets.only(
              left: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              right: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              bottom: Dimensions.PADDING_SIZE_SMALL,
            ),
            itemBuilder: (context, index) {
              return VoucherHorizonTalWidget(
                onTap: () => {},
                img: Images.discountIcon,
                title: offers![index].name,
                description: offers![index].description,
                maxLines: 2,
              );
            }
          ),
        ),
      ],
    );
  }
}