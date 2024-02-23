import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class CarouselCard extends StatelessWidget {
  const CarouselCard({super.key, required this.imgURL});

  final String imgURL;

  @override
  Widget build(BuildContext context) {
    return ClipRRect(
      borderRadius: BorderRadius.circular(10),
      child: SizedBox(
        width: double.infinity,
        child: CachedNetworkImage(
          imageUrl: imgURL,
          fit: BoxFit.cover,
          progressIndicatorBuilder: (context, url, downloadProgress) => Center(
              child:
                  CircularProgressIndicator(value: downloadProgress.progress)),
          errorWidget: (context, url, error) => const Icon(Icons.error),
        ),
      ),
    );
  }
}
