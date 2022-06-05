import 'package:flutter/material.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/screens/home_screen/home_screen.dart';
import 'package:tabata/screens/splash_screen/splash_screen.dart';
import 'package:tabata/theme/tabata_theme.dart';

MaterialApp tabataApp = MaterialApp(
  debugShowCheckedModeBanner: false,
  title: 'Tabata',
  theme: tabataTheme,
  home: const SplashScreen(),
  routes: {
    homeRoute: (context) => const HomeScreen(),
    // splashRoute: (context) => const SplashScreen(context)
  },
);
