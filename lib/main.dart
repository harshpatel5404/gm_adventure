import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'view/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return GetMaterialApp(
      title: 'Game Mania Adventure',
      theme: ThemeData(
        primarySwatch: Colors.red,
        backgroundColor: Colors.black87,
        fontFamily: "poppines"

      ),
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}