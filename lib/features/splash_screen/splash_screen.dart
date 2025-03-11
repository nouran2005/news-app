import 'package:flutter/material.dart';
import 'package:news_app/features/splash_screen/widgets/splash_logo.dart';
import 'package:news_app/features/splash_screen/widgets/splash_text.dart';
import 'package:news_app/features/home_screen/presentation/pages/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  _SplashScreenState createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  double _logoOpacity = 0.0;
  double _logoScale = 0.5;
  double _textOpacity = 0.0;

  @override
  void initState() {
    super.initState();
    _startAnimation();
  }

  void _startAnimation() {
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        _logoOpacity = 1.0;
        _logoScale = 1.0;
      });
    });

    Future.delayed(const Duration(milliseconds: 1500), () {
      setState(() {
        _textOpacity = 1.0;
      });
    });

    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => const HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.primary,
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SplashLogo(opacity: _logoOpacity, scale: _logoScale),
            const SizedBox(height: 20),
            SplashText(opacity: _textOpacity),
          ],
        ),
      ),
    );
  }
}
