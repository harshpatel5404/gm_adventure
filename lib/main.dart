import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'view/screens/splash_screen.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return GetMaterialApp(
      title: 'Game Mania Adventure',
      theme: ThemeData(
        primarySwatch: Colors.blueGrey,
      ),
      home:const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}