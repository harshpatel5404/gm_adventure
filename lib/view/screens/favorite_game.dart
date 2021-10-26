import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/controller/favarite_controller.dart';
import 'package:gm_adventure/model/favorite_model.dart';
import 'package:hive/hive.dart';

class FavoriteGameScreen extends StatefulWidget {
  const FavoriteGameScreen({Key? key}) : super(key: key);

  @override
  _FavoriteGameScreenState createState() => _FavoriteGameScreenState();
}

class _FavoriteGameScreenState extends State<FavoriteGameScreen> {
  List datalist = [];
  void favoriteListData() async {
    var box = await Hive.openBox<FavoriteGame>("favoritegame");
    datalist = box.values.toList();
  }

  @override
  void initState() {
    super.initState();
    favoriteListData();
  }

  @override
  Widget build(BuildContext context) {
    FavoriteController favoriteController = Get.put(FavoriteController());
    return  ListView.builder(
            itemCount: favoriteController.favoritelist.length,
            itemBuilder: (BuildContext context, int index) {
              return Padding(
                padding: const EdgeInsets.all(10.0),
                child: Container(
                  height: MediaQuery.of(context).size.height * .25,
                  child: Text(favoriteController.favoritelist[index].toString() ),
                ),
              );
            },
       
       
          );
  }
}
