import 'package:adventuregame/api/connection.dart';
import 'package:adventuregame/model/allgameresponse.dart';
import 'package:get/get.dart';

class AdventureGameController extends GetxController {
   RxList allgame = [].obs;
    RxBool isLoading = false.obs;

  void fetchAllGames() async {
    AllGamesResponse? game = await getAllGame();
    if (game != null) {
      allgame.value = game.data!;
      isLoading.value = true;
    }
  }
}
