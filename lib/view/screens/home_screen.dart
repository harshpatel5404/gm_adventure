import 'package:adventuregame/controller/getcontroller.dart';
import 'package:adventuregame/view/widgets/drawer.dart';
import 'package:adventuregame/view/widgets/gameslider.dart';
import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:get/get.dart';

import 'favorite_game.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  late PageController _pageController;
  Controller controller = Get.put(Controller());

  @override
  void initState() {
    super.initState();
    _pageController = PageController();
  }

  @override
  void dispose() {
    _pageController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    Size size = MediaQuery.of(context).size;

    return Obx(
      () => controller.isIntenet.value
          ? Scaffold(
              // backgroundColor: Colors.black12,
              appBar: AppBar(
                title: Text("Adventure Game"),
                centerTitle: true,
              ),
              drawer: const Drawerbar(),
              body: SizedBox.expand(
                child: PageView(
                  controller: _pageController,
                  onPageChanged: (index) {
                    setState(() => controller.currentIndex.value = index);
                  },
                  children: const <Widget>[GameSlider(), FavoriteGameScreen()],
                ),
              ),
              bottomNavigationBar: Obx(
                () => BottomNavyBar(
                  backgroundColor: Colors.white,
                  selectedIndex: controller.currentIndex.value,
                  onItemSelected: (index) {
                    controller.currentIndex.value = index;
                    _pageController.jumpToPage(index);
                  },
                  items: <BottomNavyBarItem>[
                    BottomNavyBarItem(
                      icon: Icon(Icons.home),
                      title: Text('Home'),
                      activeColor: Colors.red,
                    ),
                    BottomNavyBarItem(
                        icon: Icon(Icons.favorite),
                        title: Text('Favorite'),
                        activeColor: Colors.green),
                  ],
                ),
              ))
          : Scaffold(
            backgroundColor: Colors.black,
              body: AlertDialog(
                title: Text("Alert"),
                content: Text("You are Not Connected to the Internet"),
                actions: [
                  ElevatedButton(
                      onPressed: () {
                        controller.getConnect();
                      },
                      child: Text("Ok"))
                ],
              ),
            ),
    );
  }
}
