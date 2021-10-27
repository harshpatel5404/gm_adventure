// ignore_for_file: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/controller/adventuregames.dart';
import 'package:gm_adventure/controller/favarite_controller.dart';
import 'package:gm_adventure/controller/getcontroller.dart';
import 'package:gm_adventure/controller/topgame.dart';
import 'package:gm_adventure/model/favorite_model.dart';
import 'package:gm_adventure/view/screens/game_description.dart';
import 'package:gm_adventure/view/screens/gamewebview.dart';
import 'package:hive/hive.dart';

class GameSlider extends StatefulWidget {
  const GameSlider({Key? key}) : super(key: key);

  @override
  _GameSliderState createState() => _GameSliderState();
}

class _GameSliderState extends State<GameSlider> {
  TopGameController topgamecontroller = Get.put(TopGameController());
  AdventureGameController adventureGameController =
      Get.put(AdventureGameController());

  Controller controller = Get.put(Controller());
  FavoriteController favoriteController = Get.put(FavoriteController());

  @override
  void initState() {
    super.initState();
    topgamecontroller.fetchTopgames();
    adventureGameController.fetchAllGames();
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());

    return Obx(() => topgamecontroller.isLoading.value &&
            adventureGameController.isLoading.value
        ? CustomScrollView(
            slivers: [
              const SliverToBoxAdapter(
                child: SizedBox(
                  height: 15,
                ),
              ),
              SliverToBoxAdapter(
                child: CarouselSlider.builder(
                  itemCount: topgamecontroller.isLoading.value &&
                          adventureGameController.isLoading.value
                      ? topgamecontroller.topgamelist.length
                      : 10,
                  itemBuilder:
                      (BuildContext context, int itemIndex, int pageViewIndex) {
                    return Container(
                      margin: const EdgeInsets.all(5.0),
                      child: ClipRRect(
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5.0)),
                          child: Stack(
                            children: <Widget>[
                              Obx(
                                () => topgamecontroller.isLoading.value
                                    ? InkWell(
                                        onTap: () {
                                          var name = topgamecontroller
                                              .topgamelist[itemIndex].name;
                                          var description = topgamecontroller
                                              .topgamelist[itemIndex]
                                              .description;
                                          var website = topgamecontroller
                                              .topgamelist[itemIndex].website;
                                          var image = topgamecontroller
                                              .topgamelist[itemIndex].image;
                                          var icon = topgamecontroller
                                              .topgamelist[itemIndex].icon;
                                          Get.to(
                                            Obx(
                                              () => topgamecontroller
                                                      .isLoading.value
                                                  ?
                                                  
                                                   GameDescription(
                                                      name: name,
                                                      desc: description,
                                                      icon: icon,
                                                      image: image,
                                                      website: website,
                                                    )
                                                  : const SizedBox(),
                                            ),
                                          );
                                        },
                                        child: Image.network(
                                          "https://kurminfotech.in/gamemania/" +
                                              topgamecontroller
                                                  .topgamelist[itemIndex].image,
                                          fit: BoxFit.cover,
                                          width: 1000,
                                          height: 1000,
                                        ),
                                      )
                                    : const Center(
                                        child: SizedBox(),
                                      ),
                              ),
                              Positioned(
                                bottom: 0.0,
                                left: 0.0,
                                right: 0.0,
                                child: Container(
                                  // ignore: prefer_const_constructors
                                  decoration: BoxDecoration(
                                    gradient: const LinearGradient(
                                      colors: [
                                        Color.fromARGB(200, 0, 0, 0),
                                        Color.fromARGB(0, 0, 0, 0)
                                      ],
                                      begin: Alignment.bottomCenter,
                                      end: Alignment.topCenter,
                                    ),
                                  ),
                                  padding: const EdgeInsets.symmetric(
                                      vertical: 10.0, horizontal: 20.0),
                                  child: Obx(
                                    () => topgamecontroller.isLoading.value
                                        ? Text(
                                            topgamecontroller
                                                .topgamelist[itemIndex].name,
                                            style: const TextStyle(
                                              color: Colors.white,
                                              fontSize: 20.0,
                                              // fontWeight: FontWeight.bold,
                                            ),
                                          )
                                        : const SizedBox(),
                                  ),
                                ),
                              ),
                            ],
                          )),
                    );
                  },
                  options: CarouselOptions(
                    autoPlay: true,
                    aspectRatio: 1.8,
                    enlargeCenterPage: true,
                  ),
                ),
              ),
              SliverGrid(
                gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                  crossAxisCount: 3,
                ),
                delegate: SliverChildBuilderDelegate(
                    (BuildContext context, int index) {
                  return InkWell(
                    onTap: () {
                      var name = adventureGameController.allgame[index].name;
                      var description =
                          adventureGameController.allgame[index].description;
                      var website =
                          adventureGameController.allgame[index].website;
                      var image = adventureGameController.allgame[index].image;
                      var icon = adventureGameController.allgame[index].icon;
                      Get.to(
                        Obx(
                          () => topgamecontroller.isLoading.value
                              ? GameDescription(
                                  name: name,
                                  desc: description,
                                  icon: icon,
                                  image: image,
                                  website: website,
                                )
                              : const SizedBox(),
                        ),
                      );
                    },
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          vertical: 6, horizontal: 10),
                      child: Column(
                        children: [
                          Stack(
                            children: [
                              Container(
                                height:
                                    MediaQuery.of(context).size.height * .11,
                                    width : MediaQuery.of(context).size.width* .25,
                                decoration: BoxDecoration(
                                  color: Colors.grey,
                                  borderRadius: BorderRadius.circular(15),
                                ),
                                child: Obx(
                                  () => adventureGameController.isLoading.value
                                      ? ClipRRect(
                                          borderRadius:
                                              BorderRadius.circular(15),
                                          child: Image.network(
                                            "https://kurminfotech.in/gamemania/" +
                                                adventureGameController
                                                    .allgame[index].image,
                                            fit: BoxFit.cover,
                                          ),
                                        )
                                      : const Center(
                                          child: SizedBox(),
                                        ),
                                ),
                              ),
                              Positioned(
                                right: 5,
                                top: 5,
                                child: InkWell(
                                  onTap: () async {
                                    // print(favoriteController.favoritelist);
                                    if (favoriteController.favoritelist
                                        .contains(adventureGameController
                                            .allgame[index].id)) {
                                      // print("call id : ");
                                      final box = Hive.box<FavoriteGame>(
                                          'favoritegame');
                                      box.delete(adventureGameController
                                          .allgame[index].id);

                                      favoriteController.favoritelist.remove(
                                          adventureGameController
                                              .allgame[index].id);
                                    } else {
                                      var name = adventureGameController
                                          .allgame[index].name;
                                      var img = adventureGameController
                                          .allgame[index].image;
                                      var id = adventureGameController
                                          .allgame[index].id;
                                      var website = adventureGameController
                                          .allgame[index].website;
                                      var description = adventureGameController
                                          .allgame[index].description;
                                      var icon = adventureGameController
                                          .allgame[index].icon;

                                      FavoriteGame favoriteGame = FavoriteGame(
                                          name: name,
                                          image: img,
                                          description: description,
                                          icon: icon,
                                          id: id,
                                          website: website);
                                      var box =
                                          await Hive.openBox<FavoriteGame>(
                                              'favoritegame');
                                      box.put(
                                          adventureGameController
                                              .allgame[index].id,
                                          favoriteGame);

                                      favoriteController.favoritelist.add(
                                          adventureGameController
                                              .allgame[index].id);


                                    }
                                  },
                                  child: Obx(
                                    () => favoriteController.favoritelist
                                            .contains(adventureGameController
                                                .allgame[index].id)
                                        ? const Icon(
                                            CupertinoIcons.heart_fill,
                                            color: Colors.red,
                                          )
                                        : const Icon(
                                            CupertinoIcons.heart,
                                            color: Colors.red,
                                          ),
                                  ),
                                ),
                              )
                            ],
                          ),
                          Expanded(
                            child: Obx(
                                () => adventureGameController.isLoading.value
                                    ? Text(
                                        adventureGameController
                                            .allgame[index].name,
                                        textAlign: TextAlign.center,
                                      )
                                    : SizedBox()),
                          ),
                        ],
                      ),
                    ),
                  );
                },
                    childCount: adventureGameController.isLoading.value
                        ? adventureGameController.allgame.length
                        : null),
              )
            ],
          )
        : Center(child: const CircularProgressIndicator()));
  }
}
