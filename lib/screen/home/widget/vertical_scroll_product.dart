import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/models/product.dart';
import 'package:moco/screen/home/widget/product_horizontal_widget.dart';
import 'package:moco/screen/product/product_controller.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/styles.dart';

class VerticalScrollProductView extends GetView<ProductController> {
  final List<ProductModel>? products;

  VerticalScrollProductView({required this.products});

  @override
  Widget build(BuildContext context) {
    if(products == null || products!.isEmpty ) {
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
            itemCount: products!.length,
            padding: EdgeInsets.only(
              left: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              right: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              bottom: Dimensions.PADDING_SIZE_SMALL,
            ),
            itemBuilder: (context, index) {
              return ProductHorizonTalWidget(
                onTap: () => {},
                amount: products![index].getPriceValueAsString(),
                standardPrice: products![index].getStandardPriceAsString(),
                img: products![index].image,
                title: products![index].name,
                maxLines: 2,
                hasDiscount: products![index].hasDiscount(),
                rating: products![index].rating ?? 0,
                estDeliverTime: products![index].estDeliverTime ?? '---',
                historyOrder: products![index].historyOrder ?? 0,
              );
            }
          ),
        ),
      ],
    );
  }
}