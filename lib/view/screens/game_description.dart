import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/view/widgets/drawer.dart';

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
  @override
  void initState() {
    super.initState();
    print(widget.website);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
            height: MediaQuery.of(context).size.height * 0.5,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                SizedBox(
                  height: 10,
                ),
                Container(
                  // height: MediaQuery.of(context).size.height*0.25,
                  // width: MediaQuery.of(context).size.width*0.25,
                  height: 120,
                  width: 120,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(15),
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(15),
                    child: Image.network(
                      "https://kurminfotech.in/gamemania/" + widget.icon,
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
                        horizontal: 15, vertical: 10),
                    child: Text("Start game".toUpperCase(),
                        style: TextStyle(fontSize: 18)),
                  ),
                  style: ButtonStyle(
                      foregroundColor:
                          MaterialStateProperty.all<Color>(Colors.white),
                      backgroundColor:
                          MaterialStateProperty.all<Color>(Colors.red),
                      shape: MaterialStateProperty.all<RoundedRectangleBorder>(
                          RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(25),
                              side: BorderSide(color: Colors.red)))),
                  onPressed: () => Get.to(GameWebview(
                    weburl: widget.website,
                  ),)
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
