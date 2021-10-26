import 'package:get/get.dart';
import 'package:gm_adventure/api/connection.dart';
import 'package:gm_adventure/model/allgameresponse.dart';
import 'package:gm_adventure/model/topgamesresponse.dart';

class AdventureGameController extends GetxController {
   RxList allgame = [].obs;
    RxBool isLoading = false.obs;

  void fetchAllGames() async {
    AllGamesResponse? game = await getAllGame();
    if (game != null) {
      allgame.value = game.data!;
      isLoading.value = true;
      print(game.data![0].website);
    }
  }
}
