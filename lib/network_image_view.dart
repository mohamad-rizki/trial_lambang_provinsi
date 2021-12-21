import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';

class NetworkImageView extends StatelessWidget {
  final String url;
  final BoxFit fit;
  final double width;
  final double height;

  const NetworkImageView.loadUrl({
    Key? key,
    required this.url,
    this.fit = BoxFit.cover,
    this.width = 80,
    this.height = 80,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CachedNetworkImage(
      imageUrl: url,
      placeholder: (context, url) => const Center(
        child: CircularProgressIndicator(),
      ),
      errorWidget: (context, url, error) => const Icon(Icons.error),
      fit: fit,
      width: width,
      height: height,
    );
  }
}
