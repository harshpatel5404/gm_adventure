import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adventuregame/controller/favarite_controller.dart';
import 'package:adventuregame/controller/getcontroller.dart';
import 'package:adventuregame/model/favorite_model.dart';
import 'package:hive/hive.dart';
import 'package:path_provider/path_provider.dart';
import 'package:unity_ads_plugin/unity_ads.dart';
import 'view/screens/splash_screen.dart';

FavoriteController favoriteController = Get.put(FavoriteController());

Future<void> main() async {
  WidgetsFlutterBinding.ensureInitialized();
  Directory directory = await getApplicationDocumentsDirectory();
  Hive.init(directory.path);
  Hive.registerAdapter(FavoriteGameAdapter());
  favoriteController.getFavlist();
   SystemChrome.setPreferredOrientations([
    DeviceOrientation.portraitUp,
  ]);
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    SystemChrome.setEnabledSystemUIOverlays([SystemUiOverlay.top]);
    return GetMaterialApp(
      title: 'Adventure Game GM',
      theme: ThemeData(
          primarySwatch: Colors.red,
          backgroundColor: Colors.black87,
          fontFamily: "poppines"),
      home: const SplashScreen(),
      debugShowCheckedModeBanner: false,
    );
  }
}
