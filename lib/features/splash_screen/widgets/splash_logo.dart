import 'package:flutter/material.dart';
import 'package:news_app/core/resources/assets_manager.dart';

class SplashLogo extends StatelessWidget {
  final double opacity;
  final double scale;

  const SplashLogo({super.key, required this.opacity, required this.scale});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: opacity,
      child: AnimatedContainer(
        duration: const Duration(seconds: 2),
        curve: Curves.easeOut,
        transform: Matrix4.identity()..scale(scale),
        child: Image.asset(
          ImageAssets.Logo,
          width: 200,
          height: 200,
        ),
      ),
    );
  }
}
