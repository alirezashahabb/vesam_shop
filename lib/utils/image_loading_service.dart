import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class ImageLoadingService extends StatelessWidget {
  final String mainImage;
  final double radius;
  const ImageLoadingService({
    super.key,
    required this.mainImage,
    this.radius = 0,
  });

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(radius),
      child: CachedNetworkImage(
        placeholder: (context, url) {
          return Center(
            child: CircularProgressIndicator(),
          );
        },
        errorWidget: (context, url, error) {
          return Center(
            child: Center(
              child: Icon(Icons.error),
            ),
          );
        },
        imageUrl: mainImage,
        fit: BoxFit.fill,
      ),
    );
  }
}
