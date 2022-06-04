import 'package:flutter/material.dart';
import 'package:tabata/theme/tabata_theme.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
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
      home: const Scaffold(),
    );
  }
}
