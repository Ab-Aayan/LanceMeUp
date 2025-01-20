import 'package:easy_splash_screen/easy_splash_screen.dart';
import 'package:flutter/material.dart';
import 'package:lancemeup/SplashScreen/onbording.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  Widget build(BuildContext context) {
    return EasySplashScreen(
      logo: Image.asset(
        'assets/images/lancemeup.webp',
      ),
      logoWidth: 250,
      backgroundColor: const Color.fromRGBO(123, 202, 95, 1),
      showLoader: false,
      loadingText: const Text(
        "Version 0.0.1",
        style: TextStyle(color: Colors.white, fontSize: 16),
      ),
      navigator: const Onbording(),
      durationInSeconds: 2,
    );
  }
}
