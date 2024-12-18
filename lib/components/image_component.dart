import 'package:flutter/material.dart';

class ImageComponent extends StatelessWidget {
  final String imagePath;
  final double width;
  final double height;

  const ImageComponent({
    super.key,
    required this.imagePath,
    this.width = 440,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true, // Enables panning
      minScale: 0.5, // Minimum scale factor for zoom-out
      maxScale: 4.0, // Maximum scale factor for zoom-in
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
        width: width,
        height: height,
      ),
    );
  }
}

class ImageComponentNoWidth extends StatelessWidget {
  final String imagePath;
  final double height;

  const ImageComponentNoWidth({
    super.key,
    required this.imagePath,
    this.height = 320,
  });

  @override
  Widget build(BuildContext context) {
    return InteractiveViewer(
      panEnabled: true, // Enables panning
      minScale: 0.5, // Minimum scale factor for zoom-out
      maxScale: 4.0, // Maximum scale factor for zoom-in
      child: Image.asset(
        imagePath,
        fit: BoxFit.fill,
        height: height,
      ),
    );
  }
}
