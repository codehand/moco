import 'package:flutter/material.dart';
import 'package:moco/components/custom_image.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:moco/utils/helper/responsive.dart';
import 'package:moco/utils/styles.dart';
import 'package:nb_utils/nb_utils.dart';

class ProductWidget extends StatelessWidget {
  final Function onTap;
  final String? img;
  final String? title;
  final String? subtitle;
  final String? amount;
  final double? standardPrice;
  final int? maxLines;
  final bool hasDiscount;

  const ProductWidget(
      {super.key,
      required this.onTap,
      this.img,
      this.title,
      this.subtitle,
      this.maxLines = 2,
      this.amount,
      this.standardPrice,
      this.hasDiscount = false});
  @override
  Widget build(BuildContext context) {
    return Container(
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
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              SizedBox(
                child: Stack(fit: StackFit.loose, children: <Widget>[
                  Column(
                    children: [
                      SizedBox(
                        child: ClipRRect(
                          borderRadius: const BorderRadius.only(
                              topLeft:
                                  Radius.circular(Dimensions.RADIUS_DEFAULT),
                              topRight:
                                  Radius.circular(Dimensions.RADIUS_DEFAULT)),
                          child: LayoutBuilder(builder: (BuildContext context,
                              BoxConstraints constraints) {  
                            return CustomImage(
                              image: img,
                              fit: BoxFit.cover,
                              height: constraints.maxWidth,
                              width: constraints.maxWidth,
                            );
                          }),
                        ),
                      ),
                      const SizedBox(
                        height: 2,
                      ),
                      Padding(
                        padding: ResponsiveHelper.isMobile(context) ? const EdgeInsets.all(15) : const EdgeInsets.all(5),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.spaceBetween,
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            // Text(subtitle!,
                            //     style: secondaryTextStyle(size: 12)),
                            SizedBox(
                              width: context.width(),
                              child: Text(title!,
                                  maxLines: maxLines, style: boldTextStyle(size: 14)),
                            ),
                            Text(
                                NumberFormat.simpleCurrency(name: 'VND')
                                    .format(int.parse(amount!)),
                                style: primaryTextStyle(size: 16, weight: FontWeight.bold)),
                            if(hasDiscount && standardPrice != null)
                              Text(
                                NumberFormat.simpleCurrency(name: "VND").format(standardPrice).toString(),
                                style: ubuntuRegular.copyWith(
                                    fontSize: Dimensions.fontSizeSmall,
                                    decoration: TextDecoration.lineThrough,
                                    color: Theme.of(context).colorScheme.error.withOpacity(.8)),
                              ),
                          ],
                        ),
                      )
                    ],
                  ),
                  Positioned(
                    right: 8,
                    top: 5,
                    child: Container(
                      height: 30,
                      width: 30,
                      alignment: Alignment.center,
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(20),
                        color: context.cardColor,
                      ),
                      child: const Icon(Icons.favorite,
                          color: Colors.grey, size: 18),
                    ),
                  ),
                ]),
              ),
            ],
          ),
        ));
  }
}