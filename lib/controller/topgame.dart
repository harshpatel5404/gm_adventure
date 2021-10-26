import 'package:get/get.dart';
import 'package:gm_adventure/api/connection.dart';
import 'package:gm_adventure/model/topgamesresponse.dart';

class TopGameController extends GetxController {
   RxList topgamelist = [].obs;
    RxBool isLoading = false.obs;

  void fetchTopgames() async {
    TopGame? topgame = await getTopGame();
    if (topgame != null) {
      topgamelist.value = topgame.data;
      isLoading.value = true;
      // print(" sd ${topgame.data[0].image}");
    }
  }
}