import 'dart:async';
import 'package:flutter/material.dart';
import 'package:tap_news/screen/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => SplashScreenState();
}

class SplashScreenState extends State<SplashScreen> {
  double dot1Height = 10;
  double dot2Height = 10;
  double dot3Height = 10;
  int _currentDot = 0;

  @override
  void initState() {
    super.initState();

    // Animation Timer
    Timer.periodic(const Duration(milliseconds: 300), (timer) {
      setState(() {
        dot1Height = 10;
        dot2Height = 10;
        dot3Height = 10;

        if (_currentDot == 0) dot1Height = 15;
        if (_currentDot == 1) dot2Height = 15;
        if (_currentDot == 2) dot3Height = 15;

        _currentDot = (_currentDot + 1) % 3;
      });
    });

    // Navigation to Home Screen after 3 seconds
    Future.delayed(const Duration(seconds: 3), () {
      Navigator.pushReplacement(
        context,
        MaterialPageRoute(builder: (context) => HomeScreen()),
      );
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            const Spacer(),
            Image.asset("assets/main.jpg", width: 320),
            const SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Flutter",
                  style: TextStyle(fontSize: 35, fontWeight: FontWeight.w700),
                ),
                ShaderMask(
                  shaderCallback:
                      (bounds) => const LinearGradient(
                        begin: Alignment.topLeft,
                        end: Alignment.bottomRight,
                        colors: [
                          Colors.red,
                          Colors.pink,
                          Colors.purple,
                          Colors.deepPurple,
                        ],
                      ).createShader(bounds),
                  child: const Text(
                    "News",
                    style: TextStyle(
                      fontSize: 35,
                      color: Colors.white,
                      fontWeight: FontWeight.w700,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 15),
            const SizedBox(
              width: 350,
              child: Text(
                "Introducing Flutter News: Your go-to app for breaking news and in-depth analysis tailored to your interests! Stay informed effortlessly with personalized updates, bookmark articles, and engage with a vibrant community.",
                style: TextStyle(fontSize: 15),
                textAlign: TextAlign.center,
              ),
            ),
            Expanded(
              child: Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: dot1Height,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[400],
                    ),
                  ),
                  const SizedBox(width: 7),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: dot2Height,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[400],
                    ),
                  ),
                  const SizedBox(width: 7),
                  AnimatedContainer(
                    duration: const Duration(milliseconds: 300),
                    height: dot3Height,
                    width: 10,
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(10),
                      color: Colors.purple[400],
                    ),
                  ),
                ],
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
