import 'package:flutter/material.dart';

class SplashText extends StatelessWidget {
  final double opacity;

  const SplashText({super.key, required this.opacity});

  @override
  Widget build(BuildContext context) {
    return AnimatedOpacity(
      duration: const Duration(seconds: 2),
      opacity: opacity,
      child: Text(
        "Today's News",
        style: TextStyle(
          fontSize: 24,
          fontWeight: FontWeight.bold,
          color: Theme.of(context).colorScheme.secondary,
        ),
      ),
    );
  }
}

