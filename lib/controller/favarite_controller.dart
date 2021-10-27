import 'package:get/get.dart';
import 'package:gm_adventure/model/favorite_model.dart';
import 'package:hive/hive.dart';

class FavoriteController extends GetxController {
  RxList favoritelist = [].obs;
  List datalist = [].obs;
  


  void getFavlist() async {
    var box = await Hive.openBox<FavoriteGame>("favoritegame");
    datalist = box.values.toList();
    if (datalist.isNotEmpty) {
      for (int i = 0; i < datalist.length; i++) {
        favoritelist.add(datalist[i].id);
      }
    }
  }
}
