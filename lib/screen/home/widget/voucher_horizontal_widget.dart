import 'package:flutter/material.dart';
import 'package:moco/components/custom_image.dart';
import 'package:moco/utils/dimensions.dart';
import 'package:intl/intl.dart';
import 'package:nb_utils/nb_utils.dart';

class VoucherHorizonTalWidget extends StatelessWidget {
  final Function onTap;
  final String? img;
  final String? title;
  final String? description;
  final int? maxLines;

  const VoucherHorizonTalWidget(
      {super.key,
      required this.onTap,
      this.img,
      this.title,
      this.description,
      this.maxLines = 2});

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
                    children: [
                      Text(
                        title!, // Title on the top line
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(size: 16),
                      ),
                      Text(
                        description!, // Title on the top line
                        maxLines: 2,
                        overflow: TextOverflow.ellipsis,
                        style: boldTextStyle(size: 14),
                      ),
                    ],
                  ),
                ),
              ),
            ],
          ),
          Positioned(
            bottom: 8,
            right: 8,
            child: TextButton(
              onPressed: () {
                // Add your functionality here
              },
              style: ButtonStyle(
                backgroundColor: MaterialStateProperty.all<Color>(Theme.of(context).primaryColor),
                shape: MaterialStateProperty.all<OutlinedBorder>(
                  RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              child: const Text(
                'Sử dụng',
                style: TextStyle(color: Colors.white),
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