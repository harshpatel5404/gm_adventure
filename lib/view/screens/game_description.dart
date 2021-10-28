import 'dart:async';

import 'package:adventuregame/controller/getcontroller.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';
import 'package:adventuregame/controller/getcontroller.dart';
import 'package:adventuregame/view/widgets/drawer.dart';
import 'package:http/http.dart';
import 'package:unity_ads_plugin/unity_ads.dart';

import 'gamewebview.dart';

class GameDescription extends StatefulWidget {
  final image;
  final website;
  final name;
  final desc;
  final icon;
  const GameDescription(
      {Key? key, this.image, this.website, this.name, this.desc, this.icon})
      : super(key: key);

  @override
  _GameDescriptionState createState() => _GameDescriptionState();
}

class _GameDescriptionState extends State<GameDescription> {



  Controller controller = Get.put(Controller());

  void loadVideoAd() async {
    controller.isAds.value = false;
    UnityAds.isReady(placementId: "Rewarded_Android").then((value) {
      if (value == true) {
        UnityAds.showVideoAd(
            placementId: "Rewarded_Android",
            listener: (state, args) {
              if (state == UnityAdState.complete) {
                controller.isAds.value = true;
                print("VIDEO IS COMPLETED");
              } else if (state == UnityAdState.skipped) {
                print("VIDEO IS SKIPPED");
              }
            });
      } else {
        print("AD IS NOT READY");
      }
    });
  }

  @override
  void initState() {
    super.initState();
    UnityAds.init(
      gameId: "4424597",
    );
    loadVideoAd();

     Timer(const Duration(seconds: 3), () {
controller.isAds.value =true;
     });
  }

  @override
  Widget build(BuildContext context) {
  //  print("imggg");
  //  print(widget.image);

    return Obx(
      () => controller.isAds.value
          ? Scaffold(
            backgroundColor: Colors.white,
              appBar: AppBar(
                title: Text("Adventure Game"),
                centerTitle: true,
              ),
              drawer: const Drawerbar(),
              body: ListView(
                children: [
                  Container(
                    child: Stack(
                      children: <Widget>[
                        InkWell(
                          onTap: () {
                            Get.to(
                              GameWebview(weburl: widget.website),
                            );
                          },
                          child: Image.network(
                            "https://kurminfotech.in/gamemania/" + widget.image,
                            fit: BoxFit.fill,
                            width: MediaQuery.of(context).size.width,
                            height: MediaQuery.of(context).size.height * 0.33,
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
                          ),
                        ),
                      ],
                    ),
                  ),
                  Container(
                    height: MediaQuery.of(context).size.height * 0.50,
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.spaceAround,
                      crossAxisAlignment: CrossAxisAlignment.center,
                      children: [
                        SizedBox(
                          height: 5,
                        ),
                        Container(
                          // height: MediaQuery.of(context).size.height*0.25,
                          // width: MediaQuery.of(context).size.width*0.25,
                          height: 110,
                          width: 110,
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(15),
                          ),
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(15),
                            child: Image.network(
                              "https://kurminfotech.in/gamemania/" +
                                  widget.icon,
                              fit: BoxFit.cover,
                            ),
                          ),
                        ),
                        Column(
                          children: [
                            Text(
                              widget.name,
                              textAlign: TextAlign.center,
                              softWrap: true,
                              style: const TextStyle(
                                fontSize: 17.0,
                                fontWeight: FontWeight.bold,
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 17, vertical: 5),
                              child: Text(
                                widget.desc,
                                textAlign: TextAlign.center,
                                softWrap: true,
                                style: const TextStyle(
                                  fontSize: 15.0,
                                ),
                              ),
                            ),
                          ],
                        ),
                        ElevatedButton(
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 15, vertical: 7),
                              child: Text("Start game".toUpperCase(),
                                  style: TextStyle(fontSize: 18)),
                            ),
                            style: ButtonStyle(
                                foregroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.white),
                                backgroundColor:
                                    MaterialStateProperty.all<Color>(
                                        Colors.red),
                                shape: MaterialStateProperty.all<
                                        RoundedRectangleBorder>(
                                    RoundedRectangleBorder(
                                        borderRadius: BorderRadius.circular(25),
                                        side: BorderSide(color: Colors.red)))),
                            onPressed: () => Get.to(
                                  GameWebview(
                                    weburl: widget.website,
                                  ),
                                )),
                        Container(child: const UnityBannerAd(placementId: "Banner_Android")),
                      ],
                    ),
                  )
                ],
              ),
            )
          : Center(
              child: CircularProgressIndicator(),
            ),
    );
  }
}
