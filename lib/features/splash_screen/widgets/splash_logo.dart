import 'package:flutter/material.dart';

class SplashLogo extends StatelessWidget {
  final Animation<double> opacity;
  final Animation<double> scale;
  final String assetPath;

  const SplashLogo({
    super.key,
    required this.opacity,
    required this.scale,
    required this.assetPath,
  });

  @override
  Widget build(BuildContext context) {
    return FadeTransition(
      opacity: opacity,
      child: ScaleTransition(
        scale: scale,
        child: Image.asset(
          assetPath,
          width: 120,
          height: 120,
          fit: BoxFit.contain,
        ),
      ),
    );
  }
}