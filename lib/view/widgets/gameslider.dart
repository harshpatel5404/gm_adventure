// ignore_for_file: file_names
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/controller/adventuregames.dart';
import 'package:gm_adventure/controller/getcontroller.dart';
import 'package:gm_adventure/controller/topgame.dart';
import 'package:gm_adventure/view/screens/gamewebview.dart';

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
    return CustomScrollView(
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
              print("object $itemIndex");
              return Obx(() => topgamecontroller.isLoading.value
                  ? Container(
                      margin: EdgeInsets.all(6.0),
                      decoration: BoxDecoration(
                        borderRadius: BorderRadius.circular(8.0),
                        image: DecorationImage(
                          image: NetworkImage(
                              "https://kurminfotech.in/gamemania/" +
                                  topgamecontroller
                                      .topgamelist[itemIndex].image),
                          fit: BoxFit.cover,
                        ),
                      ),
                    )
                  : const Center(child: CircularProgressIndicator()));
            },
            options: CarouselOptions(
              autoPlay: true,
              aspectRatio: 1.9,
              enlargeCenterPage: true,
            ),
          ),
        ),
        SliverGrid(
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 2,
          ),
          delegate: SliverChildBuilderDelegate(
              (BuildContext context, int index) {
            return Padding(
              padding: const EdgeInsets.all(10),
              child: InkWell(
                onTap: () {
                  // adventureGameController.isLoading.value
                  //     ? Get.to(GameWebView(
                  //         weburl:
                  //             adventureGameController.allgame[index].website))
                  //     : SizedBox();
                  // Get.to(
                  //   Obx(
                  //     () => adventureGameController.isLoading.value
                  //         ? GameWebView(
                  //             weburl: adventureGameController
                  //                 .allgame[index].website)
                  //         : SizedBox(),
                  //   ),
                  // );
                },
                child: Container(
                    decoration: BoxDecoration(
                      color: Colors.grey,
                      borderRadius: BorderRadius.circular(25),
                    ),
                    child: Obx(() => adventureGameController.isLoading.value
                        ? ClipRRect(
                            borderRadius: BorderRadius.circular(25),
                            child: Image.network(
                              "https://kurminfotech.in/gamemania/" +
                                  adventureGameController.allgame[index].image,
                              fit: BoxFit.cover,
                            ),
                          )
                        : const Center(
                            child: CircularProgressIndicator(),
                          ))),
              ),
            );
          },
              childCount: adventureGameController.isLoading.value
                  ? adventureGameController.allgame.length
                  : null),
        )
      ],
    );
  }
}
