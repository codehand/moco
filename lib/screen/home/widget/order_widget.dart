import 'package:flutter/material.dart';
import 'package:moco/components/custom_image.dart';
import 'package:moco/models/order.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:moco/utils/images.dart';
import 'package:nb_utils/nb_utils.dart';

class OrderWidget extends StatelessWidget {
  final Function onTap;
  final int? index;
  final String? code;
  final int? quantity;
  final String? discount;
  final String? currency;
  final String? totalAmount;
  final String? deliverStatus;
  final String? sellerName;
  final List<OrderItemModel>? items;

  const OrderWidget(
      {super.key,
      required this.onTap,
      this.index,
      this.code,
      this.quantity = 0,
      this.discount,
      this.currency = "VND",
      this.totalAmount,
      this.deliverStatus,
      this.sellerName,
      this.items});

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      child: Container(
        padding: const EdgeInsets.all(10),
        decoration: BoxDecoration(
          color: Theme.of(context).hoverColor,
          borderRadius: const BorderRadius.all(
            Radius.circular(Dimensions.RADIUS_DEFAULT),
          ),
        ),
        width: context.width() / 2 - 24,
        child: InkWell(
      borderRadius: BorderRadius.circular(Dimensions.RADIUS_DEFAULT),
      onTap: () {
        onTap();
      },
      child: Stack(
        fit: StackFit.loose,
        children: <Widget>[
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Row(
                children: [
                  const Icon(Icons.store),
                  Text(
                    sellerName!,
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    deliverStatus!,
                    style: TextStyle(fontSize: 16, color: Theme.of(context).primaryColor),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const CustomImage(
                    image: Images.vihawa, // Provide your image URL here
                    height: 100,
                    width: 100,
                    fit: BoxFit.cover,
                  ),
                  const SizedBox(width: 10),
                  Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      if(items != null && items!.isNotEmpty)
                        Text(
                          items![0].product!.name.toString(), // Title on the top line
                          maxLines: 2,
                          overflow: TextOverflow.ellipsis,
                          style: boldTextStyle(size: 16),
                        ),
                        Text(
                          NumberFormat.simpleCurrency(name: currency)
                              .format(double.parse(items![0].product!.price.toString())),
                          style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                        ),
                        const SizedBox(height: 5),
                        Text(
                          'Quantity: $quantity',
                          style: const TextStyle(fontSize: 16),
                        ),
                        const SizedBox(height: 5),
                    ],
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  Text(
                    'Total Quantity: $quantity',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                  const Spacer(),
                  Text(
                    'Total Price: ${NumberFormat.simpleCurrency(name: currency).format(double.parse(totalAmount!))}',
                    style: const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
                  ),
                ],
              ),
              const SizedBox(height: 10),
              Row(
                children: [
                  const Text(
                    "Give me more",
                    style: TextStyle(fontSize: 16),
                  ),
                  const Spacer(),
                  ElevatedButton(
                    onPressed: () {},
                    child: const Text('Get Feedback'),
                  ),
                ],
              ),
            ],
          ),
        ],
      ),
    ),
      )
    );
  }
}