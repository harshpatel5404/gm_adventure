import 'dart:async';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'home_screen.dart';

class SplashScreen extends StatefulWidget {
  const SplashScreen({Key? key}) : super(key: key);

  @override
  State<SplashScreen> createState() => _SplashScreenState();
}

class _SplashScreenState extends State<SplashScreen> {
  @override
  void initState() {
    super.initState();
    Timer(
        const Duration(seconds: 3),
        () => Get.off(HomeScreen()));
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      // color: Colors.white,
      height: MediaQuery.of(context).size.height,
      child: Center(
        child: Image.asset("assets/logo.png"),
      ),
    );
  }
}
