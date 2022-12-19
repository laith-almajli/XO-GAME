import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:xo_game/home_screen.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  SystemChrome.setPreferredOrientations(
      [DeviceOrientation.portraitDown, DeviceOrientation.portraitUp]);
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'XO Game',
      theme: ThemeData(
          brightness: Brightness.dark,
          primarySwatch: Colors.blue,
          primaryColor: const Color(0xFF00061a),
          shadowColor: const Color(0xFF001456),
          splashColor: const Color(0xFF4169e8)),
      home: const HomeScreen(),
    );
  }
}
