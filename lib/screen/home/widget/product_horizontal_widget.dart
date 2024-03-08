import 'package:flutter/material.dart';
import 'package:moco/components/custom_image.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/styles.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductHorizonTalWidget extends StatelessWidget {
  final Function onTap;
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  final String? standardPrice;
  final int? maxLines;
  final bool hasDiscount;
  final String? currency;
  final double? rating;
  final String? estDeliverTime;
  final int? historyOrder;

  const ProductHorizonTalWidget(
      {super.key,
      required this.onTap,
      this.img,
      this.title,
      this.subtitle,
      this.maxLines = 2,
      this.amount,
      this.standardPrice,
      this.hasDiscount = false,
      this.currency = "VND",
      this.rating = 0,
      this.estDeliverTime,
      this.historyOrder = 0});

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
          Row(
            crossAxisAlignment: CrossAxisAlignment.start, // Align content at the top
            children: [
              SizedBox(
                width: 150, // Set a fixed width for the image
                child: ClipRRect(
                  borderRadius: const BorderRadius.only(
                    topLeft: Radius.circular(Dimensions.RADIUS_DEFAULT),
                    topRight: Radius.circular(Dimensions.RADIUS_DEFAULT),
                  ),
                  child: CustomImage(
                    image: img,
                    height: 150,
                    width: 150,
                    fit: BoxFit.cover,
                  ),
                ),
              ),
              5.width,
              Expanded(
                child: Padding(
                  padding: const EdgeInsets.all(5),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title!, // Title on the top line
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(size: 16),
                      ),
                      Row(
                        children: [
                          const Icon(
                            Icons.star,
                            color: Colors.amber,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            '$rating ($historyOrder)',
                            style: const TextStyle(fontSize: 12),
                          ),
                          const SizedBox(width: 10),
                          const Icon(
                            Icons.delivery_dining,
                            size: 16,
                          ),
                          const SizedBox(width: 5),
                          Text(
                            estDeliverTime.toString() + " - Q.12",
                            style: const TextStyle(fontSize: 12),
                          ),
                        ],
                      ),
                      const SizedBox(height: 5), // Spacer between title and price
                      Row(
                        crossAxisAlignment: CrossAxisAlignment.center,
                        children: [
                          Text(
                            NumberFormat.simpleCurrency(name: currency)
                                .format(double.parse(amount!)),
                            style: primaryTextStyle(
                              size: 16,
                              weight: FontWeight.bold,
                            ),
                          ),
                          if (hasDiscount && standardPrice != null)
                            const SizedBox(width: 5),
                          if (hasDiscount && standardPrice != null)
                            Text(
                              NumberFormat.simpleCurrency(name: currency)
                                .format(double.parse(standardPrice!)),
                              style: const TextStyle(
                                fontSize: 12,
                                fontWeight: FontWeight.bold,
                                decoration: TextDecoration.lineThrough,
                                color: Colors.red,
                              ),
                            ),
                        ],
                      ),
                      // Padding(
                      //   padding: const EdgeInsets.only(bottom: 5),
                      //   child: Text(
                      //     NumberFormat.simpleCurrency(name: 'VND')
                      //       .format(int.parse(amount!)),
                      //     style: primaryTextStyle(
                      //       size: 18,
                      //       weight: FontWeight.bold,
                      //     ),
                      //   ),
                      // ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: Container(
              width: 40,
              height: 40,
              decoration: BoxDecoration(
                shape: BoxShape.circle,
                color: Theme.of(context).primaryColor,
              ),
              child: const Icon(
                Icons.add,
                color: Colors.white,
              ),
            ),
          ),
          Positioned(
            left: 115,
            top: 5,
            child: Container(
              height: 30,
              width: 30,
              alignment: Alignment.center,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                color: Theme.of(context).cardColor,
              ),
              child: const Icon(
                Icons.favorite,
                color: Colors.grey,
                size: 18,
              ),
            ),
          ),
        ],
      ),
    ),
      )
    );
  }
}