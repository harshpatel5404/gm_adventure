import 'package:bottom_navy_bar/bottom_navy_bar.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:gm_adventure/controller/getcontroller.dart';
import 'package:gm_adventure/view/widgets/drawer.dart';
import 'package:gm_adventure/view/widgets/gameslider.dart';

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

    return Scaffold(
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
            children: <Widget>[
            const GameSlider(),
              Container(
                color: Colors.red,
              ),
            ],
          ),
        ),
        bottomNavigationBar: Obx(
          () => BottomNavyBar(
            selectedIndex: controller.currentIndex.value,
            onItemSelected: (index) {
              controller.currentIndex.value = index;
              _pageController.jumpToPage(index);
            },
            items: <BottomNavyBarItem>[
              BottomNavyBarItem(
                icon: Icon(Icons.apps),
                title: Text('Home'),
                activeColor: Colors.red,
              ),
              BottomNavyBarItem(
                  icon: Icon(Icons.favorite),
                  title: Text('Favorite'),
                  activeColor: Colors.green),
            ],
          ),
        ));
  }
}
