import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';
import 'package:tabata/app_module.dart';
import 'package:tabata/constants/routes.dart';
import 'package:tabata/features/settings/presentation/pages/change_settings.dart';
import 'package:tabata/features/tabata/presentation/pages/countdown.dart';
import 'package:tabata/features/tabata/presentation/pages/tabata_container.dart';
import 'package:tabata/screens/home_screen/home_screen.dart';
import 'package:tabata/screens/splash_screen/splash_screen.dart';
import 'package:tabata/theme/tabata_theme.dart';

void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  AppModule.initLocator(GetIt.instance);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Tabata',
      theme: tabataTheme,
      home: const SplashScreen(),
      routes: {
        homeRoute: (context) => const HomeScreen(),
        changeSettingsRoute: (context) => const ChangeSettingsPage(),
        tabataRoute: (context) => const TabataContainerPage(),
        countdownAnimationRoute: (context) => const CountdownAnimation(),
      },
    );
  }
}
