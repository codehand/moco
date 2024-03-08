
import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:moco/utils/images.dart';

class CustomImage extends StatelessWidget {
  final String? image;
  final double? height;
  final double? width;
  final BoxFit? fit;
  final String? placeholder;
  const CustomImage({@required this.image, this.height, this.width, this.fit = BoxFit.cover, this.placeholder = Images.placeholder});

  @override
  Widget build(BuildContext context) {
    if(image!.toString().startsWith("assets/")) {
      return Image.asset(image!.toString(),height: height, width: width, fit: fit);
    }
    
    return CachedNetworkImage(
      // fix issues view image
      imageUrl: image!.toString().replaceAll("https://lh3.google.com/u/0/d/", "https://drive.usercontent.google.com/download?export=view&id="), height: height, width: width, fit: fit,
      placeholder: (context, url) => Image.asset(placeholder!, height: height, width: width, fit: fit),
      errorWidget: (context, url, error) => Image.asset(placeholder!, height: height, width: width, fit: fit),
    );
  }
}
