// ignore_for_file: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/controller/adventuregames.dart';
import 'package:gm_adventure/controller/getcontroller.dart';
import 'package:gm_adventure/controller/topgame.dart';
import 'package:gm_adventure/model/favorite_model.dart';
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

  void checkInternet() async {
    // await controller.internetConnection();
  }

  @override
  void initState() {
    super.initState();
    topgamecontroller.fetchTopgames();
    adventureGameController.fetchAllGames();
    // checkInternet();
  }

  @override
  Widget build(BuildContext context) {
    Controller controller = Get.put(Controller());
    bool favgame = controller.isFavorite.value;

    return Obx(()=> topgamecontroller.isLoading.value &&
                    adventureGameController.isLoading.value ? CustomScrollView(
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
                    borderRadius: const BorderRadius.all(Radius.circular(5.0)),
                    child: Stack(
                      children: <Widget>[
                        Obx(
                          () => topgamecontroller.isLoading.value
                              ? InkWell(
                                  onTap: () {
                                    Get.to(
                                      Obx(
                                        () => topgamecontroller.isLoading.value
                                            ? GameWebview(
                                                weburl: topgamecontroller
                                                    .topgamelist[itemIndex]
                                                    .website)
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
                Get.to(
                  Obx(
                    () => adventureGameController.isLoading.value
                        ? GameWebview(
                            weburl:
                                adventureGameController.allgame[index].website)
                        : const SizedBox(),
                  ),
                );
              },
              child: Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 6, horizontal: 10),
                child: Column(
                  children: [
                    Stack(
                      children: [
                        Container(
                          height: MediaQuery.of(context).size.height * .11,
                          decoration: BoxDecoration(
                            color: Colors.grey,
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: Obx(
                            () => adventureGameController.isLoading.value
                                ? ClipRRect(
                                    borderRadius: BorderRadius.circular(15),
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
                              controller.isFavorite.value !=
                                  controller.isFavorite.value;
                              print(controller.isFavorite.value);

                              // var name =
                              //     adventureGameController.allgame[index].name;
                              // var img =
                              //     adventureGameController.allgame[index].image;
                              // FavoriteGame favoriteGame =
                              //     FavoriteGame(name: name, image: img);
                              // var box = await Hive.openBox<FavoriteGame>(
                              //     'favoritegame');
                              // box.add(favoriteGame);
                            },
                            child: const Icon(
                              Icons.favorite_border_rounded,
                              color: Colors.red,
                            ),
                          ),
                        )
                      ],
                    ),
                    Expanded(
                      child: Obx(() => adventureGameController.isLoading.value
                          ? Text(
                              adventureGameController.allgame[index].name,
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
    ) : Center(child: const CircularProgressIndicator()));
  }
}
