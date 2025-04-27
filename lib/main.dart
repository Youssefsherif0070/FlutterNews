import 'package:flutter/material.dart';
import 'package:tap_news/screen/splash.dart';

void main() {
  runApp(FlutterNews());
}

class FlutterNews extends StatelessWidget {
  const FlutterNews({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(debugShowCheckedModeBanner: false, home: SplashScreen());
  }
}
