import 'package:adventuregame/api/connection.dart';
import 'package:adventuregame/model/topgamesresponse.dart';
import 'package:get/get.dart';

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