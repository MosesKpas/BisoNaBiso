import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bisonabiso/ui/login.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({super.key});

  get splash => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
        splash: Row(
          children: [
            Center(
              child: LottieBuilder.asset("assets/Lottie/Animation_-_1713526438056.json"),
            )
          ],
        ),
        nextScreen: const LoginPage(),
        splashIconSize: 300,
        backgroundColor: Colors.blue,
        );
  }
}
