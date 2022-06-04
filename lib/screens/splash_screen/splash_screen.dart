import 'dart:async';

import 'package:flutter/material.dart';
import 'package:lottie/lottie.dart';
import 'package:tabata/screens/home_screen/home_screen.dart';

class SplashScreen extends StatelessWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    // Timer(
    //   const Duration(seconds: 3),
    //   () => Navigator.of(context).pushReplacement(
    //     MaterialPageRoute(
    //       builder: (BuildContext context) => const HomeScreen(),
    //     ),
    //   ),
    // );

    return Scaffold(
      body: Center(
        child: Lottie.asset("assets/lottie/splash_animation.json",
            onLoaded: (composition) {
          Timer(
            const Duration(seconds: 3),
            () => Navigator.of(context).pushReplacement(
              MaterialPageRoute(
                builder: (BuildContext context) => const HomeScreen(),
              ),
            ),
          );
        }),
      ),
    );
  }
}
