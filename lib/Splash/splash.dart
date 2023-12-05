// ignore: use_build_context_synchronously

// ignore_for_file: prefer_const_literals_to_create_immutables, prefer_const_constructors

import 'package:flutter/material.dart';
import 'package:vivacity_app/InitialCarousel/carousel.dart';
import 'package:vivacity_app/home/home.dart';
import 'package:vivacity_app/navigation.dart';

class Splash extends StatefulWidget {
  const Splash({super.key});

  @override
  State<Splash> createState() => _SplashState();
}

class _SplashState extends State<Splash> {
  @override
  void initState() {
    super.initState();
    _navigateToHome();
  }

  _navigateToHome() async {
    await Future.delayed(const Duration(milliseconds: 100), () {});
    Navigator.pushReplacement(
        context, MaterialPageRoute(builder: (context) => InitialCarousel()));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Container(
            width: double.infinity,
            decoration: const BoxDecoration(
                /*image: DecorationImage(image: AssetImage('yes.jpeg'))*/
                gradient: LinearGradient(
              begin: Alignment.topCenter,
              end: Alignment.bottomCenter,
              colors: <Color>[
                Color(0xFF48448C), // Hex color code for 48448C
                Color(0xFF7B66FF), // Hex color code for 7B66FF
              ],
            )),
            child: Stack(
              children: [
                Image.asset("assets/splash/splash_city_background.png"),
                Image.asset("assets/splash/splash_logo_background.png")
              ],
            )),
      ),
    );
  }
}
