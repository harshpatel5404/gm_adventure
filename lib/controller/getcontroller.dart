import 'dart:io';
import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';


class Controller extends GetxController{
  var currentIndex = 0.obs;
  RxBool isIntenet = false.obs;
  RxBool isPermission = false.obs;
  RxBool isFavorite = false.obs;
  RxBool isAds = false.obs;
  void getConnect() async {
    var connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.none) {
       isIntenet.value = false;
    } else if (connectivityResult == ConnectivityResult.mobile) {
      isIntenet.value = true;
    } else if (connectivityResult == ConnectivityResult.wifi) {
      isIntenet.value = true;
    }
  }

  // Future<bool> internetConnection() async {
  //   var connectivityResult = await (Connectivity().checkConnectivity());
  //   if (connectivityResult == ConnectivityResult.mobile) {
  //     // I am connected to a mobile network, make sure there is actually a net connection.
  //     try {
  //       final result = await InternetAddress.lookup('example.com');
  //       isIntenet.value = true;
  //       return true;
  //     } on SocketException catch (_) {
  //        isIntenet.value = false;
  //       return false;
  //     }
  //   } else if (connectivityResult == ConnectivityResult.wifi) {
  //     // I am connected to a WIFI network, make sure there is actually a net connection.
  //     try {
  //       final result = await InternetAddress.lookup('example.com');
  //        isIntenet.value = true;
  //       return true;
  //     } on SocketException catch (_) {
  //        isIntenet.value = false;
  //       return false;
  //     }
  //   } else {
  //     // Neither mobile data or WIFI detected, not internet connection found.
  //       isIntenet.value = false;
  //     return false;
  //   }
  // }
  
}