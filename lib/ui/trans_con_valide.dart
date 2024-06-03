import 'package:animated_splash_screen/animated_splash_screen.dart';
import 'package:bisonabiso/ui/home.dart';
import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';

// ignore: camel_case_types
class TransConValidePage extends StatelessWidget {
  const TransConValidePage({super.key});

  get spalsh => null;
  @override
  Widget build(BuildContext context) {
    return AnimatedSplashScreen(
      splash: Padding(
        padding: const EdgeInsets.only(left: 30),
        child: Row(
          children: [
            Center(
              child: LottieBuilder.asset(
                  "assets/Lottie/Animation_-_1713540647400.json"),
            )
          ],
        ),
      ),
      nextScreen: const HomePage(),
      splashIconSize: 300,
      backgroundColor: Colors.blue,
      duration: 4000,
    );
  }
}
