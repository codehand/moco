import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:moco/models/order.dart';
import 'package:moco/screen/home/widget/order_widget.dart';
import 'package:moco/screen/order/order_controller.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/styles.dart';

class OrderListView extends GetView<OrderController> {
  final List<OrderModel>? orders;

  OrderListView({required this.orders});

  @override
  Widget build(BuildContext context) {
    if(orders == null || orders!.isEmpty ) {
      return SizedBox(
        child: Text("Order not found", 
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
                childAspectRatio: 1.6,
              ),
            physics: const NeverScrollableScrollPhysics(),
            scrollDirection: Axis.vertical,
            itemCount: orders!.length,
            padding: EdgeInsets.only(
              left: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              right: ResponsiveHelper.isDesktop(context)? 0 : Dimensions.PADDING_SIZE_SMALL,
              bottom: Dimensions.PADDING_SIZE_SMALL,
            ),
            itemBuilder: (context, index) {
              return OrderWidget(
                onTap: () => {},
                index: index + 1,
                code: orders![index].code,
                totalAmount: orders![index].totalPrice.toString(),
                deliverStatus: orders![index].status,
                sellerName: orders![index].sellerInfo!.sellerName,
                quantity: 1,
                items: orders![index].items,
              );
            }
          ),
        ),
      ],
    );
  }
}