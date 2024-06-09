import 'dart:async';

import 'package:flutter/material.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:news_app/view/home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({super.key});

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  // ignore: must_call_super
  void initState() {
    Timer(const Duration(seconds: 2), () {
      Navigator.pushReplacement(
          context,
          MaterialPageRoute(
            builder: (context) => const HomeScreen(),
          ));
    });
  }

  @override
  Widget build(BuildContext context) {
    final height = MediaQuery.sizeOf(context).height * 1;
    final width = MediaQuery.sizeOf(context).width * 1;
    return Scaffold(
        body: Column(
      mainAxisAlignment: MainAxisAlignment.center,
      children: [
        Image.asset(
          'images/splash_pic.jpg',
          fit: BoxFit.cover,
          width: width * .9,
          height: height * .5,
        ),
        SizedBox(
          height: height * 0.04,
        ),
        Text('TOP HEADLINES',
            style: GoogleFonts.anton(
                letterSpacing: .6,
                color: const Color.fromARGB(255, 13, 12, 12))),
        SizedBox(
          height: height * 0.04,
        ),
        const SpinKitChasingDots(
          color: Colors.blue,
          size: 40,
        ),
      ],
    ));
  }
}
